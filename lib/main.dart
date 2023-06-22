////////////////////////////////////////////////////////
//  Instagram: @invisionchip
//  Github: https://github.com/chipinvision
//  LinkedIn: https://linkedin.com/invisionchip
////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:matchbox/utils/appstyle.dart';
import 'package:matchbox/views/homeview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MatchBox',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppStyle.bgColor,
      body: HomeView(),
    );
  }
}
