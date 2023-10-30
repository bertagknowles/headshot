// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

Future<void> shareFirebaseImage(
    BuildContext context, String firebaseImage) async {
  final imageurl = firebaseImage;
  final uri = Uri.parse(imageurl);
  final response = await http.get(uri);
  final bytes = response.bodyBytes;
  final temp = await getTemporaryDirectory();

  // Extract the filename from the URL
  final urlSegments = imageurl.split('/');
  final fileName = urlSegments[urlSegments.length - 2];

  final path =
      '${temp.path}/$fileName.png'; // Save with the same filename and extension
  File(path).writeAsBytesSync(bytes);

  final box = context.findRenderObject() as RenderBox?;
  await Share.shareFiles(
    [path],
    sharePositionOrigin: Rect.fromLTWH(0, 0, 10, 10),
  );
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
