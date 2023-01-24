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

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  // @override
  // void didChangeDependencies() {
  //   context.watch<CartBloc>();
  //   super.didChangeDependencies();
  // }

  // @override
  // void initState() {
  //   context.watch<CartBloc>();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // var items = context.watch<CartBloc>().getItems;
    // var totalAmount = context.watch<CartBloc>().totalAmount;
    return Scaffold(
        body: Stack(children: [
          Positioned(
              left: 20,
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
                      child: const Icon(Icons.arrow_back_ios,
                          color: Colors.white, size: 25),
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
                    return SizedBox(
                      child: ListView.builder(
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            var data = state.products[index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, right: 8, left: 8),
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  data.imageLink.toString()),
                                              fit: BoxFit.fill,
                                            ),
                                            color: Colors.white)),
                                  ),
                                  Expanded(
                                    child: Container(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 5),
                                        height: 100,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8, left: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const GreyText(
                                                          text: "Best"),
                                                      SubTitleText(
                                                        text: "\$${data.price}",
                                                        textColor:
                                                            AppColors.appColor,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        BlocProvider.of<
                                                                    CartBloc>(
                                                                context)
                                                            .add(
                                                                ItemAddToCartEvent(
                                                          data,
                                                        ));
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
                                                        text: data.quantity
                                                            .toString(),
                                                        colors:
                                                            Colors.grey[500]),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          BlocProvider.of<
                                                                      CartBloc>(
                                                                  context)
                                                              .add(
                                                                  ItemAddToCartEvent(
                                                            data,
                                                          ));
                                                        },
                                                        child: Icon(Icons.add,
                                                            color: Colors
                                                                .grey[500],
                                                            size: 25)),
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
                  } else {
                    return const Center(child: Text("No data"));
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
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Row(children: [
                            BigText(
                                text: state.totalAmount.toString(),
                                colors: Colors.grey[500]),
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
                } else {
                  return Container();
                }
              },
            ),
          ),
        ));

    // BlocBuilder<ProductBloc, ProductState>(
    //   builder: (context, state) {
    //     if (state is ItemAddToCartState) {
    //       return
    //       Scaffold(
    //           body: Stack(children: [
    //             Positioned(
    //                 left: 20,
    //                 top: 20 * 3,
    //                 right: 20,
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     GestureDetector(
    //                       onTap: () {
    //                         // Get.toNamed(RouterHelper.getMyHomePage());
    //                       },
    //                       child: CircleAvatar(
    //                         radius: 20,
    //                         backgroundColor: AppColors.appColor,
    //                         child: const Icon(Icons.arrow_back_ios,
    //                             color: Colors.white, size: 25),
    //                       ),
    //                     ),
    //                     const SizedBox(
    //                       width: 100,
    //                     ),
    //                     GestureDetector(
    //                       onTap: () {
    //                         // Get.toNamed(
    //                         //   RouterHelper.getMyHomePage(),
    //                         // );
    //                       },
    //                       child: CircleAvatar(
    //                         radius: 20,
    //                         backgroundColor: AppColors.appColor,
    //                         child: const Icon(Icons.home,
    //                             color: Colors.white, size: 25),
    //                       ),
    //                     ),
    //                     CircleAvatar(
    //                       radius: 20,
    //                       backgroundColor: AppColors.appColor,
    //                       child: const Icon(Icons.add_shopping_cart,
    //                           color: Colors.white, size: 25),
    //                     ),
    //                   ],
    //                 )),
    //             Positioned(
    //                 top: 100,
    //                 left: 20,
    //                 right: 20,
    //                 bottom: 0,
    //                 child: Container(
    //                   child: ListView.builder(
    //                       itemCount: state.products.length,
    //                       itemBuilder: (context, index) {
    //                         var data = state.products[index];
    //                         return Padding(
    //                           padding: const EdgeInsets.only(
    //                               top: 8, bottom: 8, right: 8, left: 8),
    //                           child: Row(
    //                             children: [
    //                               GestureDetector(
    //                                 onTap: () {
    //                                   // var pageindex =
    //                                   //     Get.find<MakeUpProductController>()
    //                                   //         .makeUpProductList
    //                                   //         .indexOf(cartController
    //                                   //             .getItems[index].product!);

    //                                   // Get.to(PopularproductDetails(
    //                                   //   pageId: pageindex,
    //                                   // ));
    //                                 },
    //                                 child: Container(
    //                                     height: 100,
    //                                     width: 100,
    //                                     decoration: BoxDecoration(
    //                                         borderRadius:
    //                                             BorderRadius.circular(20),
    //                                         image: DecorationImage(
    //                                           image: NetworkImage(
    //                                               data.imageLink.toString()),
    //                                           fit: BoxFit.fill,
    //                                         ),
    //                                         color: Colors.white)),
    //                               ),
    //                               Expanded(
    //                                 child: Container(
    //                                     padding: const EdgeInsets.only(
    //                                         right: 10, left: 5),
    //                                     height: 100,
    //                                     decoration: const BoxDecoration(
    //                                         borderRadius: BorderRadius.only(
    //                                             topRight: Radius.circular(20),
    //                                             bottomRight:
    //                                                 Radius.circular(20)),
    //                                         color: Colors.white),
    //                                     child: Padding(
    //                                       padding: const EdgeInsets.only(
    //                                           top: 8, left: 8),
    //                                       child: Column(
    //                                         crossAxisAlignment:
    //                                             CrossAxisAlignment.start,
    //                                         children: [
    //                                           BigText(
    //                                             text: data.name.toString(),
    //                                             colors: Colors.black,
    //                                             size: 16,
    //                                           ),
    //                                           const SizedBox(
    //                                             height: 10,
    //                                           ),
    //                                           Row(
    //                                             mainAxisAlignment:
    //                                                 MainAxisAlignment
    //                                                     .spaceBetween,
    //                                             crossAxisAlignment:
    //                                                 CrossAxisAlignment.start,
    //                                             children: [
    //                                               Column(
    //                                                 crossAxisAlignment:
    //                                                     CrossAxisAlignment
    //                                                         .start,
    //                                                 children: [
    //                                                   const GreyText(
    //                                                       text: "Best"),
    //                                                   SubTitleText(
    //                                                     text: "\$${data.price}",
    //                                                     textColor:
    //                                                         AppColors.appColor,
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                               Row(children: [
    //                                                 GestureDetector(
    //                                                   onTap: () {
    //                                                     BlocProvider.of<
    //                                                                 ProductBloc>(
    //                                                             context)
    //                                                         .add(
    //                                                             ItemAddToCartEvent(
    //                                                       data,
    //                                                     ));
    //                                                   },
    //                                                   child: Icon(
    //                                                     Icons.remove,
    //                                                     color: Colors.grey[500],
    //                                                     size: 25,
    //                                                   ),
    //                                                 ),
    //                                                 const SizedBox(
    //                                                   width: 5,
    //                                                 ),
    //                                                 BigText(
    //                                                     text: data.quantity
    //                                                         .toString(),
    //                                                     colors:
    //                                                         Colors.grey[500]),
    //                                                 const SizedBox(
    //                                                   width: 5,
    //                                                 ),
    //                                                 GestureDetector(
    //                                                     onTap: () {
    //                                                       BlocProvider.of<
    //                                                                   ProductBloc>(
    //                                                               context)
    //                                                           .add(
    //                                                               ItemAddToCartEvent(
    //                                                         data,
    //                                                       ));
    //                                                     },
    //                                                     child: Icon(Icons.add,
    //                                                         color: Colors
    //                                                             .grey[500],
    //                                                         size: 25)),
    //                                               ]),
    //                                             ],
    //                                           )
    //                                         ],
    //                                       ),
    //                                     )),
    //                               ),
    //                             ],
    //                           ),
    //                         );
    //                       }),
    //                 ))
    //           ]),
    //           bottomNavigationBar: Container(
    //             height: 75,
    //             decoration: BoxDecoration(
    //               borderRadius: const BorderRadius.only(
    //                 topRight: Radius.circular(20),
    //                 topLeft: Radius.circular(20),
    //               ),
    //               color: Colors.grey[200],
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.only(left: 30, right: 30),
    //               child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Container(
    //                       padding: const EdgeInsets.all(12),
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(20),
    //                           color: Colors.white),
    //                       child: Row(children: [
    //                         BigText(
    //                             text: "${state.totalAmount}",
    //                             colors: Colors.grey[500]),
    //                       ]),
    //                     ),
    //                     GestureDetector(
    //                       onTap: () {
    //                         // makeUpProductController.addItem(products);
    //                       },
    //                       child: Container(
    //                         padding: const EdgeInsets.all(12),
    //                         decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(20),
    //                             color: AppColors.appColor),
    //                         child: const BigText(
    //                           text: "Check out",
    //                           colors: Colors.white,
    //                           size: 16,
    //                         ),
    //                       ),
    //                     ),
    //                   ]),
    //             ),
    //           ));
    //     } else {
    //       return const Text("No Data");
    //     }
    //   },
    // );
  }
}
