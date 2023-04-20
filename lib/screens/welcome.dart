import 'package:flutter/material.dart';
import 'package:myapp/reusable_widgets/reusable_widgets.dart';
import 'package:myapp/screens/login.dart';
import 'package:myapp/screens/signup.dart';
class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Waste Food Management",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple, Colors.pinkAccent, Colors.black87],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          children: [
            Expanded(
              child: Center(child: Image.asset('images/welcome.jpg',fit: BoxFit.fitWidth,height:300,width:300)),
            ),
            Expanded(
              child: Column(
                children:<Widget>[
                  const Text("Welcome to FoodShare",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  firebaseUIButton(context, "Login", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Login()));
                  }),
                  firebaseUIButton(context, "Sign up", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
