import 'package:bloctest/logic/bloc/cart_bloc/cart_state.dart';
import 'package:bloctest/presentation/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../data/model/product_model.dart';
import '../../data/repositories/products_repo.dart';
import '../../logic/bloc/cart_bloc/cart_bloc.dart';
import '../../logic/bloc/cart_bloc/cart_event.dart';
import '../constants/app_colors.dart';
import '../widGets/fonts/biG_text.dart';
import '../widgets/expanded_test.dart';
import '../widgets/fonts/grey_text.dart';
import '../widgets/icons_row.dart';
import '../widgets/navigation.dart';

class PopularproductDetails extends StatefulWidget {
  final int pageId;

  const PopularproductDetails({Key? key, required this.pageId})
      : super(key: key);

  @override
  State<PopularproductDetails> createState() => _PopularproductDetailsState();
}

class _PopularproductDetailsState extends State<PopularproductDetails> {
  @override
  Widget build(BuildContext context) {
    var products = ProductsRepository.products[widget.pageId];
    var totalItems = context.watch<CartBloc>().totalItems;
    // var quantity = context.watch<CartBloc>().getQuantity(products);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 230, 230),
        body: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              top: 0,
              child: Container(
                width: double.maxFinite,
                height: height / 3 + 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(products.imageLink.toString()),
                    fit: BoxFit.fill,
                  ),
                  color: const Color.fromARGB(255, 246, 230, 230),
                ),
              ),
            ),
            Positioned(
                left: 15,
                right: 15,
                top: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const MyHomepage());
                      },
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: Color.fromARGB(255, 246, 230, 230),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 25,
                        ),
                      ),
                    ),

                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => BlocProvider.value(
                                value: BlocProvider.of<CartBloc>(context),
                                child: const CartPage()));
                          },
                          child: const CircleAvatar(
                            radius: 20,
                            backgroundColor: Color.fromARGB(255, 246, 230, 230),
                            child: Icon(Icons.add_shopping_cart_outlined,
                                color: Colors.black, size: 25),
                          ),
                        ),
                        totalItems >= 1
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: Icon(
                                  Icons.circle,
                                  size: 22,
                                  color: AppColors.appColor,
                                ),
                              )
                            : Container(),
                        totalItems >= 1
                            ? Positioned(
                                right: 5,
                                top: 3,
                                child: BigText(
                                  text: totalItems.toString(),
                                  colors: Colors.white,
                                  size: 12,
                                ))
                            : Container(),
                      ],
                    )
                    // }),
                  ],
                )),
            Positioned(
              right: 0,
              left: 0,
              top: height / 3 + 30,
              child: Container(
                height: (2 * height) / 4 + 20,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 246, 230, 230),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(products.name.toString(),
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Wrap(
                              children: List<Widget>.generate(5, (index) {
                            return const Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                              size: 15,
                            );
                          })),
                          const SizedBox(
                            width: 10,
                          ),
                          const GreyText(text: "4.5"),
                          const SizedBox(
                            width: 10,
                          ),
                          const GreyText(text: "1287"),
                          const SizedBox(
                            width: 5,
                          ),
                          const GreyText(text: "comments")
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const IconRow(),
                      const SizedBox(
                        height: 30,
                      ),
                      const BigText(
                        text: "Introduce",
                        colors: Colors.black,
                        size: 16,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //expanded text
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: ExpandedText(
                            text: products.description.toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar:
            BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is ItemAddToCartState) {
            return bottomNavBar(products, state.quantity);
          } else if (state is IsIncrementState) {
            return bottomNavBar(products, state.quantity);
          } else {
            return bottomNavBar(products, 0);
          }
        }));
  }

  Container bottomNavBar(ProductModel products, int quantity) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        color: Colors.grey[400],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Row(children: [
              GestureDetector(
                onTap: () {
                  BlocProvider.of<CartBloc>(context)
                      .add(IsIncrementEvent(false, products));
                  // makeUpProductController.setQuantity(false);
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
              BigText(text: quantity.toString(), colors: Colors.grey[500]),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                  onTap: () {
                    BlocProvider.of<CartBloc>(context)
                        .add(IsIncrementEvent(true, products));
                  },
                  child: Icon(Icons.add, color: Colors.grey[500], size: 25)),
            ]),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<CartBloc>(context)
                  .add(ItemAddToCartEvent(products));

              // makeUpProductController.addItem(products);
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.appColor),
              child: BigText(
                text: "\$ ${products.price} | Add to cart",
                colors: Colors.white,
                size: 16,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
