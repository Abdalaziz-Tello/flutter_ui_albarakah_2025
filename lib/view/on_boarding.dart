
import 'dart:io';

import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
   OnBoardingPage({super.key});
 final File file = File("c:/Users/HP/Downloads/TO-DO/organizing-projects/cuate.png");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 33,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // FlutterLogo(size: 220),
          // TODO : Replace with Image : Assets/ Network/ File / Memory
          Image.file(file),
          
          Text(
            "Hello World",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          Text(
            "Sint cillum occaecat aliquip ipsum veniam ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.w200,
            ),
          ),
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,

                  shape: BoxShape.circle,
                ),
                width: 10,
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,

                  shape: BoxShape.circle,
                ),
                width: 10,
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,

                  shape: BoxShape.circle,
                ),
                width: 10,
                height: 10,
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 147, 179, 204),
            ),
            width: 317,
            height: 54,
            child: Center(
              child: Text(
                "Next",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
