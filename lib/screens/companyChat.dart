import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:vize/data.dart';
import 'package:vize/widgets/profileItem.dart';

import '../responsive.dart';

class CompanyChat extends StatefulWidget {
  const CompanyChat({super.key});

  @override
  State<CompanyChat> createState() => _CompanyChatState();
}

class _CompanyChatState extends State<CompanyChat> {
  Screen device = Screen.mobile;
  //ekranın responsive yapısı
  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return PrivateChatFrame();
      case (Screen.tablet):
        return Row(
          children: [
            Expanded(child: PrivateChatFrame()),
            VerticalDivider(),
            SizedBox(width: 350, height: double.infinity, child: ChatFrame()),
          ],
        );
      case (Screen.desktop):
        return Row(
          children: [
            SizedBox(
                height: double.infinity,
                child: ProfileItemSecondary(
                    avatar: "assets/images/warship.jpg",
                    user: "Gökhan Kundala")),
            VerticalDivider(),
            Expanded(child: PrivateChatFrame()),
            VerticalDivider(),
            SizedBox(width: 350, height: double.infinity, child: ChatFrame()),
          ],
        );
    }
  }

  //responsive appbar yapısı
  drawAppBar() {
    switch (device) {
      case (Screen.mobile):
        return AppBar(title: Text("MyCompanyChat"));
      case (Screen.tablet):
        return AppBar();
      case (Screen.desktop):
        return AppBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return Scaffold(
      appBar: AppBar(),
      body: drawScreen(),
      drawer: null,
      bottomNavigationBar: null,
    );
  }

  //WhatsApp yazışma örneği için ListView ve chat_bubble kısımı
  ListView PrivateChatFrame() {
    return ListView(
      children: [
        BubbleSpecialThree(
          text: 'Merhaba arkadaşlar şirket zammını konuştunuz mu?',
          color: Color(0xFF1B97F3),
          tail: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Konuşulacağı zaman haber verin.',
          color: Color(0xFF1B97F3),
          tail: true,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Tabiki',
          color: Color(0xFFE8E8EE),
          tail: false,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: "Muhtemelen yarın konuşulur",
          color: Color(0xFFE8E8EE),
          tail: false,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: "Öğle molasından sonra",
          color: Color(0xFFE8E8EE),
          tail: true,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: 'umarım 35.000 civarında olur',
          color: Color(0xFF1B97F3),
          tail: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'daha azını kabul etmeyelim',
          color: Color(0xFF1B97F3),
          tail: true,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'o kadar yapacaklarını sanmam',
          color: Color(0xFFE8E8EE),
          tail: false,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: "cimri bunlar",
          color: Color(0xFFE8E8EE),
          tail: false,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: "neyse bekleyip görelim",
          color: Color(0xFFE8E8EE),
          tail: true,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: 'tamam o zaman',
          color: Color(0xFF1B97F3),
          tail: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'yarın görüşürüz',
          color: Color(0xFF1B97F3),
          tail: true,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'görüşürüz',
          color: Color(0xFFE8E8EE),
          tail: false,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: "Bu arada",
          color: Color(0xFFE8E8EE),
          tail: false,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: "sabah erken gelmen lazım",
          color: Color(0xFFE8E8EE),
          tail: true,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: 'neden',
          color: Color(0xFF1B97F3),
          tail: false,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'herhangi bir ürün mü gelecek',
          color: Color(0xFF1B97F3),
          tail: true,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
        ),
        BubbleSpecialThree(
          text: 'Evet',
          color: Color(0xFFE8E8EE),
          tail: false,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: "8 tane kalıp geliyor",
          color: Color(0xFFE8E8EE),
          tail: false,
          isSender: false,
        ),
        BubbleSpecialThree(
          text: "onu alacağız",
          color: Color(0xFFE8E8EE),
          tail: true,
          isSender: false,
        )
      ],
    );
  }

  //Kişilerin bilgilerinin de bulunduğu mesaj tarihi ve okundu bilgisi
  //bulunan genel chat ekranı
  ListView ChatFrame() {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) => (Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage(people[index]["avatar"].toString()),
                  radius: 32,
                ),
                Gap(8),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        people[index]["name"].toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Gap(3),
                      Text(
                        people[index]["surname"].toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Text(
                    people[index]["message"].toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text((people[index]["date"] as DateTime).hour.toString() +
                    ":" +
                    (people[index]["date"] as DateTime).minute.toString()),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Text(people[index]["unread"].toString()),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
