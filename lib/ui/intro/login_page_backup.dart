import 'package:flutter/material.dart';
// import 'package:tugas_apk/core/assets/assets.gen.dart';
import 'package:tugas_apk/core/constants/colors.dart';
import 'package:tugas_apk/core/core.dart';

class LoginPageBase extends StatelessWidget {
  const LoginPageBase({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          SizedBox(
            height: 250.0,
            child: Center(
              child: Assets.images.logoWhite.image(
                width: 200,
                height: 200,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
              child: Container(
                color: AppColors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: 28.0,
                  vertical: 100.0,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Masukkan Email Anda',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(8.0)
                        // ),
                      ),
                    ),
                    // SizedBox(height: 86.0,),
                    SpacesHeight(50.0),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Masukkan Password Anda',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        // obscureText: true,
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(8.0)
                        // ),
                      ),
                    ),
                    SpacesHeight(50.0,),
                    SizedBox(
                      height: 50.0,
                      child: ElevatedButton(                            
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.white,
                        ),
                        child: Text('Login'),
                        ),
                    ),
                    SpacesHeight(80.0),
                    Center(
                      child: Assets.images.logoIdn.image(width: 100, height: 50),
                    ),
                  ],
                ),
              ),
            ),
            ),
          ),
        ],
      ),
    );
      
    
  }
}