import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/about_screen.dart';

class BotonMenu extends StatefulWidget {
  const BotonMenu({super.key});

  @override
  State<BotonMenu> createState() => _BotonMenuState();
}

class _BotonMenuState extends State<BotonMenu> {
  bool abierto = false;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500)),
      icon: abierto ? const Icon(Icons.menu_open,color: Colors.white,) : const Icon(Icons.menu,color: Colors.white,),
      onOpened: () {
        setState(() {
          abierto = true;
        });
      },
      onCanceled: () {
        setState(() {
          abierto = false;
        });
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: const Center(child: Text("Sobre mí")),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const AboutScreen()));
            },
          ),
        ];
      },
    );
  }
}
