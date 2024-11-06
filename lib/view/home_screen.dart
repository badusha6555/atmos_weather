import 'package:atmos_api/controller/home_provider.dart';
import 'package:atmos_api/controller/location_provider.dart';

import 'package:atmos_api/data/image_path.dart';
import 'package:atmos_api/services/weather_services.dart.dart';
import 'package:atmos_api/view/widgets/lo_high_temp.dart';
import 'package:atmos_api/view/widgets/sunrise_set.dart';

import 'package:atmos_api/view/widgets/temp_date.dart';
import 'package:atmos_api/view/widgets/view_location.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    locationProvider.getCurrentPosition().then((_) {
      if (locationProvider.currentLocationName != null) {
        var city = locationProvider.currentLocationName!.locality;
        if (city != null) {
          Provider.of<WeatherServices>(context, listen: false)
              .getWeatherData(city, context);
        }
      }
    });
    // Provider.of<HomeProvider>(context, listen: false).Reload(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: GoogleFonts.lateef(fontSize: 37, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(0, 162, 27, 27),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 100),
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImages['Thunderstorm']),
              fit: BoxFit.cover,
            ),
          ),
          child: const Stack(
            children: [
              Positioned(
                top: 10,
                child: ViewLocation(),
              ),
              Positioned(
                top: 90,
                left: 40,
                child: TempDate(),
              ),
              Positioned(
                bottom: 180,
                left: 24,
                child: LoHighTemp(),
              ),
              Positioned(
                bottom: 30,
                left: 24,
                child: SunriseSet(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  searchCity(context) async {
    Provider.of<LocationProvider>(context, listen: false)
        .getWeatherData(context);
  }
}
