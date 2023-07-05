import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import "src/screens/detail.dart";
import 'src/state/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => WeatherProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Abuja'),
    );
  }
}

class WeatherProvider extends ChangeNotifier {
  Weather _weather = Weather(
      date: DateTime.now(),
      temperature: 29.0,
      humidity: 50.8,
      wind: 0.9,
      weatherCondition: "Cloudy",
      location: "Abuja");

  Weather get weather => _weather;

  void updateWeather(Weather newWeather) {
    _weather = newWeather;
    notifyListeners();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Weather> weatherData = [
    Weather(
      humidity: 80.0,
      temperature: 25.0,
      wind: 10.0,
      weatherCondition: 'Cloudy',
      location: 'New York',
      date: DateTime.now(),
    ),
    Weather(
      humidity: 70.0,
      temperature: 30.0,
      wind: 8.0,
      weatherCondition: 'Sunny',
      location: 'Los Angeles',
      date: DateTime.now(),
    ),
    Weather(
      humidity: 90.0,
      temperature: 20.0,
      wind: 5.0,
      weatherCondition: 'Rainy',
      location: 'London',
      date: DateTime.now(),
    ),
    Weather(
      humidity: 60.0,
      temperature: 35.0,
      wind: 12.0,
      weatherCondition: 'Sunny',
      location: 'Lagos',
      date: DateTime.now(),
    ),
    Weather(
      humidity: 50.0,
      temperature: 40.0,
      wind: 15.0,
      weatherCondition: 'Sunny',
      location: 'Abuja',
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      // appBar: AppBar(),
      body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.blue.shade200,
          child: Column(
            children: [
              // Expanded(child: ),
              Container(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 48, bottom: 0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Search for a location",
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final weatherItem = weatherData[index];
                    return ListTile(
                        title: Text(weatherItem.location),
                        titleTextStyle:
                            const TextStyle(fontSize: 24, color: Colors.white),
                        subtitle: Text(
                            "${DateFormat.yMMMd().format(weatherItem.date)} - ${weatherItem.weatherCondition} - ${weatherItem.temperature}°C"),
                        onTap: () => {
                              weatherProvider.updateWeather(weatherItem),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                    title: weatherItem.location,
                                  ),
                                ),
                              )
                            });
                  },
                  itemCount: weatherData.length,
                ),
              ),
            ],
          )),
    );
  }
}
// Center(
//           child: TextButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const DetailPage(title: "Detail Page"),
//                 ),
//               );
//             },
//             child: const Text('Go to Detail Page'),
//           ),
//         ),