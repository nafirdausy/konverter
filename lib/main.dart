import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  TextEditingController controller = TextEditingController();
    int hasilk=0, hasilr=0, input=0; 

    kelvin(){
      setState(() {
        input = int.parse(controller.text);
        hasilk = input + 273;
      });
    }

    reamor(){
      setState(() {
        input = int.parse(controller.text);
        hasilr = input * 4 ~/ 5;
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
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Masukkan Suhu Dalam Celcius",
                ),
              ), 

              SizedBox(
                height: 150
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Suhu dalam Kelvin"),
                        Text("$hasilk", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500), 
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Suhu dalam Reamor"),
                        Text("$hasilr", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500) 
                        ),
                      ],
                    ),
                  ),
                ],
              ),

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