import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamor = 0;

    kelvin(){
      setState(() {
        _inputUser = double.parse(controller.text);
        _kelvin = _inputUser + 273;
      });
    }

    reamor(){
      setState(() {
        _inputUser = double.parse(controller.text);
        _reamor = _inputUser * 4 / 5;
      });
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(controller: controller), 

              SizedBox(
                height: 150
              ),

              Result(kelvin: _kelvin, reamor: _reamor),

              SizedBox(
                height: 220
              ),
              
              ElevatedButton(
                onPressed: (){
                  kelvin();
                  reamor();
                }, 
                child: Container(
                  width: 400,
                  height: 40,
                  alignment: Alignment.center,
                  child: Text('Konversi Suhu',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required double kelvin,
    required double reamor,
  }) : _kelvin = kelvin, _reamor = reamor, super(key: key);

  final double _kelvin;
  final double _reamor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Suhu dalam Kelvin"),
              Text("$_kelvin", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500), 
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Suhu dalam Reamor"),
              Text("$_reamor", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500) 
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Masukkan Suhu Dalam Celcius",
      ),
    );
  }
}