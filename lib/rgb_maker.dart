import 'package:flutter/material.dart';

class RGBmakerPage extends StatefulWidget {
  const RGBmakerPage({Key? key}) : super(key: key);

  @override
  State<RGBmakerPage> createState() => _RGBmakerPageState();
}

class _RGBmakerPageState extends State<RGBmakerPage> {
  double _Rvalue = 0;
  double _Gvalue = 0;
  double _Bvalue = 0;

  void navigateBack(BuildContext context){
    Navigator.pushNamed(context, '/homePage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RGB Color Picker'),
      ),
      body: Column(
        children: [
        Slider(
          value: _Rvalue,
          onChanged: (double value){
            setState(() {
              _Rvalue = value;
            });
          },
          max: 255,
          min: 0,
          divisions: 255,
          label: _Rvalue.round().toString(),
          activeColor: Color.fromRGBO(_Rvalue.round().toInt(), 0, 0, 1),
        ),
        Slider(
        value: _Gvalue,
        onChanged: (double value){
          setState(() {
            _Gvalue = value;
          });
        },
          max: 255,
          min: 0,
          divisions: 255,
          label: _Gvalue.round().toString(),
          activeColor: Color.fromRGBO(0, _Gvalue.round().toInt(), 0, 1),
        ),
          Slider(
            value: _Bvalue,
            onChanged: (double value){
              setState(() {
                _Bvalue = value;
              });
            },
            max: 255,
            min: 0,
            divisions: 255,
            label: _Bvalue.round().toString(),
            activeColor: Color.fromRGBO(0, 0, _Bvalue.round().toInt(), 1),
          ),
          const SizedBox(
            height: 15,
          ),
        const Text('You picked Color', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: 250.0,
          height: 250.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(_Rvalue.round().toInt(), _Gvalue.round().toInt(), _Bvalue.round().toInt(), 1),
              shape: BoxShape.circle),
        ),
          const SizedBox(
            height: 15,
          ),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                      title: const Center(child: Text('You have pick this Color')),
                      content: Container(
                        width: 25.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(_Rvalue.round().toInt(), _Gvalue.round().toInt(), _Bvalue.round().toInt(), 1),
                            shape: BoxShape.circle),),
                      actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                      ],
              ),
              );
            },
            child: const Text('Submit Color', style: TextStyle(fontSize: 18),)),
        ]
      ));
  }
}
