import 'package:demo_project/Controllers/image_controller.dart';
import 'package:demo_project/utils/app-colors.dart';
import 'package:demo_project/utils/app-text-styles.dart';
import 'package:demo_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class ConfirmView extends StatelessWidget {
  const ConfirmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: GetBuilder<ImagesController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,

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
Spacer(),
                Text(
                  "¡Gracias!",
                  style: AppTextStyles.body,
                ),
                SizedBox(height: 30,),
                Padding(
                  padding:  EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      GestureDetector(
                        onTap: () async {
                          Get.offAll(const HomeScreen());




                        },
                        child: Container(
                          height: 48,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.buttonBlue
                          ),
                          child: Center(child: Text("SUBIR DE NUEVO",style: AppTextStyles.body,)),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
