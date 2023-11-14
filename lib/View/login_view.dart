import 'package:demo_project/Controllers/image_controller.dart';
import 'package:demo_project/utils/app-colors.dart';
import 'package:demo_project/utils/app-text-styles.dart';
import 'package:demo_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/logo 1.png",
                    height: 55,
                  ),
                ],
              ),
            ),
            Text(
              "REGISTRARSE",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            Text(
              "Correo electrónico",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200),
                        borderSide: BorderSide(color: Colors.transparent,width: 0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200),
                        borderSide: BorderSide(color: Colors.transparent,width: 0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200),
                        borderSide: BorderSide(color: Colors.transparent,width: 0)),
                    fillColor: Color(0xffc9f5f5),
                    filled: true),
              ),
            ),
            SizedBox(height: 25,),
            Text(
              "Perfil de Instagram",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200),
                        borderSide: BorderSide(color: Colors.transparent,width: 0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200),
                        borderSide: BorderSide(color: Colors.transparent,width: 0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200),
                        borderSide: BorderSide(color: Colors.transparent,width: 0)),
                    fillColor: Color(0xffc9f5f5),
                    filled: true),
              ),
            ),
            SizedBox(height: 25,),
            Text(
              "¿Con cuál te identificas más?",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200),
                        borderSide: BorderSide(color: Colors.transparent,width: 0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200),
                        borderSide: BorderSide(color: Colors.transparent,width: 0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200),
                        borderSide: BorderSide(color: Colors.transparent,width: 0)),
                    fillColor: Color(0xffc9f5f5),
                    filled: true),
              ),
            ),
            SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}
