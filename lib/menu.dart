import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reco_restaurant_app/Widgets/cartPage.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  String searchText = '';

  final List<Map<String, dynamic>> cartItems = [];

  final List<Map<String, dynamic>> menuItems = [
    {'name': 'Cheese Burger', 'image': 'assets/images/SmashBurger.jpg', 'price': 12.99},
    {'name': 'Chicken Burger', 'image': 'assets/images/ChickenBrger.jpg', 'price': 13.29},
    {'name': 'Pizza Margherita', 'image': 'assets/images/PizzaMargherita.jpg', 'price': 18.30},
    {'name': 'Fries', 'image': 'assets/images/Fries.jpg', 'price': 7.80},
    {'name': 'Pepsi', 'image': 'assets/images/Pepsi.jpg', 'price': 2.5},
    {'name': 'Smash Burger', 'image': 'assets/images/burger.jpg', 'price': 10.50},
    {'name': 'Chicken', 'image': 'assets/images/ChickenBrger.jpg', 'price': 14},
  ];

  void addToCart({
    required String name,
    required String image,
    required double price,
  }) {
    setState(() {
      final existingItemIndex = cartItems.indexWhere((item) => item['name'] == name);
      if (existingItemIndex != -1) {
        cartItems[existingItemIndex]['quantity'] += 1;
      } else {
        cartItems.add({
          'name': name,
          'image': image,
          'price': price,
          'quantity': 1,
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = menuItems.where((item) =>
      item['name'].toString().toLowerCase().contains(searchText.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.redAccent,
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchText = value;
            });
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(cartItems: cartItems,),
                  ),
                );
              },
              icon: Icon(CupertinoIcons.cart, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              itemCount: filteredItems.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.82,
              ),
              itemBuilder: (BuildContext context, index) {
                final item = filteredItems[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(item['image'], fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item['name'],
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          '\$${item['price']}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                          ),
                          onPressed: () {
                            addToCart(
                              name: item['name'],
                              image: item['image'],
                              price: item['price'],
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${item['name']} added to cart!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
