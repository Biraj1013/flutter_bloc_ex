import 'package:flutter/material.dart';
import '../widgets/fonts/big_text.dart';

class FavPage extends StatelessWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 230, 230),
      body: BigText(
        text: "Fav Page",
        colors: Colors.amber,
      ),
    );
  }
}
