import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:github_explorer/data/datasource/local/local_key.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';

final RegExp onlyEmojiRegex = RegExp(
  r'^(\p{Emoji_Presentation}|\p{Emoji}\uFE0F|\p{Emoji_Modifier_Base}|\p{Emoji_Component})+$',
  unicode: true,
);

Size size() {
  return MediaQuery.of(Get.context!).size;
}

Widget verticalSpace({double? height}) {
  return SizedBox(height: height ?? 16);
}

Future<void> launchUrlExternal(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication, // wajib, biar buka di browser
  )) {
    throw Exception('Could not launch $url');
  }
}

void toggleTheme(bool value) {
  AppSetting.isDarkMode.value = value;
  Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  GetStorage().write(LocalKeys.darkMode, value);
}

bool isEmojiOnly(String text) {
  return onlyEmojiRegex.hasMatch(text.trim());
}
