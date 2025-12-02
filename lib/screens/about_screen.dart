import 'package:flutter/material.dart';
import 'package:flutter_donation_buttons/flutter_donation_buttons.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
      String textoBienvenida = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre mí',style: TextStyle(color: Colors.white),),backgroundColor:Colors.indigo,),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 250,
                child: const Text(
                  "Me llamo Juan Jesús y soy el desarrollador de esta aplicación.\n\nMe apasiona crear herramientas útiles que faciliten la vida de las personas.\n\nSi te gusta esta aplicación y quieres apoyarme, considera invitarme a un café.\n¡Gracias por tu apoyo!",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: PayPalButton(
                paypalButtonId: dotenv.env["PAYPAL_BUTTON_ID"]??"ID_NO_ENCONTRADO",
                donationText: "Invítame a un Café ☕",
                color: const Color.fromARGB(255, 231, 221, 127),
                onDonation: () {
                  setState(() {
                    textoBienvenida = "¡Gracias por tu apoyo!";
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(color: const Color.fromARGB(255, 189, 188, 188),child: Text(textoBienvenida,style: GoogleFonts.labrada(fontSize: 20),)),
            ),
            Spacer(),
            Image.asset("assets/icon/brand.png",height: 100,width: 100,),
            
          ],
        ),
      ),
    );
  }
}
