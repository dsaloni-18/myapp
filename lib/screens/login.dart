import 'package:flutter/material.dart';
import 'package:myapp/reusable_widgets/reusable_widgets.dart';
import 'package:myapp/screens/Admin.dart';
import 'package:myapp/screens/Donor.dart';
import 'package:myapp/screens/NGO.dart';
import 'package:myapp/screens/resetpassword.dart';
import 'package:myapp/screens/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

  String value = "Admin";
  var items = ['Admin', 'NGO', 'Donor'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign In",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.indigo, Colors.pinkAccent, Colors.black87],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                Image.asset('images/login.png',
                    fit: BoxFit.fitWidth, width: 240, height: 240),
                reusableTextField("Enter UserName", Icons.person_pin_outlined,
                    false, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.perm_identity_sharp,
                      color: Colors.black,
                    ),
                    labelText: "Select Your Role",
                    labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white.withOpacity(0.8),
                    errorStyle: const TextStyle(
                        color: Colors.redAccent, fontSize: 16.0),
                    hintText: 'Select Your Role',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),borderSide: const BorderSide(width: 0, style: BorderStyle.none)
                    ),
                  ),
                  child: DropdownButtonHideUnderline(

                    child: DropdownButton<String>(
                      value: value,
                      isDense: true,
                      items: items.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          value = newValue!;
                          //print(value);
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Login", () {
                  if (value == 'Admin') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Admin()));
                  } else if (value == 'NGO') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NGO()));
                  } else if (value == 'Donor') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Donor()));
                  }
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }
  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUp()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ResetPassword())),
      ),
    );
  }
}
