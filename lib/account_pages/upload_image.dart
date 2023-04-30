// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// import '../style.dart';

// class UploadImage extends StatefulWidget {
//   VoidCallback takePic;
//   VoidCallback takeGall;
//   UploadImage(
//       {super.key,
//       this.imageFile,
//       required this.takePic,
//       required this.takeGall});
//   File? imageFile;

//   @override
//   State<UploadImage> createState() => _UploadImageState();
// }

// class _UploadImageState extends State<UploadImage> {
//   // File? imageFile;

//   // void selectImage(ImageSource source) async {
//   //   XFile? pickedImage = await ImagePicker().pickImage(source: source);

//   //   if (pickedImage != null) {
//   //     cropImage(pickedImage);
//   //   }
//   // }

//   // void cropImage(XFile file) async {
//   //   CroppedFile? croppedImage = await ImageCropper().cropImage(
//   //       cropStyle: CropStyle.circle,
//   //       compressQuality: 30,
//   //       sourcePath: file.path);
//   //   if (croppedImage != null) {
//   //     setState(() {
//   //       imageFile = File(croppedImage.path);
//   //     });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       CircleAvatar(
//         radius: 55.r,
//         backgroundColor: kDarkColor,
//         backgroundImage: FileImage(imageFile!),
//         child: (imageFile == null)
//             ? const Icon(Icons.image, size: 50, color: kSecondayColor)
//             : null,
//       ),
//       Positioned(
//           right: 0,
//           bottom: 0,
//           child: Container(
//               height: 45.h,
//               width: 45.w,
//               decoration: const BoxDecoration(
//                   color: kPrimaryColor, shape: BoxShape.circle),
//               child: PopupMenuButton(
//                   icon: const Icon(Icons.edit_document, color: kDarkColor),
//                   color: kPrimaryColor,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   itemBuilder: (context) => [
//                         PopupMenuItem(
//                             onTap: widget.takePic,
//                             // onTap: () {
//                             //   selectImage(ImageSource.camera);
//                             // },
//                             child: Text("Take Picture",
//                                 style:
//                                     kTitleStyle.copyWith(color: kDarkColor))),
//                         PopupMenuItem(
//                             onTap: widget.takeGall,
//                             // onTap: () {
//                             //   selectImage(ImageSource.gallery);
//                             // },
//                             child: Text("From Gallery",
//                                 style:
//                                     kTitleStyle.copyWith(color: kDarkColor))),
//                       ]))),
//     ]);
//   }
// }
