// import 'dart:html';

// import 'dart:html';

import 'dart:io';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/fonts/big_text.dart';

class Profile extends StatelessWidget {
  String? email;
  Profile({Key? key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 120),
              child: BigText(
                text: "Profile",
                colors: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                  radius: 75, backgroundImage: Image.file(File("")).image

                  // child: Image(
                  //   fit: BoxFit.cover,
                  //   image: NetworkImage(
                  //       homeController.selectedImagePath.value),
                  // ))
                  ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Select one of them"),
                      // content: const Text("You have raised a Alert Dialog Box"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // homeController.getImage(ImageSource.camera);
                          },
                          child: Container(
                            color: AppColors.appColor,
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: const Text(
                              "Camera",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // homeController.getImage(ImageSource.gallery);
                          },
                          child: Container(
                            color: AppColors.appColor,
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: const Text(
                              "Gallery",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                  // homeController.getImage(ImageSource.camera);
                },
                child: Positioned(
                    // bottom: 20,
                    // right: 20,
                    // right: ,
                    child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.appColor),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 20,
                    color: Colors.white,
                  ),
                )),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          BigText(
            text: email.toString(),
            colors: Colors.black,
            size: 16,
          ),
          const SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(
                  top: 15, right: 15, left: 15, bottom: 15),
              decoration: BoxDecoration(
                  color: AppColors.appColor,
                  borderRadius: BorderRadius.circular(15)),
              child: const BigText(
                text: "Log out",
                colors: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
