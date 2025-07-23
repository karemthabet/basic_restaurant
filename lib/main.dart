import 'package:basic_restaurant/basic_restaurant_app.dart';
import 'package:basic_restaurant/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(BasicRestrauntApp());
}
