import 'package:flutter/material.dart';
import 'package:flutter_course_assignment/screens/ageCalculator.dart';
import 'package:flutter_course_assignment/screens/bmiCalculator.dart';
import 'package:flutter_course_assignment/screens/weatherPrediction.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Course Assignment"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AgeCalculator()));
                  },
                  child: Text("Age Calculator")),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
                height: 80,
                width: 200,
                child: ElevatedButton(
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BMICalculator()),
                        ),
                    child: Text("BMI Calculator"))),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
                height: 80,
                width: 200,
                child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AgeCalculator())),
                    child: Text("Website"))),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
                height: 80,
                width: 200,
                child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WeatherPrediction())),
                    child: Text("Weather Prediction"))),
          ],
        ),
      ),
    );
  }
}
