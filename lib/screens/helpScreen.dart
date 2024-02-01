import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vize/widgets/goBack.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  //basit bir destek ekranı daha sonra geliştirilecektir.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 25, 28, 46),
            Color.fromARGB(255, 34, 27, 44)
          ])),
        ),
        centerTitle: true,
        title: Text(
          "Help",
          style: GoogleFonts.raleway(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 180),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 25, 28, 46),
            Color.fromARGB(255, 34, 27, 44)
          ])),
          child: Column(
            children: [
              Text(
                "Call Center: 444 8 966",
                style: GoogleFonts.raleway(color: Colors.white, fontSize: 20),
              ),
              Text(
                "Mail Adress: help@mycompany.app.tr",
                style: GoogleFonts.raleway(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 30),
              GoBack()
            ],
          ),
        ),
      ),
    );
  }
}
