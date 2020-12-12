import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/tabbar_state.dart';
import 'home/home_page.dart';
import 'category/category_page.dart';
import 'cart/cart_page.dart';
import 'account/account_page.dart';

class IndexPage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    var data = context.watch<TabbarState>();

    return Scaffold(
      backgroundColor: Color.fromARGB(250, 250, 250, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: data.currentIndex,
        items: bottomTabs,
        onTap: (index) => context.read<TabbarState>().setCurrentIndex(index),
      ),
      body: IndexedStack(
        index: data.currentIndex,
        children: tabItems,
      ),
    );
  }
}
