import 'package:bookly_app/core/utils/functions/custom_Snack_bar.dart';
// import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String urL) async {
  Uri uri = Uri.parse(urL);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    CustomSnakBar(context, 'cannot launch $urL');
  }
}
