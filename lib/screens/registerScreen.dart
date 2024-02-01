// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vize/services/api.dart';
import 'package:vize/widgets/goBack.dart';

class registerScreen extends StatefulWidget {
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
  //states
  TextEditingController numberController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController passwordCheckController =
      TextEditingController(text: "");

  //ekran açıldığında bilgilerin hafızadan yazılı olarak gelmesini sağlar
  @override
  void initState() {
    super.initState();
    readData();
  }

  //verileri kaydetmemizi sağlar
  storeData() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    storage.setString("phone", numberController.text);
    storage.setString("email", emailController.text);
    storage.setString("password", passwordController.text);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Data Saved"),
      backgroundColor: const Color.fromARGB(255, 178, 44, 201),
      behavior: SnackBarBehavior.floating,
    ));
  }

  //veri okumayı sağlar
  readData() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    var phone = storage.getString("phone");
    var email = storage.getString("email");
    var password = storage.getString("password");

    numberController.text = phone ?? "";
    emailController.text = email ?? "";
    passwordController.text = password ?? "";

    setState(() {
      numberController.text = phone ?? "";
      emailController.text = email ?? "";
      passwordController.text = password ?? "";
    });
  }

  //register için farklı bir yöntem kullandığımdan bu kısım inaktif durumdadır.
  register() {}
  bool loading = false;
  var programs = [];
  loadProgram() async {
    API api = API();
    var response = await api.getPrograms();

    if (response is Exception) {
      // TODO mesaj yaz tekrar dene
    } else {
      setState(() {
        this.programs = response["data"];
        print(response);
      });
    }
    setState(() {
      loading = false;
    });
  }

  /*@override
  void initState() {
    super.initState();
    loadProgram();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Register",
          style: GoogleFonts.raleway(
              color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          const Color.fromARGB(255, 25, 28, 46),
          Color.fromARGB(255, 34, 27, 44)
        ])),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(100),
              //TextFields
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 157, 3, 204),
                      Color.fromARGB(255, 194, 3, 153)
                    ]),
                    borderRadius: BorderRadius.circular(10)),
                //TextFiedHERE
                child: TextField(
                  controller: numberController,
                  style: TextStyle(color: Colors.white),
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hoverColor: Colors.white,
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    hintText: "example: 544 836 4520",
                    hintStyle: TextStyle(
                        color: const Color.fromARGB(89, 255, 255, 255)),
                    border: OutlineInputBorder(),
                    labelText: "Phone Number",
                  ),
                ),
              ),
              Gap(10),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 157, 3, 204),
                      Color.fromARGB(255, 194, 3, 153)
                    ]),
                    borderRadius: BorderRadius.circular(10)),
                //TextFiedHERE
                child: TextField(
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hoverColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "example: gokhankundala@gmail.com",
                    hintStyle: TextStyle(
                        color: const Color.fromARGB(97, 255, 255, 255)),
                    border: OutlineInputBorder(),
                    labelText: "Email",
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 157, 3, 204),
                      Color.fromARGB(255, 194, 3, 153)
                    ]),
                    borderRadius: BorderRadius.circular(10)),
                //TextFiedHERE
                child: TextField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hoverColor: Colors.white,
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: "Do no share your password with anyone",
                    hintStyle: TextStyle(
                        color: const Color.fromARGB(101, 255, 255, 255)),
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                ),
              ),
              Gap(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          Text("Register",
                              style: GoogleFonts.raleway(
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 24, 24, 24))),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GoBack(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
