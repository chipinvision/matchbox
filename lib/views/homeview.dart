import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/appstyle.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController partnernameController = TextEditingController();

  String name1 = "";
  String name2 = "";
  int lovePercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Logo(),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: nameController,
            onChanged: (value) {
              setState(() {
                name1 = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Enter your name',
              labelStyle: GoogleFonts.getFont(
                'Montserrat',
                textStyle: const TextStyle(color: AppStyle.text),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: AppStyle.primary),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: AppStyle.primary),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            controller: partnernameController,
            onChanged: (value) {
              setState(() {
                name2 = value;
              });
            },
            decoration: InputDecoration(
              labelText: 'Enter your partner\'s / crush\'s name',
              labelStyle: GoogleFonts.getFont(
                'Montserrat',
                textStyle: const TextStyle(color: AppStyle.text),
              ),
              hintStyle: GoogleFonts.getFont(
                'Montserrat',
                textStyle: const TextStyle(
                    color: AppStyle.text, fontWeight: FontWeight.bold),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: AppStyle.primary),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: AppStyle.primary),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                lovePercentage = calculateLovePercentage(name1, name2);
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Result', style: TextStyle(color: AppStyle.text),),
                      content: Text(
                        'Your Love Score is: $lovePercentage',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          textStyle: const TextStyle(
                            color: AppStyle.text,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppStyle.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Calculate Love Score',
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Made with ❤️ by Suresh Mishra',
                  style: GoogleFonts.getFont(
                    'Montserrat',
                    textStyle: const TextStyle(
                      color: AppStyle.text,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int calculateLovePercentage(String name1, String name2) {
    String combinedNames = (name1 + name2).replaceAll(RegExp('[^a-zA-Z]'), '');
    combinedNames = combinedNames.toLowerCase();
    int score = 0;
    for (int i = 0; i < combinedNames.length; i++) {
      score += combinedNames.codeUnitAt(i);
    }
    int lovePercentage = (score % 101);
    return lovePercentage;
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Text(
        'Matchbox - Love Calculator',
        style: GoogleFonts.getFont(
          'Great Vibes',
          textStyle: TextStyle(
            fontSize: min(36, constraints.maxHeight * 0.04),
            fontWeight: FontWeight.bold,
            color: AppStyle.text,
          ),
        ),
      );
    });
  }
}
