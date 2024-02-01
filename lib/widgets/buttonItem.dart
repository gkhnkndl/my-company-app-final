import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/link.dart';

//programda kullanılan buton widgetlarının bulunduğu widget sayfası
class ButtonAdd extends StatelessWidget {
  final String target;
  final String buttonText;

  const ButtonAdd({
    super.key,
    required this.target,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color.fromARGB(255, 11, 199, 27)),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      width: 330,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0),
        onPressed: () => Navigator.pushNamed(context, target),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(buttonText,
                style: GoogleFonts.raleway(
                    fontSize: 18, color: Color.fromARGB(255, 239, 238, 241))),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

//farklı renkte buton ekler
class ButtonAdd2 extends StatelessWidget {
  final String target;
  final String buttonText;

  const ButtonAdd2({
    super.key,
    required this.target,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color.fromARGB(255, 11, 199, 27)),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 0, 226, 215),
            Color.fromARGB(255, 4, 255, 79)
          ])),
      width: 330,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0),
        onPressed: () => Navigator.pushNamed(context, target),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(buttonText,
                style: GoogleFonts.raleway(
                    fontSize: 19, color: Color.fromARGB(255, 24, 24, 24))),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}

//küçük boyutlu buton ekler
class ButtonAddSmall extends StatelessWidget {
  final String target;
  final String buttonText;
  final Icon iconic;

  const ButtonAddSmall({
    super.key,
    required this.target,
    required this.buttonText,
    required this.iconic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
            border:
                Border.all(width: 1, color: Color.fromARGB(255, 11, 199, 27)),
            borderRadius: BorderRadius.all(Radius.circular(7))),
        width: 105,
        height: 30,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0),
          onPressed: () => Navigator.pushNamed(context, target),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconic,
              SizedBox(width: 3),
              Text(buttonText,
                  style: GoogleFonts.raleway(
                      fontSize: 12, color: Color.fromARGB(255, 239, 238, 241))),
            ],
          ),
        ),
      ),
    );
  }
}

//url_launcher yapısında buton ekler
class ButtonAddLink extends StatelessWidget {
  final String target;
  final String buttonText;

  const ButtonAddLink({
    super.key,
    required this.target,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color.fromARGB(255, 11, 199, 27)),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      width: 330,
      height: 50,
      child: Link(
        target: LinkTarget.blank,
        uri: Uri.parse("https://myaccount.google.com/profile"),
        builder: (context, followLink) => ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0),
          onPressed: followLink,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(buttonText,
                  style: GoogleFonts.raleway(
                      fontSize: 18, color: Color.fromARGB(255, 239, 238, 241))),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
