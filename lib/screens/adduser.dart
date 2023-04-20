import 'package:flutter/material.dart';
import 'package:myapp/reusable_widgets/reusable_widgets.dart';
import 'package:myapp/screens/Admin.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController _textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Assign Employee",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.indigo, Colors.pinkAccent, Colors.black87],
                begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[

                reusableTextField("Restaurant/NGO Name", Icons.warehouse_outlined, false, _textEditingController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Owner Name", Icons.person_outline_outlined, true,_textEditingController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Category:Donor/NGO", Icons.category_outlined, true, _textEditingController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Contact Number", Icons.phone_outlined, true, _textEditingController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Location of Donor/NGO", Icons.location_on, true, _textEditingController),
                const SizedBox(
                  height: 5,
                ),

                firebaseUIButton(context, "Submit", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Admin()));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}