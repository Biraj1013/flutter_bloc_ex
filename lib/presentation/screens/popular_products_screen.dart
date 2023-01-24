import 'package:bloctest/presentation/screens/products_details_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../data/model/product_model.dart';
import '../widgets/fonts/big_text.dart';
import '../widgets/fonts/grey_text.dart';
import '../widgets/icons_row.dart';

class PopularProduct extends StatefulWidget {
  final List<ProductModel> products;
  const PopularProduct({Key? key, required this.products}) : super(key: key);

  @override
  State<PopularProduct> createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentValue = 0.0;
  var scaleFacto = 0.8;
  double height = 220;
  ProductModel productModel = ProductModel();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentValue = pageController.page!;
      });
    });

    @override
    void dispose() {
      pageController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("height:" + Dimension.screenHeight.toString());
    // print("width:" + Dimension.screenWidth.toString());
    return Column(
      children: [
        // BlocBuilder<ProductBloc, ProductState>(
        //   builder: (context, state) {
        //     return

        SizedBox(
            height: 320,
            child: PageView.builder(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                itemBuilder: ((context, index) {
                  return buildPageItem(index, widget.products[index]);
                  // if (state is ProductLoadedState) {
                  //   return buildPageItem(index, state.data[index]);
                  // } else {
                  //   return const Center(child: CircularProgressIndicator());
                  // }
                }))),

        //   },
        // ),
        DotsIndicator(
          dotsCount: 6,
          position: currentValue,
          decorator: DotsDecorator(
            size: const Size.square((18) / 2),
            activeSize: const Size(18, (18) / 2),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ],
    );
  }

  Widget buildPageItem(int index, ProductModel makeUpProductList) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currentValue.floor()) {
      var currScale = 1 - (currentValue - index) * (1 - scaleFacto);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    } else if (index == currentValue.floor() + 1) {
      var currScale =
          scaleFacto + (currentValue - index + 1) * (1 - scaleFacto);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    } else if (index == currentValue.floor() - 1) {
      var currScale = 1 - (currentValue - index) * (1 - scaleFacto);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    } else {
      var currScale = 0.8;
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    }
    return Transform(
      transform: matrix,
      child: GestureDetector(
        onTap: () {
          // Get.to(MultiBlocProvider(
          //   providers: [
          //     BlocProvider<ProductBloc>(
          //       create: (BuildContext context) => ProductBloc(),
          //     ),
          //     BlocProvider<CartBloc>(
          //       create: (BuildContext context) => CartBloc(),
          //     ),
          //   ],
          //   child: PopularproductDetails(
          //     pageId: index + 6,
          //   ),
          // ));
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PopularproductDetails(
                  pageId: index,
                ),
              ));
          // Get.toNamed(
          //   RouterHelper.getPopularProductDetails(index),
          // curve: Curves.easeInOut,
          // );
        },
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(makeUpProductList.imageLink.toString()),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                height: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: makeUpProductList.name.toString(),
                        colors: Colors.black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                              children: List<Widget>.generate(5, (index) {
                            return const Icon(
                              Icons.star,
                              color: Colors.orangeAccent,
                              size: 15,
                            );
                          })),
                          const GreyText(text: "1287"),
                          const GreyText(text: "comments"),
                          const GreyText(text: "4.5"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const IconRow(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
