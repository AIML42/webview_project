import 'package:get/get.dart';

class WebViewUrlController extends GetxController {
  RxString url = 'https://www.example.com'.obs;

  void setUrl(String newUrl) {
    url.value = newUrl;
  }
}
