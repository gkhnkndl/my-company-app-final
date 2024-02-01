import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/buttonItem.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

//ödevde istenilen github bağlantısının bulunduğu kısım
class _WelcomeScreenState extends State<WelcomeScreen> {
  github() {
    final Uri uri = Uri.parse("https://github.com/gkhnkndl");
    launchUrl(uri);
  }

  //kullanıcı uygulamayı ilk yüklediğinde karşısında çıkacak ekran
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 25, 28, 46),
            Color.fromARGB(255, 34, 27, 44)
          ])),
        ),
        backgroundColor: Color.fromARGB(255, 55, 55, 56),
        title: Text(
          "MyCompanyPlanner",
          style: GoogleFonts.raleway(
              color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 25, 28, 46),
          Color.fromARGB(255, 34, 27, 44)
        ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          //github bağlantı butonu
                          InkWell(
                            onTap: github,
                            child: SvgPicture.asset("assets/icons/github.svg",
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Gap(300),
                      ButtonAdd2(target: "/newlogin", buttonText: "Login"),
                      SizedBox(height: 25),
                      ButtonAdd(target: "/register", buttonText: "Register"),
                      SizedBox(height: 25),
                      ButtonAddLink(
                          target: "/google",
                          buttonText: "Continue with Google"),
                      SizedBox(height: 25),
                      ButtonAdd(
                          target: "/telephone",
                          buttonText: "Continue with phone number"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
