import 'package:bloctest/presentation/screens/products_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/product_model.dart';
import '../../logic/bloc/cart_bloc/cart_bloc.dart';
import '../widgets/fonts/big_text.dart';
import '../widgets/fonts/grey_text.dart';
import '../widgets/icons_row.dart';

class RecommendedProducts extends StatefulWidget {
  final List<ProductModel> products;
  // final MakeUpProductController makeUpProductController =
  //     Get.put(MakeUpProductController());
  const RecommendedProducts({Key? key, required this.products})
      : super(key: key);

  @override
  State<RecommendedProducts> createState() => _RecommendedProductsState();
}

class _RecommendedProductsState extends State<RecommendedProducts> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        padding: const EdgeInsets.only(left: 20),
        child: const Text("Recommended",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
          height: 2000,
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.products.length - 6,
              itemBuilder: ((context, index) {
                var productList = widget.products[index + 6];
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, right: 8, left: 8),
                  child: GestureDetector(
                    onTap: () {
                      // Get.to(MultiBlocProvider(
                      //   providers: [
                      //     BlocProvider<ProductBloc>(
                      //       create: (BuildContext context) =>
                      //           ProductBloc(),
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
                              builder: (_) => (BlocProvider(
                                    create: (context) => CartBloc(),
                                    child: PopularproductDetails(
                                      pageId: index + 6,
                                    ),
                                  ))));
                    },
                    child: Row(
                      children: [
                        Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      productList.imageLink.toString()),
                                  fit: BoxFit.fill,
                                ),
                                color: Colors.white)),
                        Expanded(
                          child: Container(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 5),
                              height: 100,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8, left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                      text: productList.name.toString(),
                                      colors: Colors.black,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const GreyText(
                                        text: "with chinese characteristics"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const IconRow()
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              }))

          // BlocBuilder<ProductBloc, ProductState>(
          //   builder: (context, state) {
          //     if (state is ProductLoadingState) {
          //       return const Center(child: CircularProgressIndicator());
          //     } else if (state is ProductLoadedState) {
          //       return
          //       ListView.builder(
          //           physics: const NeverScrollableScrollPhysics(),
          //           itemCount: state.data.length - 6,
          //           itemBuilder: ((context, index) {
          //             var productList = state.data[index + 6];
          //             return Padding(
          //               padding: const EdgeInsets.only(
          //                   top: 8, bottom: 8, right: 8, left: 8),
          //               child: GestureDetector(
          //                 onTap: () {
          //                   // Get.to(MultiBlocProvider(
          //                   //   providers: [
          //                   //     BlocProvider<ProductBloc>(
          //                   //       create: (BuildContext context) =>
          //                   //           ProductBloc(),
          //                   //     ),
          //                   //     BlocProvider<CartBloc>(
          //                   //       create: (BuildContext context) => CartBloc(),
          //                   //     ),
          //                   //   ],
          //                   //   child: PopularproductDetails(
          //                   //     pageId: index + 6,
          //                   //   ),
          //                   // ));
          //                   Get.to(BlocProvider.value(
          //                       value: BlocProvider.of<ProductBloc>(context),
          //                       child: PopularproductDetails(
          //                         pageId: index + 6,
          //                       )));
          //                 },
          //                 child: Row(
          //                   children: [
          //                     Container(
          //                         height: 120,
          //                         width: 120,
          //                         decoration: BoxDecoration(
          //                             borderRadius: BorderRadius.circular(15),
          //                             image: DecorationImage(
          //                               image: NetworkImage(
          //                                   productList.imageLink.toString()),
          //                               fit: BoxFit.fill,
          //                             ),
          //                             color: Colors.white)),
          //                     Expanded(
          //                       child: Container(
          //                           padding: const EdgeInsets.only(
          //                               right: 10, left: 5),
          //                           height: 100,
          //                           decoration: const BoxDecoration(
          //                               borderRadius: BorderRadius.only(
          //                                   topRight: Radius.circular(20),
          //                                   bottomRight: Radius.circular(20)),
          //                               color: Colors.white),
          //                           child: Padding(
          //                             padding: const EdgeInsets.only(
          //                                 top: 8, left: 8),
          //                             child: Column(
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                               children: [
          //                                 BigText(
          //                                   text: productList.name.toString(),
          //                                   colors: Colors.black,
          //                                 ),
          //                                 const SizedBox(
          //                                   height: 10,
          //                                 ),
          //                                 const GreyText(
          //                                     text:
          //                                         "with chinese characteristics"),
          //                                 const SizedBox(
          //                                   height: 20,
          //                                 ),
          //                                 const IconRow()
          //                               ],
          //                             ),
          //                           )),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             );
          //           }));

          //     } else {
          //       return const Text("An error");
          //     }
          //   },
          // )
          )
    ]);
  }
}
