import 'package:demo_project/Controllers/image_controller.dart';
import 'package:demo_project/View/confirm_view.dart';
import 'package:demo_project/View/home_screen.dart';
import 'package:demo_project/utils/app-colors.dart';
import 'package:demo_project/utils/app-text-styles.dart';
import 'package:demo_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReconfirmView extends StatelessWidget {
  const ReconfirmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: GetBuilder<ImagesController>(
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                const SizedBox(height: 20,),
                Text(
                  "¿Cuál crees que funciona mejor?",
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 20,),
                Expanded(child: ListView.builder(
                    itemCount: controller.images.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Get.to(const ConfirmView());
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                          clipBehavior: Clip.hardEdge,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),),
                          child: Image.file(controller.images[index]!),

                        ),
                      );
                    })),
                const SizedBox(height: 20,),
              ],
            );
          },
        ),
      ),
    );
  }
}
