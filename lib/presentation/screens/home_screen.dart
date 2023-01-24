import 'package:bloctest/logic/bloc/product_bloc/product_bloc.dart';
import 'package:bloctest/logic/bloc/product_bloc/product_state.dart';
import 'package:bloctest/presentation/screens/popular_products_screen.dart';
import 'package:bloctest/presentation/screens/recommended_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/bloc/product_bloc/product_event.dart';
import '../constants/app_colors.dart';
import '../widgets/fonts/big_text.dart';
import '../widgets/fonts/sub_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(ProductFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 230, 230),
        body: Column(children: [
          //heder part
          Container(
            padding:
                const EdgeInsets.only(top: 30, right: 30, bottom: 10, left: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "नेपाल",
                      colors: AppColors.appColor,
                    ),
                    const SubTitleText(
                        text: "काठमांडौ", textColor: Colors.black),
                  ],
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.appColor),
                  child: const Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductLoadedState) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        BlocProvider.value(
                          value: BlocProvider.of<ProductBloc>(context),
                          child: PopularProduct(products: state.data),
                        ),
                        const SizedBox(height: 20),
                        BlocProvider.value(
                          value: BlocProvider.of<ProductBloc>(context),
                          child: RecommendedProducts(products: state.data),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Text("An Error");
              }
              // return Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: const [
              //         PopularProduct(),
              //         SizedBox(height: 20),
              //         RecommendedProducts()
              //       ],
              //     ),
              //   ),
              // );
            },
          ),
        ]),
      ),
      // bottomNavigationBar: BottonBar(),
    );
  }
}
