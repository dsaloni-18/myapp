import 'package:flutter/material.dart';
import 'package:myapp/screens/donationAvailable.dart';
import 'package:myapp/screens/myrequest.dart';

class NGO extends StatefulWidget {
  const NGO({Key? key}) : super(key: key);

  @override
  _NGOState createState() => _NGOState();
}

class _NGOState extends State<NGO> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: const Text(
          "NGO",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.purple, Colors.indigo],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        ),
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(text: "My Request"),
            Tab(text: "Donations Available")
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          MyRequest(),
          DonationAvailable(),
        ],
      ),
    );
  }
}
