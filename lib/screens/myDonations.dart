import 'package:flutter/material.dart';
import 'package:myapp/reusable_widgets/reusable_widgets.dart';
import 'package:myapp/screens/Donor.dart';

class MyDonations extends StatefulWidget {
  const MyDonations({Key? key}) : super(key: key);

  @override
  _MyDonationsState createState() => _MyDonationsState();
}

class _MyDonationsState extends State<MyDonations>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }
  final List foodtype = [
    'junkFood',
    "fastfood",
    "Pizza",
    "Idli Sambar",
    "Pithala Bhakari",
    "Puri-Bhaji"
  ];
  final List ageGroup = ['25', '20', '20', '55', '45', '60'];
  final List location = [
    "Vaduj",
    "Satara",
    "Solapur North",
    "Vaduj",
    "Solapur West",
    "Solapur North"
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.indigo, Colors.pinkAccent, Colors.black87],
              begin: Alignment.topCenter, end: Alignment.bottomCenter)),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            height: MediaQuery.of(context).size.height * 0.65,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: foodtype.length, itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.redAccent,
                  color: Colors.white.withOpacity(0.7),
                  child: Container(
                    child: Center(
                      child: Column(
                        children:<Widget>[
                          Image.asset('images/welcome.jpg',fit:BoxFit.fitWidth,height:200,width:200),
                          Text("Food: "+foodtype[index],
                              style: const TextStyle(
                                  color: Colors.pink,
                                  fontSize: 36.0,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("AgeGroup: "+ageGroup[index],
                              style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("Location: "+location[index],
                              style: const TextStyle(
                                  color: Colors.lightGreen,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 20,
                          ),
                          firebaseUIButton(context, "Cancel" , () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Donor()));
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
      ),
    );
  }
}