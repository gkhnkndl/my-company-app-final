import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//TextFieldların tasarımının tekrar tekrar yapılmaması için widget olarak
//kaydedildiği ekran
class TextInputPassword extends StatelessWidget {
  final String textTitle;
  final String hint;
  final String label;
  final TextEditingController? controller;

  const TextInputPassword({
    super.key,
    required this.textTitle,
    required this.hint,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              textTitle,
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 157, 3, 204),
                    Color.fromARGB(255, 194, 3, 153)
                  ]),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: controller,
                style: GoogleFonts.raleway(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hoverColor: Colors.white,
                  labelStyle: GoogleFonts.raleway(color: Colors.white),
                  hintText: hint,
                  hintStyle: GoogleFonts.raleway(color: Colors.white),
                  border: OutlineInputBorder(),
                  labelText: label,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  final String textTitle;
  final String hint;
  final String label;

  const TextInput({
    super.key,
    required this.textTitle,
    required this.hint,
    required this.label,
    required TextEditingController controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              textTitle,
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 157, 3, 204),
                    Color.fromARGB(255, 194, 3, 153)
                  ]),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                style: TextStyle(color: Colors.white),
                obscureText: false,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hoverColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.white),
                  border: const OutlineInputBorder(),
                  labelText: label,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
