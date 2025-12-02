import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/mi_material_app.dart';
import 'package:flutter_application_1/providers/provider_slider.dart';
import 'package:provider/provider.dart';

class ProvidersSetup extends StatelessWidget {
  const ProvidersSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderSlider>(
          create: (BuildContext context) => ProviderSlider(),
        ),
      ],child: MiMaterialApp(),
    );
  }
}
