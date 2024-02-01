import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vize/widgets/profileItem.dart';
import '../widgets/goBack.dart';

class MyCompanyScreen extends StatefulWidget {
  const MyCompanyScreen({super.key});

  @override
  State<MyCompanyScreen> createState() => _MyCompanyScreenState();
}

class _MyCompanyScreenState extends State<MyCompanyScreen> {
  phone() {
    final Uri uri = Uri.parse("tel:+902128364520");
    launchUrl(uri);
  }

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
              avatar: "assets/images/warship.jpg",
              user: "Bensalem Dış Ticaret Limited Şirketi",
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text("Vergi No: 1640859157",
                      style: GoogleFonts.raleway(color: Colors.white)),
                  Text("Telefon Numarası: 0212 836 4520",
                      style: GoogleFonts.raleway(color: Colors.white)),
                  Text("Bölge: İstanbul - Avrupa",
                      style: GoogleFonts.raleway(color: Colors.white)),
                  Text("Adres: Balıkyolu Mh. Ozanlar Cd. No: 127",
                      style: GoogleFonts.raleway(color: Colors.white)),
                  Gap(20),
                  Text("Bizi Arayın!",
                      style: GoogleFonts.raleway(
                          color: Colors.white, fontSize: 20)),
                  Gap(5),
                  InkWell(
                      onTap: phone,
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                        size: 30,
                      )),
                ],
              ),
            ),
            SizedBox(height: 35),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    "Hakkımızda",
                    style: GoogleFonts.raleway(color: Colors.white),
                  ),
                  Divider(),
                  Text(
                      "Dış ticaret işi ile uğraşıyoruz şu anlık havayolu ve gemi ile gönderim sağlıyoruz.",
                      style: GoogleFonts.raleway(color: Colors.white)),
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
