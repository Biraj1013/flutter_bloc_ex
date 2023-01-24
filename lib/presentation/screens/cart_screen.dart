import 'package:bloctest/logic/bloc/cart_bloc/cart_bloc.dart';
import 'package:bloctest/logic/bloc/cart_bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../logic/bloc/cart_bloc/cart_event.dart';
import '../constants/app_colors.dart';
import '../widGets/fonts/biG_text.dart';
import '../widgets/fonts/grey_text.dart';
import '../widgets/fonts/sub_title.dart';
import '../widgets/navigation.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 230, 230),
        body: Stack(children: [
          Positioned(
              left: 10,
              top: 20 * 3,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      // Get.to(() => const MyHomepage());
                      // Get.toNamed(RouterHelper.getMyHomePage());
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.appColor,
                      child: const Center(
                        child: Icon(Icons.arrow_back_ios,
                            color: Colors.white, size: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const MyHomepage());

                      // Get.toNamed(
                      //   RouterHelper.getMyHomePage(),
                      // );
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.appColor,
                      child:
                          const Icon(Icons.home, color: Colors.white, size: 25),
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.appColor,
                    child: const Icon(Icons.add_shopping_cart,
                        color: Colors.white, size: 25),
                  ),
                ],
              )),
          Positioned(
              top: 100,
              left: 20,
              right: 20,
              bottom: 0,
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is ItemAddToCartState) {
                    return cartItemList(state);
                  } else if (state is ItemAddedToCartState) {
                    return cartItemList(state);
                  } else {
                    return const Center(child: Text("An error"));
                  }
                },
              ))
        ]),
        bottomNavigationBar: Container(
          height: 75,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is ItemAddToCartState) {
                  return bottomNavBar(state);
                } else if (state is ItemAddedToCartState) {
                  return bottomNavBar(state);
                } else {
                  return Container();
                }
              },
            ),
          ),
        ));
  }

  Row bottomNavBar(var state) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Row(children: [
          BigText(text: "\$ ${state.totalAmount}", colors: Colors.grey[500]),
        ]),
      ),
      GestureDetector(
        onTap: () {
          // makeUpProductController.addItem(products);
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.appColor),
          child: const BigText(
            text: "Check out",
            colors: Colors.white,
            size: 16,
          ),
        ),
      ),
    ]);
  }

  SizedBox cartItemList(var state) {
    return SizedBox(
      child: ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            var data = state.products[index];
            return Padding(
              padding:
                  const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // var pageindex =
                      //     Get.find<MakeUpProductController>()
                      //         .makeUpProductList
                      //         .indexOf(cartController
                      //             .getItems[index].product!);

                      // Get.to(PopularproductDetails(
                      //   pageId: pageindex,
                      // ));
                    },
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(data.imageLink.toString()),
                              fit: BoxFit.fill,
                            ),
                            color: Colors.white)),
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(right: 10, left: 5),
                        height: 80,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(12)),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: data.name.toString(),
                                colors: Colors.black,
                                size: 16,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const GreyText(text: "Best"),
                                      SubTitleText(
                                        text: "\$${data.price}",
                                        textColor: AppColors.appColor,
                                      ),
                                    ],
                                  ),
                                  Row(children: [
                                    GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<CartBloc>(context).add(
                                            ItemAddedToCartEvent(-1, data));
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.grey[500],
                                        size: 25,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    BigText(
                                        text: data.quantity.toString(),
                                        colors: Colors.grey[500]),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<CartBloc>(context)
                                              .add(ItemAddedToCartEvent(
                                                  1, data));
                                        },
                                        child: Icon(Icons.add,
                                            color: Colors.grey[500], size: 25)),
                                  ]),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
