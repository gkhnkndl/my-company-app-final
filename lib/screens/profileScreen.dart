import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vize/widgets/menuItem.dart';
import 'package:vize/widgets/profileItem.dart';

import '../widgets/goBack.dart';
//basit bir profil ekranı daha sonra geliştirilecektir.

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 25, 28, 46),
          Color.fromARGB(255, 34, 27, 44)
        ])),
        child: Column(
          children: [
            SizedBox(height: 10),
            ProfileItem(
              avatar: "assets/images/p6.webp",
              user: "Gökhan Kundala",
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: MenuItemWhite(
                  title: "Özel bilgilerinizi kimseyle paylaşmayınız",
                  icon: Icon(Icons.warning, color: Colors.white),
                  onTap: () {}),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(38, 158, 158, 158),
              ),
              child: Column(
                children: [
                  Text(
                    "Kullanıcı Adı: gkhnkndl",
                    style:
                        GoogleFonts.raleway(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Telefon Numarası: 0544 836 4520",
                    style:
                        GoogleFonts.raleway(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Bölge: İstanbul - Avrupa",
                    style:
                        GoogleFonts.raleway(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "Ünvan: Operasyon Müdürü",
                    style:
                        GoogleFonts.raleway(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            GoBack(),
          ],
        ),
      ),
    );
  }
}
