import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Next extends StatefulWidget {
  const Next({Key? key}) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<Next> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Main Page',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green.shade400,
            title: const Text('Main Page'),
          ),
          body: Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.green.shade200])),
                child: Center(
                  child: Image.asset("assets/images/jka.png"),
                ),

              )


          ),

        ));
  }
}