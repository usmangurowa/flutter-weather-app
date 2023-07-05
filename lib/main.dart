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
      title: 'Flutter Demo',
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
      weatherCondition: "Cloudy");

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(title: "Detail Page"),
                ),
              );
            },
            child: const Text('Go to Detail Page'),
          ),
        ),
      ),
    );
  }
}
