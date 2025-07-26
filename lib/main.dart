import 'package:basic_restaurant/basic_restaurant_app.dart';
import 'package:basic_restaurant/core/functions/hide_status_bar.dart';
import 'package:basic_restaurant/core/services/service_locator.dart';
import 'package:basic_restaurant/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  hideStatusBar();
  setupServiceLocator();
  runApp(const BasicRestrauntApp());
}
