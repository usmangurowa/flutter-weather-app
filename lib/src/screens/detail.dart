import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wheatherapp/main.dart';
import 'package:wheatherapp/src/state/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.title});

  final String title;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    void _updateWeahter() {
      final newWeather = Weather(
          date: DateTime.now(),
          temperature: 25.0,
          humidity: 70.0,
          weatherCondition: 'Sunny',
          wind: 20.0,
          location: "Lagos");
      weatherProvider.updateWeather(newWeather);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Row(children: [
          Icon(Icons.location_on_outlined,
              color: Theme.of(context).colorScheme.onPrimary),
          SizedBox(width: 8),
          Text(widget.title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 25)),
          SizedBox(width: 8),
          Icon(Icons.arrow_drop_down,
              color: Theme.of(context).colorScheme.onPrimary),
          Spacer(),
          Icon(Icons.notifications,
              color: Theme.of(context).colorScheme.onPrimary)
        ]),
      ),
      body: Container(
        color: Colors.blue.shade300,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              if (weatherProvider.weather.weatherCondition.toLowerCase() ==
                  'cloudy')
                const Image(
                    image: AssetImage('assets/images/cloudy.png'),
                    width: 200,
                    height: 200)
              else if (weatherProvider.weather.weatherCondition.toLowerCase() ==
                  "sunny")
                const Image(
                    image: AssetImage('assets/images/sunny.png'),
                    width: 200,
                    height: 200)
              else
                const Image(
                    image: AssetImage('assets/images/cloudy.png'),
                    width: 200,
                    height: 200),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue.shade200,
                  border: Border.all(
                    color: Colors.blue.shade100,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                        "Today, ${DateFormat('dd MMMM').format(weatherProvider.weather.date)}",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    Text("${weatherProvider.weather.temperature} \u2103",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                        )),
                    Text("${weatherProvider.weather.weatherCondition}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    SizedBox(height: 10),
                    Container(
                      width: 200,
                      child: Row(
                        children: [
                          Icon(
                            Icons.wind_power,
                            color: Colors.white,
                          ),
                          SizedBox(width: 3),
                          Text("Wind",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                          Spacer(),
                          Text("${weatherProvider.weather.wind} km/hr",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 200,
                      child: Row(
                        children: [
                          Icon(
                            Icons.water_drop_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(width: 3),
                          Text("Hum",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                          Spacer(),
                          Text("${weatherProvider.weather.humidity}%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: Align(
      //   alignment: Alignment.bottomCenter,
      //   child: SizedBox(
      //     width: 200,
      //     child: FloatingActionButton(
      //       onPressed: _updateWeahter,
      //       tooltip: 'Increment',
      //       child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //         Text(
      //           "Update Weather",
      //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      //         ),
      //         Icon(Icons.arrow_drop_up)
      //       ]),
      //       backgroundColor: Colors.white,
      //       // shape: ,
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
