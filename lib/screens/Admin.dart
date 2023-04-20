import 'package:flutter/material.dart';
import 'package:myapp/screens/donor_admin.dart';
import 'package:myapp/screens/ngo_admin.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: const Text(
          "Admin Page",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
          decoration:const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.pinkAccent, Colors.black87],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),),
        bottom: TabBar(
          controller: _controller,
          tabs: const [Tab(text: "Donors"),Tab(text: "NGOs")],),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          DonorAdmin(),
          NGOAdmin(),
        ],),
    );
  }
}