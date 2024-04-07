import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ngaos_app/routes/router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      context.goNamed(RouterName.mainPage);
    });
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ngaos",
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
