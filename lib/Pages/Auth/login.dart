import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController querytextemail = TextEditingController();
  final TextEditingController querytextpass = TextEditingController();
  bool notVisible=false;
  String emaildata = "souhail";
  String passworddata = "123";
  String messgError="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Login",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xC1D5F3FF),
              border: Border.all(width: 1, color: Colors.black26),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: querytextemail,
              decoration: const InputDecoration(
                  hintText: "email",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.email)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black26),
              color: const Color(0xC1D5F3FF),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 50),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:  TextField(
              controller: querytextpass,
              obscureText: notVisible,
              decoration: InputDecoration(
                  hintText: "password",
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                      onPressed: () {
                       setState(() {
                         notVisible=!notVisible;

                       });
                      },
                      icon: Icon(
                        notVisible==true?Icons.visibility:Icons.visibility_off

                      ))),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  foregroundColor: Colors.white),
              onPressed: () {
                setState(() {
                  if(querytextemail.text==emaildata && querytextpass.text==passworddata){
                        print("Success");
                        messgError="Auth Success !";
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/home',
                              (Route<dynamic> route) => false,
                        );


                  }else{
                      messgError="your email or password is wrong !";
                  }
                });

              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                child: const Text("Login"),
              ),
            ),
          ),
          Container(
            child: Text(messgError),
          )
        ],
      ),
    );
  }
}
