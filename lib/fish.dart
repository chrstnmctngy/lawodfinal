import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'categories.dart';
import 'item.dart';

void main() => runApp(const MyFish());

class MyFish extends StatelessWidget {
  const MyFish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Fish(),
    );
  }
}

class Fish extends StatefulWidget {
  const Fish({Key? key}) : super(key: key);

  @override
  State<Fish> createState() => _FishState();
}

class _FishState extends State<Fish> {
  String? selectedIdType;
  int _currentIndex = 0;

  String returnedData = '';

  List<Map<String, String>> fishproducts = [
    {
      'productName': 'Bangus',
      'pricePerKilo': '₱ 150/kilo',
    },
    {
      'productName': 'Tilapia',
      'pricePerKilo': '₱ 180/kilo',
    },
    {
      'productName': 'Bodboron',
      'pricePerKilo': '₱ 250/kilo',
    },
    {
      'productName': 'Tangigue',
      'pricePerKilo': '₱ 350/kilo',
    },
    {
      'productName': 'Bulinaw',
      'pricePerKilo': '₱ 80/kilo',
    },
    {
      'productName': 'Tuna',
      'pricePerKilo': '₱ 450/kilo',
    },
  ];

  final List<String> fishImages = [
    'assets/fish/bangus.png',
    'assets/fish/tilapia.png',
    'assets/fish/bodboron.png',
    'assets/fish/tangigue.png',
    'assets/fish/bulinaw.png',
    'assets/fish/tuna.png',
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
              MaterialPageRoute(builder: (context) => const MyCategories()),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  padding: const EdgeInsets.only(left: 15),
                  value: selectedIdType,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedIdType = newValue;
                    });
                  },
                  items: ['Ascending Price', 'Descending Price']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: const Text('Sort'),
                ),
                DropdownButton<String>(
                  onChanged: (String? newValue) {
                  },
                  items: ['Filter']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  hint: const Text('Filter'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1 / 1.2,
              ),
              itemCount: fishproducts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                       var result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyItem()),
                      );
                      setState(() {
                        returnedData = result;
                      });
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
                              const EdgeInsets.only(left: 16, top: 12, right: 16),
                          child: Container(
                            height: 120,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(fishImages[index]),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 16),
                          child: Text(
                            fishproducts[index]['productName']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 16),
                          child: Text(
                            fishproducts[index]['pricePerKilo']!,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF196DFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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
