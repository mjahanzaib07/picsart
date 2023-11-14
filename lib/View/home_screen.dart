import 'package:demo_project/Controllers/image_controller.dart';
import 'package:demo_project/utils/app-colors.dart';
import 'package:demo_project/utils/app-text-styles.dart';
import 'package:demo_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset("assets/images/logo 1.png",height: 55,),
                ],
              ),
            ),
            Text("Subir imágenes",style: AppTextStyles.body,),
            GestureDetector(
              onTap: (){
                Get.put(ImagesController()).getImages();
              },
              child: Container(
                height: 200,
                width: 340,
                decoration: BoxDecoration(
                  color: AppColors.lightblue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Image.asset("assets/images/arrow_down.png",height: 150,),
                ),
              ),
            ),
            SizedBox(height: 200,)
          ],
        ),
      ),
    );
  }
}
