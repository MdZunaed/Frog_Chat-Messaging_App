import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/account_pages/input_fields/button.dart';
import 'package:frog_chat/account_pages/input_fields/email.dart';
import 'package:frog_chat/account_pages/success.dart';
import 'package:frog_chat/elements/show_toast.dart';
import 'package:frog_chat/models/UserModel.dart';
import 'package:frog_chat/style.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'input_fields/password.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cpassController = TextEditingController();
  File? imageFile;
  String downloadImageUrl = "";

  void selectImage(ImageSource source) async {
    XFile? pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      cropImage(pickedImage);
    }
  }

  void cropImage(XFile file) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        cropStyle: CropStyle.circle,
        compressQuality: 30,
        sourcePath: file.path);
    if (croppedImage != null) {
      setState(() {
        imageFile = File(croppedImage.path);
      });
    }
  }

  void createAccount() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String pass = passController.text.trim();
    String cpass = cpassController.text.trim();
    UserCredential? userCredential;
    UploadTask uploadTask;

    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);
      toast().toastmessage("User created");
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SuccessPage()));
      if (userCredential != null) {
        String uid = userCredential.user!.uid;
        UserModel newUser = UserModel(
          uid: uid,
          name: name,
          email: email,
          pic: downloadImageUrl,
        );
        uploadTask = FirebaseStorage.instance
            .ref("Profile Pictures")
            //.child(widget.userModel!.uid.toString())
            .child(FirebaseAuth.instance.currentUser!.uid)
            .putFile(File(imageFile!.path));

        TaskSnapshot snapshot = await uploadTask.whenComplete(() {});

        String imageUrl = await snapshot.ref.getDownloadURL();
        downloadImageUrl = imageUrl;
        await FirebaseFirestore.instance
            .collection("users")
            .doc(uid)
            //.set(newUser.toMap());
            .set({
          "uid": uid,
          "name": name,
          "email": email,
          "password": pass,
          "url": downloadImageUrl
        });
      }
    } on FirebaseAuthException catch (error) {
      toast().toastmessage(error.message!);
      setState(() {
        loading = false;
      });
    }
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text("Sign up - Frog Chat", style: kHeadingStyle)
                  ]),
                  gap,
                  Stack(children: [
                    CircleAvatar(
                      radius: 55.r,
                      backgroundColor: kDarkColor,
                      backgroundImage:
                          (imageFile != null) ? FileImage(imageFile!) : null,
                      child: (imageFile == null)
                          ? const Icon(Icons.image,
                              size: 50, color: kSecondayColor)
                          : null,
                    ),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                            height: 45.h,
                            width: 45.w,
                            decoration: const BoxDecoration(
                                color: kPrimaryColor, shape: BoxShape.circle),
                            child: PopupMenuButton(
                                icon: const Icon(Icons.edit_document,
                                    color: kDarkColor),
                                color: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                          onTap: () {
                                            selectImage(ImageSource.camera);
                                          },
                                          child: Text("Take Picture",
                                              style: kTitleStyle.copyWith(
                                                  color: kDarkColor))),
                                      PopupMenuItem(
                                          onTap: () {
                                            selectImage(ImageSource.gallery);
                                          },
                                          child: Text("From Gallery",
                                              style: kTitleStyle.copyWith(
                                                  color: kDarkColor))),
                                    ]))),
                  ]),
                  gap,
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text("Step-1",
                        style: kTitleStyle, textAlign: TextAlign.start)
                  ]),
                  gap,
                  InputField(
                      controller: nameController, text: "Enter your full name"),
                  gap,
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text("Step-2",
                        style: kTitleStyle, textAlign: TextAlign.start)
                  ]),
                  gap,
                  InputField(
                      controller: emailController, text: "Your Email Address"),
                  gap,
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text("Step-3",
                        style: kTitleStyle, textAlign: TextAlign.start)
                  ]),
                  gap,
                  PasswordField(
                      controller: passController,
                      hintText: "Enter yout Password"),
                  gap,
                  PasswordField(
                      controller: cpassController,
                      hintText: "Confirm Password"),
                  gap,
                  gap,
                  gap,
                  loading
                      ? const CircularProgressIndicator()
                      : InkWell(
                          child: Button(text: "Sign Up"),
                          onTap: () {
                            setState(() {
                              loading = true;
                            });
                            createAccount();
                            //Navigator.push(context,MaterialPageRoute(builder: (context) => const OtpPage()));
                          },
                        ),
                ]),
          ),
        ),
      ),
    );
  }
}
