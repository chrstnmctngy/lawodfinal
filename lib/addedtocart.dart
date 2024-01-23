import 'package:flutter/material.dart';
import 'categories.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(const MyAddedToCart());

class MyAddedToCart extends StatelessWidget {
  const MyAddedToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddedToCart(),
    );
  }
}

class AddedToCart extends StatefulWidget {
  const AddedToCart({super.key});

  @override
  State<AddedToCart> createState() => _AddedToCartState();
}

class _AddedToCartState extends State<AddedToCart> {
  String returnedData = '';

  int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/cart.png'),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Product added to Cart',
                style: TextStyle(
                  color: Color.fromRGBO(25, 109, 255, 1),
                  fontFamily: 'Proxima',
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 60,
                child: ElevatedButton(
                  onPressed: () async {
                    var result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyCategories(),
                      ),
                    );
                    setState(() {
                      returnedData = result;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromRGBO(25, 109, 255, 1),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Back to Shopping',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Proxima',
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
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
