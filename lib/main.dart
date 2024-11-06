import 'package:atmos_api/controller/home_provider.dart';
import 'package:atmos_api/controller/location_provider.dart';
import 'package:atmos_api/controller/weather_provider.dart';
import 'package:atmos_api/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeatherProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Atmos API',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen()),
    );
  }
}
