import 'package:demo_project/Controllers/image_controller.dart';
import 'package:demo_project/Model/processedImage.dart';
import 'package:demo_project/View/confirm_view.dart';
import 'package:demo_project/View/reconfirm_view.dart';
import 'package:demo_project/utils/app-colors.dart';
import 'package:demo_project/utils/app-text-styles.dart';
import 'package:demo_project/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImagesController>(
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            return !controller.loading;
          },
          child: Scaffold(
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
                        Image.asset(
                          "assets/images/logo 1.png",
                          height: 55,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Resultados",
                    style: AppTextStyles.body,
                  ),
                  if (controller.loading)
                     Expanded(
                        child: Center(child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: CircularProgressIndicator(),),
                            SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Analizando, tarda 20 segundos por cada imagen subida",softWrap: true,style: AppTextStyles.body.copyWith(color: Colors.black),textAlign: TextAlign.center,),
                            ),
                            SizedBox(height: 50,),
                          ],
                        )))
                  else ...[
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 2 / 1,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: controller.results.length,
                          itemBuilder: (BuildContext ctx, index) {
                            ProcessedImage result=controller.results[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${index + 1}.    ",
                                      style: AppTextStyles.body),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Container(
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(width: 8,color: index==0?AppColors.buttonBlue:Colors.transparent)
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                            child: FadeInImage(
                                          placeholder: const AssetImage(
                                            "assets/images/loading.gif",
                                          ),
                                          image: NetworkImage(
                                              "http://34.228.189.101:8090/uploads/${controller.results[index].imagePath!}"),
                                        ))),
                                  ),
                                  SizedBox(width: 20,),
                                  Text(
                                    "${((1-(controller.results[0].value - result.value)/controller.results[0].value) * 100).toStringAsFixed(2)}%",
                                    style: AppTextStyles.body.copyWith(
                                        color: AppColors.buttonBlue,
                                        fontFamily: "Inter-bold"),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Text(
                        "¿Te encaja?",
                        style: AppTextStyles.body,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.accepted =true;
                            Get.to(const ConfirmView());
                            controller.uploadResponce();
                          },
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff59F57B)),
                            child: Center(
                                child: Text(
                              "SÍ",
                              style: AppTextStyles.body,
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.accepted=false;
                            Get.to(ReconfirmView());
                             controller.uploadResponce();
                          },
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffF56B59)),
                            child: Center(
                                child: Text(
                              "NO",
                              style: AppTextStyles.body,
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    )
                  ]
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
