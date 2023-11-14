import 'dart:convert';
import 'dart:ui';

import 'package:demo_project/Model/processedImage.dart';
import 'package:demo_project/View/images_list_view.dart';
import 'package:demo_project/utils/utils.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../View/home_screen.dart';
import '../View/result_view.dart';

class ImagesController extends GetxController {
  List<File?> images = [];
  List<ProcessedImage> results = [];
  ProcessedImage? selectedImage;
  bool loading = false;
  bool accepted = false;

  @override
  void onInit() {
    super.onInit();
  }

  Future getsheetfun() async {
    http.Response response = await http.get(
      Uri.parse('https://sheetdb.io/api/v1/w7efh5b3tgkcf'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      List<dynamic> sheetData = await jsonDecode(response.body);
      print(sheetData);
      for(var data in sheetData){
      }

    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to get payable data');
    }
  }




  getImages() async {
    images = await Utils.getImagesFromGallery();
    if (images.isNotEmpty) {
      Get.to(const ImagesListView());
    }
  }

  Future<void> getResult() async {
    loading = true;
    update();
    Get.to(ResultView());
    results = [];
    for(var e in images) {
      await uploadImage(e!.path);
    }
    results.sort((a, b) => b.value.compareTo(a.value));
    loading = false;
    update();
  }

  Future<void> uploadImage(String path) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://34.228.189.101:8090/analyze'));
    request.files.add(await http.MultipartFile.fromPath('file', path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var resultStr = await response.stream.bytesToString();
      var data = jsonDecode(resultStr);
      results.add(ProcessedImage.fromJson(data));
      print(jsonDecode(resultStr));
    } else {
      Utils.showSnackBar(title: "Error", message: response.reasonPhrase.toString());
      print(response.reasonPhrase);
    }
  }

  Future<void> uploadResponce() async {
    print(accepted);
    loading = true;
    update();
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://34.228.189.101:8093/upload'));
    request.body = json.encode({
      "variable":accepted?"yes":"no",
      "array": results.map((e) => e.toJson()).toList()
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      // Utils.showSnackBar(title: "Success", message: "Result submitted");
    }
    else {
      // Utils.showSnackBar(title: "Error", message: "Error Submitting Result",error: true);
      print(response.reasonPhrase);
    }
loading = false;
    update();
  }

  Future<void> calculatePercentage() async {

  }
}
