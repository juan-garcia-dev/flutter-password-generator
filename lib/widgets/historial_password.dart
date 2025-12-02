import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/providers/provider_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistorialPassword extends StatelessWidget {
  const HistorialPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderSlider providerSlider = Provider.of<ProviderSlider>(
      context,
      listen: true,
    );

    return ListView.builder(
      itemCount: providerSlider.listaPasswords.length,
      itemBuilder: (context, index) {
        return _ElemLista(index: index);
      },
    );
  }
}

class _ElemLista extends StatelessWidget {
  const _ElemLista({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    ProviderSlider providerSlider = Provider.of<ProviderSlider>(
      context,
      listen: false,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: ListTile(
          tileColor: const Color.fromARGB(255, 189, 212, 248),
          onLongPress: () {
            providerSlider.eliminarPassword(index);
          },
          title: Text(providerSlider.listaPasswords[index],style: GoogleFonts.poppins(letterSpacing: 2),),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  ClipboardData data = ClipboardData(
                    text: providerSlider.listaPasswords[index],
                  );
                  Clipboard.setData(data);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Contraseña copiada al portapapeles"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: Icon(Icons.copy),
              ),

              IconButton(
                onPressed: () {
                  providerSlider.eliminarPassword(index);
                },
                icon: Icon(Icons.delete_outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
