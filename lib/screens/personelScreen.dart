import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vize/widgets/goBack.dart';
import 'package:vize/widgets/profileItem.dart';

class personelScreen extends StatefulWidget {
  const personelScreen({super.key});
  //Personeller ve personellere ait özelliklerin kayıt edilebileceği
  //bilgi ekranı (ilerleyen zamanlarda geliştirilecektir)
  @override
  State<personelScreen> createState() => _personelScreenState();
}

class _personelScreenState extends State<personelScreen> {
  //States
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController surnameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController ageController = TextEditingController(text: "");
  TextEditingController positionController = TextEditingController(text: "");
  bool marriage = false;
  List<String> hobbies = [];

  storeData() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    storage.setString("name", nameController.text);
    storage.setString("surname", surnameController.text);
    storage.setString("email", emailController.text);
    storage.setString("phone", phoneController.text);
    storage.setString("age", ageController.text);
    storage.setString("position", ageController.text);
    storage.setBool("marriage", false);
    storage.setStringList("hobbies", hobbies);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Data Saved"),
      backgroundColor: const Color.fromARGB(255, 178, 44, 201),
      behavior: SnackBarBehavior.floating,
    ));
  }

  readData() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    var name = storage.getString("name");
    var surname = storage.getString("surname");
    var email = storage.getString("email");
    var phone = storage.getString("phone");
    var age = storage.getString("age");
    var position = storage.getString("positon");
    var marriage = storage.getBool("marriage");
    var hobbies = storage.getStringList("hobbies");

    nameController.text = name ?? "";
    surnameController.text = surname ?? "";
    emailController.text = email ?? "";
    phoneController.text = phone ?? "";
    ageController.text = age ?? "";
    positionController.text = position ?? "";
    this.marriage = marriage ?? false;
    this.hobbies = hobbies ?? [];
  }

  final List<String> tumHobiler = [
    "Reading",
    "Running",
    "Playing Guitar",
    "Driving",
    "Bungee Jumping",
    "Boxing",
    "Traveling",
    "Singing",
    "Writing",
    "Diving",
    "Programming",
    "Playing Basketball"
  ];

  List<Widget> drawHobbies() {
    List<Widget> result = [];

    tumHobiler.forEach((element) {
      result.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            element,
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
          Checkbox(
            value: hobbies.contains(element),
            onChanged: (value) {
              if (value == true) {
                hobbies.add(element);
              } else {
                hobbies.remove(element);
              }
              setState(() {});
            },
          ),
        ],
      ));
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 25, 28, 46),
          Color.fromARGB(255, 34, 27, 44)
        ])),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                ProfileItem(
                  avatar: "assets/images/p6.webp",
                  user: "Gökhan Kundala",
                ),
                Gap(20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(0, 158, 158, 158),
                  ),
                  child: Column(
                    children: [
                      TextFieldShared(
                          controller: nameController,
                          hintText: "example: Gökhan",
                          labelText: "Name"),
                      Gap(20),
                      TextFieldShared(
                          controller: surnameController,
                          hintText: "example: Kundala",
                          labelText: "Surname"),
                      Gap(20),
                      TextFieldShared(
                          controller: emailController,
                          hintText: "example: gokhank@gmail.com",
                          labelText: "Email"),
                      Gap(20),
                      TextFieldShared(
                          controller: phoneController,
                          hintText: "example: 532 697 2963",
                          labelText: "Phone Number"),
                      Gap(20),
                      TextFieldShared(
                          controller: ageController,
                          hintText: "example: 29",
                          labelText: "Age"),
                      Gap(20),
                      TextFieldShared(
                          controller: positionController,
                          hintText: "example: Manager",
                          labelText: "Position"),
                      Gap(20),
                    ],
                  ),
                ),
                Text(
                  "Hobbies: ",
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
                ...drawHobbies(),
                SizedBox(height: 20),
                //Save Button
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Color.fromARGB(255, 11, 199, 27)),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 0, 226, 215),
                        Color.fromARGB(255, 4, 255, 79)
                      ])),
                  width: 270,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        elevation: 0),
                    onPressed: storeData,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Save",
                            style: GoogleFonts.raleway(
                                fontSize: 19,
                                color: Color.fromARGB(255, 24, 24, 24))),
                      ],
                    ),
                  ),
                ),
                Gap(20),
                //BackButton
                GoBack2(),
                Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldShared extends StatelessWidget {
  const TextFieldShared({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  });

  final TextEditingController controller;
  final String hintText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(157, 3, 204, 0),
            Color.fromARGB(0, 194, 3, 153)
          ]),
          borderRadius: BorderRadius.circular(10)),

      //TextFiedHERE
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        obscureText: false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: const Color.fromARGB(255, 214, 214, 214))),
          hoverColor: Colors.transparent,
          labelStyle: TextStyle(color: Color.fromARGB(255, 223, 223, 223)),
          hintText: hintText,
          hintStyle: TextStyle(color: const Color.fromARGB(101, 255, 255, 255)),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          labelText: labelText,
        ),
      ),
    );
  }
}
