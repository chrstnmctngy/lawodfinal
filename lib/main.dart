import 'package:flutter/material.dart';
import 'package:lawodfinal/marketplace.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MarketPlace',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const MarketPlace(),
  ));
}
