import 'package:flutter/material.dart';
import 'package:tugas_apk/core/assets/assets.gen.dart';
import 'package:tugas_apk/ui/intro/login_page.dart';
// import 'package:tugas_apk/ui/intro/login_page_backup.dart';
// import 'package:tugas_apk/ui/intro/login_page.dart';
// import 'package:tugas_apk/core/constants/colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
      ),
      ),
      );
    return Scaffold(
      // backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Assets.images.logoBlue.image(width: 200, height: 200),
      ),
      bottomNavigationBar: SizedBox(
        height: 180,
        child: Align(
          child: Assets.images.logoIdn.image(width: 100, height: 100),
        ),
      ),
    );
  }
}
