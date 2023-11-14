import 'package:demo_project/Controllers/image_controller.dart';
import 'package:demo_project/utils/app-colors.dart';
import 'package:demo_project/utils/app-text-styles.dart';
import 'package:demo_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesListView extends StatelessWidget {
  const ImagesListView({Key? key}) : super(key: key);

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
                  "Imágenes subidas",
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 20,),
                Expanded(child: ListView.builder(
                  itemCount: controller.images.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        clipBehavior: Clip.hardEdge,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),),
                        child: Image.file(controller.images[index]!),

                      );
                    })),
                Padding(
                  padding:  EdgeInsets.all(25),
                  child: GestureDetector(
                    onTap: (){
                      controller.getResult();
                    },
                    child: Container(
                      height: 48,
                      width: 150,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.buttonBlue
                      ),
                      child: Center(child: Text("ANALIZAR",style: AppTextStyles.body,)),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
