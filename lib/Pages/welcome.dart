import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Container(
          color: Colors.white,

          width: double.infinity,
          child: Stack(
          fit: StackFit.expand,
            children: [
              Positioned(
                left: 120,
                top: 100,
                child: Container(

                child: const Text("Welcome To Guidancly",style: TextStyle(fontSize: 22,color: Colors.blueAccent,fontWeight: FontWeight.bold),),
              ),),
              Positioned(
                        width: 100,
                        height: 100,
                        top: -10,
                        left: 0,
                        child: Image.asset(
                          "assets/images/signuptop.png",

                        )),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Container(
                      child: Image.asset("assets/images/home.jpg"),
                    ),

                    ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.purpleAccent), // Set to transparent

                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            50.0), // Set the border radius here
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: Container(
                      width: 250,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.tealAccent), // Set to transparent
                        foregroundColor:
                        MaterialStateProperty.all(Colors.purpleAccent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                50.0), // Set the border radius here
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Container(
                          width: 250,
                          height: 50,
                          alignment: Alignment.center,
                          child:
                          const Text("SIGNUP", style: TextStyle(fontSize: 18))),
                    ),
              ]),
              Positioned(
                  width: 100,
                  height: 100,
                  bottom: -10,
                  right: -10,
                  child: Image.asset(
                    "assets/images/login_bottom.png",

                  )),


            ],
          ),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Stack(
          //
          //       children: [
          //         Positioned(
          //             left: 0,
          //
          //             child: Image.asset(
          //               "assets/images/signuptop.png",
          //
          //             ))
          //       ],
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
