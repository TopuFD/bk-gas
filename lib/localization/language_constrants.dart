import 'package:bk_gas/localization/app_localization.dart';
import 'package:flutter/material.dart';

String? getTranslated(String? key, BuildContext context) {
  String? text = key;
  try{
    text = AppLocalization.of(context)!.translate(key);
  }catch (error){
    debugPrint('error --- $error');
  }
  return text;
}