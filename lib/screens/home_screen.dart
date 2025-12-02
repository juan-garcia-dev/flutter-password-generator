import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/provider_slider.dart';
import 'package:flutter_application_1/widgets/boton_menu.dart';
import 'package:flutter_application_1/widgets/checkbox.dart';
import 'package:flutter_application_1/widgets/historial_password.dart';
import 'package:flutter_application_1/widgets/slider_size_password.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderSlider providerSlider = Provider.of<ProviderSlider>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Generador de Contraseñas',
          style: TextStyle(color: Colors.white),
        ),
        actions: const [BotonMenu()],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.topCenter,
              end: AlignmentGeometry.bottomCenter,
              colors: [Colors.indigo.shade50, Colors.white],
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(13),
                child: SliderSizePassword(),
              ),
              Consumer<ProviderSlider>(
                builder: (context, provider, child) {
                  return Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Checkboxes(
                        title: "Minúsculas",
                        valor: provider.getMinusculas,
                        cambiar: (valor) => provider.setMinusculas(valor!),
                      ),
                      Checkboxes(
                        title: "Mayúsculas",
                        valor: provider.getMayusculas,
                        cambiar: (valor) => provider.setMayusculas(valor!),
                      ),
                      Checkboxes(
                        title: "Números",
                        valor: provider.getNumeros,
                        cambiar: (valor) => provider.setNumeros(valor!),
                      ),
                      Checkboxes(
                        title: "Símbolos",
                        valor: provider.getSimbolos,
                        cambiar: (valor) => provider.setSimbolos(valor!),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          providerSlider.createPassword();
                        },
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.indigo,
                          ),
                        ),
                        child: Text(
                          "Generar Contraseña",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Consumer<ProviderSlider>(
                        builder:
                            (
                              BuildContext context,
                              ProviderSlider value,
                              Widget? child,
                            ) => Container(
                              decoration: BoxDecoration(
                                border:  BoxBorder.all(
                                  width: 1,
                                  color: Colors.indigo,
                                ),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                value.passwordGenerada,
                                style: GoogleFonts.sourceCodePro(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ),
                      ),
                    ],
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Text("Historial reciente"),
              ),
              const Expanded(child: HistorialPassword()),
            ],
          ),
        ),
      ),
    );
  }
}
