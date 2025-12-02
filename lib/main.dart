import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/providers_setup.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env"); 
  runApp(const ProvidersSetup());
}

