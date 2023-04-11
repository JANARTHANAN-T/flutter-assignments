import 'package:flutter/material.dart';

class AgeCalculator extends StatefulWidget {
  const AgeCalculator({super.key});

  @override
  State<AgeCalculator> createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  final TextEditingController age = new TextEditingController();
  final _formkey = new GlobalKey<FormState>();
  var _currentage = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Age Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formkey,
                  child: TextFormField(
                    controller: age,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "Enter your Year of birth",
                        labelText: "Enter your Year of birth",
                        border: OutlineInputBorder()),
                    validator: (val) {
                      if (val!.length != 4) {
                        return "Year of birth must have four digits";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (!_formkey.currentState!.validate()) {
                        return;
                      }
                      var input = int.parse(age.text);
                      DateTime nowDate = DateTime.now();
                      int currYear = nowDate.year;
                      var output = currYear - input;
                      setState(() {
                        _currentage = output.toString();
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    child: Text("Calculate")),
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  "Your Age is:" + _currentage,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
