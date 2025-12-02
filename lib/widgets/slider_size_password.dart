import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/provider_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SliderSizePassword extends StatelessWidget {
  const SliderSizePassword({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderSlider providerSlider = Provider.of<ProviderSlider>(context);
    return Column(
      children: [
        Text(
          "Longitud: ${providerSlider.sizeSlider.toStringAsFixed(0)}",
          style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold)
        ),
        Slider(
          activeColor: Colors.indigo,
          min: 4,
          max: 12,
          value: providerSlider.sizeSlider.toDouble(),
          onChanged: (double valor) {
            providerSlider.setSizeSlider(valor);
          },
        ),
      ],
    );
  }
}
