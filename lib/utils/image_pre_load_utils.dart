import 'package:flutter/material.dart';
import 'package:get/get.dart';

// imageUrls에 해당하는 이미지들을 미리 로딩해둔다.
Future<void> preloadImages(List<String> imageUrls) async {
  if(Get.context != null) {
    for (var imageUrl in imageUrls) {
      await precacheImage(Image.network(imageUrl).image, Get.context!);
    }
  }
}