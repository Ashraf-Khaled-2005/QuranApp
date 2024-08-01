import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran/features/home/presentation/views/Home_view.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: h * .05,
          ),
          Text(
            "Quran App",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: h * .2,
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Container(
                  height: h * .65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    'assets/quran_onboard.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                left: w * .3,
                bottom: -25,
                child: ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: WidgetStatePropertyAll(Size(70, 80)),
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xfffab091))),
                    onPressed: () {
                      log('go');
                      GoRouter.of(context).push('/home');
                    },
                    child: Text(
                      'Get started',
                      style: TextStyle(fontSize: 20),
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}
