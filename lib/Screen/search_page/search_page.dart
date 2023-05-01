import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frog_chat/Screen/chat_inbox/chat_inbox.dart';
import 'package:frog_chat/Screen/home_page/homepage_element.dart';
import 'package:frog_chat/elements/show_toast.dart';
import 'package:frog_chat/models/UserModel.dart';
import 'package:frog_chat/style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search here",
            hintStyle: kTitleStyle.copyWith(color: kSecondayColor),
          ),
          style: kTitleStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.search, color: kPrimaryColor))
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20).r,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Recent searches",
                  style: kTitleStyle.copyWith(color: kSecondayColor)),
              TextButton(
                  onPressed: () {
                    toast().toastmessage("Not available right now");
                  },
                  child: Text("Edit",
                      style: kTitleStyle.copyWith(color: kPrimaryColor)))
            ],
          ),
          //gap,
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .where("name", isEqualTo: searchController.text)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;

                  if (dataSnapshot.docs.length > 0) {
                    Map<String, dynamic> userMap =
                        dataSnapshot.docs[0].data() as Map<String, dynamic>;

                    UserModel searchedUser = UserModel.fromMap(userMap);

                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatInbox()));
                      },
                      leading: CircleAvatar(
                          backgroundColor: kSecondayColor,
                          radius: 25,
                          backgroundImage:
                              NetworkImage(searchedUser.pic.toString())),
                      title: Text(searchedUser.name!,
                          style: kTitleStyle.copyWith(fontSize: 18)),
                      subtitle: Text(
                        searchedUser.email!,
                        style: kTextStyle,
                      ),
                    );
                  } else {
                    return const Text("No resuls found!");
                  }
                } else if (snapshot.hasError) {
                  return const Text("An error Occurd!");
                } else {
                  return const Text("No resuls found!");
                }
              } else {
                return CircularProgressIndicator();
              }
            },
          )
          // Expanded(
          //   child: GridView(
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 4),
          //     children: [
          //       ActiveNow(imgName: "sayed.png", name: "Abu Sayed"),
          //       ActiveNow(imgName: "zunu.jpg", name: "Md Zunaed"),
          //       ActiveNow(imgName: "mizan.jpg", name: "Mizan Hossen"),
          //       ActiveNow(imgName: "buira.jpg", name: "Mahmudul"),
          //       ActiveNow(imgName: "alamin.jpg", name: "Alamin hossen"),
          //       ActiveNow(imgName: "alif.jpg", name: "Alif Sarkar"),
          //     ],
          //   ),
          // ),
        ]),
      )),
    );
  }
}
