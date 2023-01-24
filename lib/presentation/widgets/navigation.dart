import 'package:flutter/material.dart';
import '../screens/fav_screen.dart';
import '../screens/history_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomepage> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<MyHomepage> {
  int currentIndex = 0;

  void onTap(int index) {
    // print(index);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      const HomePage(),
      const HistoryPage(),
      const FavPage(),
      Profile(
        email: "",
      ),
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          selectedItemColor: Colors.blue,
          unselectedItemColor:
              const Color.fromARGB(255, 121, 118, 118).withOpacity(0.5),
          unselectedLabelStyle: TextStyle(
              color: const Color.fromARGB(255, 197, 194, 194).withOpacity(0.5)),
          selectedLabelStyle: const TextStyle(color: Colors.blue),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 25,
                ),
                label: "Home",
                activeIcon: Icon(Icons.home, size: 25)),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout_outlined, size: 25),
                label: "Cart",
                activeIcon: Icon(Icons.shopping_cart_checkout, size: 25)),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline, size: 25),
                label: "Cart",
                activeIcon: Icon(Icons.favorite, size: 25)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 25),
                label: "Profile",
                activeIcon: Icon(Icons.person, size: 25)),
          ]),
    );
  }
}
