import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConsumerAccount(),
    );
  }
}

class ConsumerAccount extends StatefulWidget {
  const ConsumerAccount({super.key});

  @override
  State<ConsumerAccount> createState() => _ConsumerAccountState();
}

class _ConsumerAccountState extends State<ConsumerAccount> {
  String? selectedIdType;
  int _currentIndex = 0;

  final List<String> productImages = [
    'assets/product1.png',
    'assets/product2.png',
    'assets/product3.png',
    'assets/product4.png',
    'assets/product5.png',
    'assets/product6.png',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(top: 15, left: 15),
          icon: const Icon(Icons.arrow_back_ios, size: 20.0),
          onPressed: () {
            // Add functionality to go back
          },
          color: const Color.fromRGBO(79, 79, 79, 1),
        ),
        titleSpacing: -10,
        title: const Padding(
          padding: EdgeInsets.only(top: 15),
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
            padding: const EdgeInsets.only(top: 15, right: 15),
            onPressed: () {
              // Handle icon press
            },
            icon: Image.asset(
              'assets/cartlogo.png',
              width: 24.0,
              height: 24.0,
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: productImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductCard(
                  price: '\$25.99',
                  image: productImages[index],
                  title: 'Product ${index + 1}',
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 60.0,
        items: <Widget>[
          Image.asset('assets/communitybtn.png',
              width: 30, height: 30, color: Colors.white),
          Image.asset('assets/marketplacebtn.png',
              width: 30, height: 30, color: Colors.white),
          Image.asset('assets/accountbtn.png',
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

class ProductCard extends StatelessWidget {
  final String price;
  final String image;
  final String title;

  ProductCard({required this.price, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 70,
              color: Colors.blue, // Background color of the bottom of the price
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color of the price
                    ),
                  ),
                  Expanded(child: Container()), // Empty widget to push text to the left
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

