import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/fonts/big_text.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 230, 230),
      appBar: AppBar(
          title: const Center(
            child: BigText(
              text: "Your history",
              colors: Colors.white,
              size: 25,
            ),
          ),
          backgroundColor: AppColors.appColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: GestureDetector(
                // onTap: () {
                //   if (controller!.totalItems >= 1) {
                //     Get.to(CartPage());
                //   } else {
                //     Get.snackbar(
                //         "Item count", "You shoud at least add one item!",
                //         colorText: Colors.white,
                //         backgroundColor: AppColors.appColor);
                //   }
                // },
                child: const Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ]),
    );
  }
}
