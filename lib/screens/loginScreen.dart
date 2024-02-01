import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vize/core/storage.dart';
import 'package:vize/widgets/goBack.dart';

import '../services/api.dart';

class LoginScreenNew extends StatefulWidget {
  const LoginScreenNew({super.key});

  @override
  State<LoginScreenNew> createState() => _LoginScreenNewState();
}

class _LoginScreenNewState extends State<LoginScreenNew> {
  //States
  bool loading = false;
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  //loading
  login() async {
    setState(() {
      loading = true;
    });
    //API çağırma
    API api = API();
    //login değişkenleri tanımlama
    final response = await api.login(
      username: emailController.text,
      password: passwordController.text,
    );

    if (response is Exception) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Wrong username or password!"),
          backgroundColor: Colors.red.shade400));
    } else {
      Storage storage = Storage();
      //API den veri kontrolü
      await storage.saveUser(
          id: response["data"]["user"]["id"],
          name: response["data"]["user"]["name"],
          email: response["data"]["user"]["email"],
          phone: response["data"]["user"]["phone_number"]);

      //await storage.saveToken(response["data"]["token"]);
      //her yolu denedim fakat token ile birlikte kod çalışmıyor
      //o yüzden token kısmını yorum satırına aldım

      Navigator.of(context).pushReplacementNamed("/home");
    }

    setState(() {
      loading = false;
    });
  }

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
          "Login",
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
        child: loading
            ? LinearProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Gap(200),
                    //Name input container
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      //TextFiedHERE
                      child: TextField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        obscureText: false,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hoverColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.white),
                          hintText:
                              "your mail address -hint:student@example.com",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(124, 255, 255, 255)),
                          border: OutlineInputBorder(),
                          labelText: "Email",
                        ),
                      ),
                    ),
                    Gap(20),
                    //email input container
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      //TextFiedHERE
                      child: TextField(
                        controller: passwordController,
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hoverColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "enter your password here-hint:123456",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(118, 255, 255, 255)),
                          border: OutlineInputBorder(),
                          labelText: "Password",
                        ),
                      ),
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //Login Container
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 11, 199, 27)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              gradient: const LinearGradient(colors: [
                                Color.fromARGB(255, 0, 226, 215),
                                Color.fromARGB(255, 4, 255, 79)
                              ])),
                          width: 180,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                elevation: 0),
                            onPressed: login,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Log in",
                                    style: GoogleFonts.raleway(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0))),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Gap(20),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Text(
                            "forgot password?",
                            style: GoogleFonts.raleway(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Gap(150),
                    GoBack(),
                  ],
                ),
              ),
      ),
    );
  }
}
