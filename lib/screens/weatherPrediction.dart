import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'dart:convert';


class WeatherPrediction extends StatefulWidget {
  const WeatherPrediction({super.key});
  @override
  State<WeatherPrediction> createState() => _WeatherPredictionState();
}

class _WeatherPredictionState extends State<WeatherPrediction> {
  final TextEditingController inputCity = new TextEditingController();
  final _formkey = new GlobalKey<FormState>();

  var city;
  var state;
  var country;
  var temperature;
  var weather_report;
  var humidity;
  var wind_speed;

   var enteredCity="Chennai";
  String URL ="http://api.weatherapi.com/v1/current.json?key=8868e7d431964dd89a265801230604&q="+"Chennai"+"&aqi=no";
  Future getweather() async {
    http.Response response = await http.get(Uri.parse(URL));
    var result = jsonDecode(response.body);

    setState(() {
      this.city = result['location']['name'];
      this.state = result['location']['region'];
      this.country = result['location']['country'];
      this.temperature = result['current']['temp_c'];
      this.weather_report = result['current']['condition']['text'];
      this.humidity = result['current']['humidity'];
      this.wind_speed = result['current']['wind_kph'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getweather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather Application"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage("assets/sky.jpg"), fit: BoxFit.cover)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      this.city.toString(),
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      this.state.toString() + "," + this.country.toString(),
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  ListTile(
                    leading: Image.asset('assets/temperature.jpg',height: 30),
                    title: Text("Temperature"),
                    trailing: Text(this.temperature.toString() + "\u00B0C"),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/weather.jpg',
                      height: 30,
                    ),
                    title: Text("Weather"),
                    trailing: Text(this.weather_report.toString()),
                  ),
                  ListTile(
                    leading: Image.asset('assets/humidity.png', height: 30),
                    title: Text("Humidity"),
                    trailing: Text(this.humidity.toString() + "%"),
                  ),
                  ListTile(
                    leading: Image.asset('assets/wind.png', height: 30),
                    title: Text("Wind Speed"),
                    trailing: Text(this.wind_speed.toString() + "kph"),
                  ),
                ],
              ),
            )),
            Form(
                key: _formkey,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30,10,30,10),
                  child:TextFormField(
                  controller: inputCity,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: "Enter City Name",
                      labelText: "Enter City Name",
                      border: OutlineInputBorder()),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Must have enter city name";
                    }
                  },
                ))),
           
               ElevatedButton(
                    onPressed: () {
                      if (!_formkey.currentState!.validate()) {
                        return;
                      }
                      var input = inputCity.text;
                    
                      setState(() {
                        enteredCity = inputCity.toString();
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20)),
                    child: Text("Get Weather")),
                    SizedBox(
                      height: 10,
                    )
          ],
        ));
  }
}
