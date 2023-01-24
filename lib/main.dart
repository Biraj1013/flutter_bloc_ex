import 'package:bloctest/logic/bloc/product_bloc/product_bloc.dart';
import 'package:bloctest/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'logic/bloc/cart_bloc/cart_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => ProductBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
        ),
      ],
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage()
          // MultiBlocProvider(
          //   providers: [
          //     BlocProvider<ProductBloc>(
          //       create: (BuildContext context) => ProductBloc(),
          //     ),
          //     BlocProvider<CartBloc>(
          //       create: (BuildContext context) => CartBloc(),
          //     ),
          //   ],
          //   child: const HomePage(),
          // )

          //  BlocProvider(
          //   create: (context) => ProductBloc(),
          //   child: const HomePage(),
          // ),
          ),
    );
  }
}
