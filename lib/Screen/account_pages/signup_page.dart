import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/account_pages/success_page.dart';
import 'package:frog_chat/models/UserModel.dart';
import 'package:frog_chat/style.dart';
import 'package:frog_chat/widget/button.dart';
import 'package:frog_chat/widget/email_field.dart';
import 'package:frog_chat/widget/password_field.dart';
import 'package:frog_chat/widget/show_toast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController cPassController = TextEditingController();
  bool loading = false;
  File? imageFile;
  String picUrl = "";

  //String downloadImageUrl = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                      hintText: "Enter your Password"),
                  gap,
                  PasswordField(
                      controller: cPassController,
                      hintText: "Confirm Password"),
                  gap,
                  gap,
                  gap,
                  loading
                      ? const CircularProgressIndicator()
                      : Button(
                          text: "Sign Up",
                          onTap: () {
                            createAccount();
                          },
                        ),
                ]),
          ),
        ),
      ),
    );
  }

  void selectImage(ImageSource source) async {
    XFile? pickedImage = await ImagePicker().pickImage(source: source);

    if (pickedImage != null) {
      cropImage(pickedImage);
    }
  }

  void cropImage(XFile file) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        cropStyle: CropStyle.circle,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 30,
        sourcePath: file.path);
    if (croppedImage != null) {
      setState(() {
        imageFile = File(croppedImage.path);
      });
    }
  }

  void createAccount() async {
    setState(() {
      loading = true;
    });
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String pass = passController.text.trim();
    String cPass = cPassController.text.trim();
    UserModel userModel = UserModel();
    UserCredential? userCredential;
    UploadTask uploadTask;

    if (name == "" || email == "" || pass == "" || cPass == "") {
      toast().toastmessage("fill all the info");
      setState(() {
        loading = false;
      });
    } else if (pass != cPass) {
      toast().toastmessage("password do not match");
      setState(() {
        loading = false;
      });
    } else {
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass);
        toast().toastmessage("User created");
        setState(() {
          loading = false;
        });
        if (mounted) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => SuccessPage(
                        userModel: userModel,
                        firebaseUser: userCredential!.user!,
                      )));
        }

        if (userCredential != null) {
          String uid = userCredential.user!.uid;

          uploadTask = FirebaseStorage.instance
              .ref("Profile Pictures")
              .child(FirebaseAuth.instance.currentUser!.uid)
              .putFile(File(imageFile!.path));

          TaskSnapshot snapshot = await uploadTask;
          String imageUrl = await snapshot.ref.getDownloadURL();
          picUrl = imageUrl;

          UserModel newUser = UserModel(
            uid: uid,
            name: name,
            email: email,
            pic: picUrl,
          );
          userModel = newUser;

          await FirebaseFirestore.instance
              .collection("users")
              .doc(newUser.uid)
              .set(newUser.toMap());
        }
      } on FirebaseAuthException catch (error) {
        toast().toastmessage(error.message!);
        setState(() {
          loading = false;
        });
      }
    }
  }
}
