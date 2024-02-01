// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/storage.dart';
import '../widgets/buttonItem.dart';
import '../widgets/menuItem.dart';
import '../responsive.dart';
import '../widgets/profileItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //login için map yapısı değişkenlerini tanımalama
  Map<String, dynamic> user = {
    "name": "",
    "id": "",
    "phone": "",
    "email": "",
  };
  //login olup olmadığı sorgusu
  checkLogin() async {
    Storage storage = Storage();

    final user = await storage.loadUser();

    if (user != null) {
      setState(() {
        this.user = user;
      });
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Screen device = Screen.mobile;
  //responsive ekran  yapısı
  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return SizedBox(child: ListFrame());
      case (Screen.tablet):
        return Row(
          children: [
            SizedBox(width: 230, child: DrawerFrameExtended(context)),
            Expanded(child: ListFrame()),
          ],
        );
      case (Screen.desktop):
        return Row(
          children: [
            SizedBox(width: 230, child: DrawerFrameExtended(context)),
            Expanded(child: ListFrame()),
          ],
        );
    }
  }

  //responsive drawer yapısı
  drawDrawer() {
    switch (device) {
      case (Screen.mobile):
        return DrawerFrame(context);
      case (Screen.tablet):
        return null;
      case (Screen.desktop):
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    //Screen Detect
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });

    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add_box),
            ),
            onTap: () => "",
          ),
        ],
        iconTheme: IconThemeData(
            color: const Color.fromARGB(255, 253, 253, 253), size: 40),
        centerTitle: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 25, 28, 46),
            Color.fromARGB(255, 34, 27, 44)
          ])),
        ),
        backgroundColor: Color.fromARGB(255, 55, 55, 56),
      ),
      //fonksiyonların kullanıldığı yer
      body: drawScreen(),
      drawer: drawDrawer(),
    );
  }

  Drawer DrawerFrame(BuildContext context) {
    return Drawer(
      width: 340,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          ProfileItem(
              user: "Gökhan Kundala",
              avatar: "assets/images/p6.webp",
              onTap: () {
                Navigator.pushNamed(context, "/profile");
              }),
          SizedBox(height: 50),
          Expanded(
            child: Column(
              children: [
                MenuItem(
                    title: "Home Screen",
                    icon: Icon(Icons.home, size: 30),
                    onTap: () {
                      Navigator.pushNamed(context, "/home");
                    }),
                Divider(),
                MenuItem(
                    title: "My Company",
                    icon: Icon(Icons.book_online_outlined, size: 30),
                    onTap: () {
                      Navigator.pushNamed(context, "/company");
                    }),
                Divider(),
                MenuItem(
                    title: "My Lists",
                    icon: Icon(Icons.list_alt_outlined, size: 30),
                    onTap: () {
                      Navigator.pushNamed(context, "/home");
                    }),
                Divider(),
                MenuItem(
                    title: "Help",
                    icon: Icon(Icons.help_center_outlined, size: 30),
                    onTap: () {
                      Navigator.pushNamed(context, "/help");
                    }),
                Divider(),
                MenuItem(
                    title: "Settings",
                    icon: Icon(Icons.settings_outlined, size: 30),
                    onTap: () {
                      Navigator.pushNamed(context, "/settings");
                    }),
                Divider(),
                MenuItem(
                    title: "Personels",
                    icon: Icon(Icons.person_off_outlined, size: 30),
                    onTap: () {
                      Navigator.pushNamed(context, "/personnels");
                    }),
                Divider(),
                MenuItem(
                    title: "Chat",
                    icon: Icon(Icons.chat_bubble_outline, size: 30),
                    onTap: () {
                      Navigator.pushNamed(context, "/chat");
                    }),
              ],
            ),
          ),
          MenuItem(
            icon: Icon(Icons.logout_outlined),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/welcome", (route) => false);
            },
            title: "Sign Out",
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Container ListFrame() {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 25, 28, 46),
        Color.fromARGB(255, 34, 27, 44),
      ])),
      child: Expanded(
        child: Container(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "My Lists",
                          style: GoogleFonts.raleway(
                              color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                  ],
                ),
                TrackAdd("assets/images/list.png", "Müşteri Kodları",
                    "Gökhan Kundala"),
                TrackAdd("assets/images/list.png", "Fiyat Listesi",
                    "Pazarlama Ekibi"),
                TrackAdd("assets/images/list.png", "İhracat Beyannameleri",
                    "Operasyon Ekibi"),
                TrackAdd(
                    "assets/images/list.png", "Gelen Ürünler", "Depo Birimi"),
                TrackAdd(
                    "assets/images/list.png", "Giden Ürünler", "Depo Birimi"),
                TrackAdd("assets/images/list.png", "Cari Açık Listesi",
                    "Muhasebe Birimi"),
                SizedBox(height: 30),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Shared Lists",
                          style: GoogleFonts.raleway(
                              color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                  ],
                ),
                TrackAdd("assets/images/list.png", "Müşteri Kodları",
                    "Gökhan Kundala"),
                TrackAdd("assets/images/list.png", "Fiyat Listesi",
                    "Pazarlama Ekibi"),
                TrackAdd("assets/images/list.png", "İhracat Beyannameleri",
                    "Operasyon Ekibi"),
                TrackAdd(
                    "assets/images/list.png", "Gelen Ürünler", "Depo Birimi"),
                TrackAdd(
                    "assets/images/list.png", "Giden Ürünler", "Depo Birimi"),
                TrackAdd("assets/images/list.png", "Cari Açık Listesi",
                    "Muhasebe Birimi"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Padding TrackAdd(String photo, String title, String artist) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, left: 4),
    child: Container(
      width: 355,
      height: 90,
      decoration: BoxDecoration(color: Color.fromARGB(0, 168, 41, 41)),
      child: Row(
        children: [
          Image.asset(
            photo,
            width: 100,
            height: 100,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    child: Text(title,
                        style: GoogleFonts.raleway(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.clip),
                  ),
                ],
              ),
              Container(
                child: Text(artist,
                    style: GoogleFonts.raleway(
                      fontSize: 16,
                      color: Color.fromARGB(192, 255, 255, 255),
                    ),
                    overflow: TextOverflow.clip),
              ),
              SizedBox(height: 4),
              Container(
                child: Row(
                  children: [
                    ButtonAddSmall(
                      target: "/edit",
                      buttonText: "Edit",
                      iconic: Icon(Icons.edit_document,
                          size: 12, color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    ButtonAddSmall(
                      target: "/delete",
                      buttonText: "Delete",
                      iconic: Icon(Icons.delete, size: 12, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(width: 15),
        ],
      ),
    ),
  );
}

//tablet ve desktop görünümündeki drawerın tasarlandığı kısım
Container DrawerFrameExtended(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromARGB(255, 25, 28, 46),
      Color.fromARGB(255, 25, 28, 46),
    ])),
    child: Column(
      children: [
        ProfileItemSecondary(
            user: "Gökhan Kundala",
            avatar: "assets/images/p6.webp",
            onTap: () {
              Navigator.pushNamed(context, "/profile");
            }),
        SizedBox(height: 50),
        Expanded(
          child: Column(
            children: [
              MenuItemWhite(
                  title: "Home Screen",
                  icon: Icon(Icons.home, size: 30, color: Colors.white),
                  onTap: () {
                    Navigator.pushNamed(context, "/home");
                  }),
              Divider(),
              MenuItemWhite(
                  title: "My Company",
                  icon: Icon(Icons.book_online_outlined,
                      size: 30, color: Colors.white),
                  onTap: () {
                    Navigator.pushNamed(context, "/company");
                  }),
              Divider(),
              MenuItemWhite(
                  title: "My Lists",
                  icon: Icon(Icons.list_alt_outlined,
                      size: 30, color: Colors.white),
                  onTap: () {
                    Navigator.pushNamed(context, "/home");
                  }),
              Divider(),
              MenuItemWhite(
                  title: "Help",
                  icon: Icon(Icons.help_center_outlined,
                      size: 30, color: Colors.white),
                  onTap: () {
                    Navigator.pushNamed(context, "/help");
                  }),
              Divider(),
              MenuItemWhite(
                  title: "Settings",
                  icon: Icon(Icons.settings_outlined,
                      size: 30, color: Colors.white),
                  onTap: () {
                    Navigator.pushNamed(context, "/settings");
                  }),
              Divider(),
              MenuItemWhite(
                  title: "Personels",
                  icon: Icon(Icons.person_off_outlined,
                      size: 30, color: Colors.white),
                  onTap: () {
                    Navigator.pushNamed(context, "/personnels");
                  }),
              Divider(),
              MenuItemWhite(
                  title: "Chat",
                  icon: Icon(Icons.chat_bubble_outline,
                      size: 30, color: Colors.white),
                  onTap: () {
                    Navigator.pushNamed(context, "/chat");
                  }),
            ],
          ),
        ),
        MenuItemWhite(
          icon: Icon(Icons.logout_outlined, color: Colors.white),
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, "/welcome", (route) => false);
          },
          title: "Sign Out",
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}
