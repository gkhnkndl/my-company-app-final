import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vize/widgets/menuItem.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

//basit bir ayarlar ekranı daha sonra geliştirilecektir.
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
          "Settings",
          style: GoogleFonts.raleway(color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 25, 28, 46),
          Color.fromARGB(255, 34, 27, 44)
        ])),
        child: Column(
          children: [
            MenuItemWhite(
                title: "Theme Color",
                icon: Icon(Icons.switch_account, color: Colors.white),
                onTap: null),
            MenuItemWhite(
                title: "Account Settings",
                icon: Icon(Icons.switch_account, color: Colors.white),
                onTap: null),
            MenuItemWhite(
                title: "Privacy",
                icon: Icon(Icons.switch_account, color: Colors.white),
                onTap: null),
            MenuItemWhite(
                title: "Accessability Settings",
                icon: Icon(Icons.switch_account, color: Colors.white),
                onTap: null),
          ],
        ),
      ),
    );
  }
}
