import 'package:flutter/material.dart';
import 'consumeraccount.dart';

void main() {
  runApp(const MyMarketplaceLanding());
}

class MyMarketplaceLanding extends StatelessWidget {
  const MyMarketplaceLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF196DFF),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            padding: const EdgeInsets.only(top: 15),
            icon: const Icon(Icons.arrow_back_ios, size: 20.0),
            onPressed: () {
              // Add functionality to go back
            },
            color: Colors.white,
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
              ),
            ),
            const MarketPlaceLanding(),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MarketPlaceLanding extends StatefulWidget {
  const MarketPlaceLanding({super.key});

  @override
  State<MarketPlaceLanding> createState() => _MarketPlaceLandingState();
}

class _MarketPlaceLandingState extends State<MarketPlaceLanding> {
  late String returnedData = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.29,
          width: MediaQuery.of(context).size.width,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(25, 109, 255, 1),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/marketplace.png',
                      width: 50,
                      height: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Marketplace',
                  style: TextStyle(
                    color: Color.fromRGBO(25, 109, 255, 1),
                    fontFamily: 'Proxima',
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(right: 30, left: 30),
                  child: Text(
                    'From Sea to Table: Empowering Fisherfolks and Satisfying Seafood Cravings',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Proxima',
                      color: Color.fromRGBO(79, 79, 79, 1),
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                    
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: Color.fromRGBO(25, 109, 255, 1)),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Sell Fish',
                      style: TextStyle(
                        color: Color.fromRGBO(25, 109, 255, 1),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Proxima',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
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
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(25, 109, 255, 1)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Buy Fish',
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
      ],
    );
  }
}
