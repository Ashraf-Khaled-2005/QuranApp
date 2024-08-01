import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quran/features/home/presentation/views/widget/homebody.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 20, top: 20),
        child: Homebody(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/icon_quran_white.png',
              width: 50,
              height: 50,
            ),
            SizedBox(
              width: 6,
            ),
            const Text(
              'Quran App',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              GoRouter.of(context).push('/favurite');
            },
            child: Image.asset(
              'assets/icon_bookmark_white.png',
              width: 30,
              height: 50,
            ),
          ),
          SizedBox(
            width: 30,
          )
        ],
      ),
    );
  }
}
