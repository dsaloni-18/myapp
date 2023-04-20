import 'package:flutter/material.dart';
import 'package:myapp/screens/Admin.dart';
import 'package:myapp/screens/adduser.dart';

import '../reusable_widgets/reusable_widgets.dart';

class DonorAdmin extends StatefulWidget {
  const DonorAdmin({Key? key}) : super(key: key);

  @override
  _DonorAdminState createState() => _DonorAdminState();
}

class _DonorAdminState extends State<DonorAdmin>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  final List DonorName = [
    "Guru","Sevva","MSD"
  ];
  final List Owner = ["ABC","XYZ","PQR"];
  final List location = [
    "Vaduj",
    "Satara",
    "Solapur North",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.indigo, Colors.pinkAccent, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            height: MediaQuery.of(context).size.height * 0.65,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: DonorName.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.redAccent,
                      color: Colors.white.withOpacity(0.7),
                      child: Container(
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Image.asset('images/welcome.jpg',
                                  fit: BoxFit.fitWidth,
                                  height: 200,
                                  width: 200),
                              Text("Donor Name: " + DonorName[index],
                                  style: const TextStyle(
                                      color: Colors.pink,
                                      fontSize: 36.0,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 20,
                              ),
                              Text("Owner Name: " + Owner[index],
                                  style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 20,
                              ),
                              Text("Location: " + location[index],
                                  style: const TextStyle(
                                      color: Colors.lightGreen,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 20,
                              ),
                              firebaseUIButton(context, "Delete", () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Admin()));
                              })
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddUser()));
          },
          backgroundColor: Colors.cyan,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
