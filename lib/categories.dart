import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'consumeraccount.dart';
import 'fish.dart';

class MyCategories extends StatelessWidget {
  const MyCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Categories(),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String? selectedIdType;
  int _currentIndex = 0;

  String returnedData = '';

  List<Map<String, String>> products = [
    {
      'productName': 'Fish',
      'sale': '-50%',
    },
    {
      'productName': 'Shellfish',
      'sale': '-50%',
    },
    {
      'productName': 'Equipment',
      'sale': '-50%',
    },
    {
      'productName': 'Gears',
      'sale': '-50%',
    },
    {
      'productName': 'Processed',
      'sale': '-50%',
    },
    {
      'productName': 'Electronics',
      'sale': '-50%',
    },
  ];

  final List<String> productImages = [
    'assets/categories/fish.png',
    'assets/categories/shellfish.png',
    'assets/categories/equipment.png',
    'assets/categories/gears.png',
    'assets/categories/processed.png',
    'assets/categories/electronics.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(top: 5, left: 15, bottom: 5),
          icon: const Icon(Icons.arrow_back_ios, size: 20.0),
          onPressed: () async {
            var result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyConsumerAccount()),
            );
            setState(() {
              returnedData = result;
            });
          },
          color: const Color.fromRGBO(79, 79, 79, 1),
        ),
        titleSpacing: -10,
        title: const Padding(
          padding: EdgeInsets.only(),
          child: Text(
            'Categories',
            style: TextStyle(
              color: Color.fromRGBO(25, 109, 255, 1),
              fontFamily: 'Proxima',
              fontWeight: FontWeight.w700,
              fontSize: 34,
            ),
          ),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(top: 5, right: 15, bottom: 5),
            onPressed: () {
            },
            icon: Image.asset(
              'assets/cartlogo.png',
              width: 24.0,
              height: 24.0,
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1 / 1.2,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (products[index]['productName'] == 'Fish') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFish()),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(11, 0, 0, 0),
                    spreadRadius: 0,
                    blurRadius: 40,
                    offset: Offset(8, 0),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 10, right: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(224, 236, 248, 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        products[index]['sale']!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(24, 119, 242, 1),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 12, right: 16),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(productImages[index]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Center(
                      child: Text(
                        products[index]['productName']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60.0,
        items: <Widget>[
          Image.asset('assets/bottomnav/communitybtn.png',
              width: 30, height: 30, color: Colors.white),
          Image.asset('assets/bottomnav/marketplacebtn.png',
              width: 30, height: 30, color: Colors.white),
          Image.asset('assets/bottomnav/accountbtn.png',
              width: 30, height: 30, color: Colors.white),
        ],
        color: const Color(0xFFE0ECF8),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.blue,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
