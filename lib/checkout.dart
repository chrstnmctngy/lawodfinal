import 'package:flutter/material.dart';

void main() => runApp(const MyCheckout());

class MyCheckout extends StatelessWidget {
  const MyCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Checkout(),
    );
  }
}

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String returnedData = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(top: 5, left: 15, bottom: 5),
          icon: const Icon(Icons.arrow_back_ios, size: 20.0),
          onPressed: () async {
            // var result = await Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const MyCategories()),
            // );
            // setState(() {
            //   returnedData = result;
            // });
          },
          color: const Color.fromRGBO(79, 79, 79, 1),
        ),
        titleSpacing: -10,
        title: const Padding(
          padding: EdgeInsets.only(),
          child: Text(
            'Fish',
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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CobyContainer(
              imageUrl: "https://via.placeholder.com/142x162",
              text: 'Bangus',
              price: '₱ 150/kilo',
            ),
            const SizedBox(width: 10), // Add some spacing between containers
            CobyContainer(
              imageUrl: "https://via.placeholder.com/142x162",
              text: 'Tilapia',
              price: '₱ 180/kilo',
            ),
          ],
        ),
      ),
    );
  }
}

class CobyContainer extends StatelessWidget {
  final String imageUrl;
  final String text;
  final String price;

  CobyContainer({required this.imageUrl, required this.text, required this.price});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 167,
          height: 271,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            shadows: [
              const BoxShadow(
                color: Color(0x14000000),
                blurRadius: 40,
                offset: Offset(0, 8),
                spreadRadius: 0,
              ),
            ],
          ),
        ),
        Positioned(
          top: 15,
          right: 15,
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF828282),
            ),
            child: const Center(
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ),
        const Positioned(
          top: 15,
          left: 15,
          child: SizedBox(
            width: 24.62,
            height: 24,
            child: Text(
              'New',
              style: TextStyle(
                color: Color(0xFF1F53E4),
                fontSize: 12,
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 15,
          child: Container(
            width: 142,
            height: 161.77,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 35, // Adjust the bottom position for the product text
          left: 15,
          child: SizedBox(
            width: 90,
            height: 22.12,
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF0A1034),
                fontSize: 16,
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 15,
          child: SizedBox(
            width: 71,
            height: 17,
            child: Text(
              price,
              style: const TextStyle(
                color: Color(0xFF196DFF),
                fontSize: 12,
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
