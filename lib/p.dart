import 'package:flutter/material.dart';
import 'package:homework9/p.dart';

import 'next.dart';

class Pin extends StatefulWidget {
  static const buttonSize = 60.0;

  const Pin({Key? key}) : super(key: key);

  @override
  State<Pin> createState() => _PinPageState();
}

class _PinPageState extends State<Pin> {
  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.pink.shade50,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.lightGreen,
                  Colors.white38,
                ],
              )
          ),
          /*body*/child: Padding(
          padding: const EdgeInsets.only(top: 8.0,bottom: 0.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_outlined,
                      size: 70.0,
                      color: Colors.white38,
                    ),
                    Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 25.0 , color: Colors.black54,fontWeight: FontWeight.bold),
                    ),Text(
                      'Enter PIN to login',
                      style: TextStyle(fontSize: 18.0, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_input, style: TextStyle(fontSize: 20.0)),
            ),*/Padding(
                padding: const EdgeInsets.only(top: 0.0,bottom: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Collection for
                    for (var i = 0; i < _input.length; i++)
                      Container(
                        width: 25.0,
                        height: 25.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.green.shade400,
                          shape: BoxShape.circle,
                        ),
                      ),
                    for(var i = 0; i<6-_input.length;i++)
                      Container(
                        width: 25.0,
                        height: 25.0,
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.green.shade700,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton(1),
                        _buildButton(2),
                        _buildButton(3),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton(4),
                        _buildButton(5),
                        _buildButton(6),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildButton(7),
                        _buildButton(8),
                        _buildButton(9),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: Pin.buttonSize,
                            height: Pin.buttonSize,
                          ),
                        ),
                        _buildButton(0),
                        _buildButton(-1),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ),),
    );
  }

  Widget _buildButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (num == -1) {
            print('Backspace');

            setState(() {
              // '12345'
              var length = _input.length;
              _input = _input.substring(0, length - 1);
            });
          } else {
            if(_input.length<6)
              setState(() {
                _input = '$_input$num';

              });
            if(_input.length==6){
              if(_input=='123456'){
                _input = "";
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Next()
                  ),
                );

              }else{
                showMaterialDialog(context,"Incorrect PIN","Please try again");
                _input = "";
              }

            }
            print('You pressed $num');
          }
        },
        borderRadius: BorderRadius.circular(Pin.buttonSize / 2),
        child: Container(
          decoration: (num == -1)
              ? null
              : BoxDecoration(
            border: Border.all(width: 2.0),
            shape: BoxShape.circle,
            color: Colors.white30,
          ),
          alignment: Alignment.center,
          width: Pin.buttonSize,
          height: Pin.buttonSize,
          // conditional operator (?:)
          child: (num == -1) ? Icon(Icons.backspace_outlined) : Text('$num',style: TextStyle(
              fontSize: 20.0),),
        ),
      ),
    );
  }

  void showMaterialDialog(BuildContext context, String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}