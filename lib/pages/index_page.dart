import 'package:flutter/material.dart';
import 'home/home_page.dart';
import 'category/category_page.dart';
import 'cart/cart_page.dart';
import 'account/account_page.dart';

class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: 'CATEGORY'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'CART'),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'ACCOUNT'),
  ];

  final List<Widget> tabItems = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    AccountPage(),
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(250, 250, 250, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabItems,
      ),
    );
  }
}
