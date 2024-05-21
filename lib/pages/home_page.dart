import 'package:flutter/material.dart';
import 'package:shoes_commerce/components/bottom_nav_bar.dart';
import 'package:shoes_commerce/pages/cart_page.dart';
import 'package:shoes_commerce/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // selected index to control the bottom nav bar
  int _selectedIndex = 0;

  // this method will update the selected index
  // when the users taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to navigate between
  final List<Widget> _pages = [
    // shop page
    const ShopPage(),
    // cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[800],
        child: Column(
          children: [
            // Logo
            Container(
              height: 150,
              color: Colors.grey[800],
              child: Image.asset(
                'lib/images/puma2.png',
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Divider(
                color: Colors.grey[800],
              ),
            ),
            // Other items in the drawer
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 20),
                      child: ListTile(
                        leading: Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        title: Text(
                          'About',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Spacer to push logout to the bottom
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
