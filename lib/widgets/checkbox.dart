import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Checkboxes extends StatelessWidget {
  const Checkboxes({
    super.key,
    required this.title,
    required this.valor,
    required this.cambiar,
  });
  final String title;
  final bool valor;
  final Function(bool?) cambiar;

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title,style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700)),
        Checkbox(value: valor, onChanged: cambiar,activeColor: Colors.indigo,),
      ],
    );
  }
}
