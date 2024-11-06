import 'package:atmos_api/controller/weather_provider.dart';
import 'package:atmos_api/data/image_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TempDate extends StatelessWidget {
  const TempDate({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('EEEE, dd MMMM').format(DateTime.now());

    return Container(
      child: Column(
        children: [
          Align(
            alignment: const Alignment(0.0, -0.9),
            child: Image.asset(
              imagePath['Thunderstorm'],
              height: 200,
              width: 200,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date,
                    style: GoogleFonts.lateef(
                      fontSize: 36,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  Consumer<WeatherProvider>(
                    builder: (context, weatherProvider, child) {
                      return Text(
                        "${weatherProvider.weatherModel?.temp?.toStringAsFixed(0)}°C",
                        style: GoogleFonts.lateef(
                          fontSize: 24,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      );
                    },
                  ),
                  Text(
                    DateFormat('hh:mm a').format(DateTime.now()),
                    style:
                        GoogleFonts.lateef(fontSize: 20, color: Colors.white),
                  ),
                  Consumer<WeatherProvider>(
                    builder: (context, weatherProvider, child) {
                      return Text(
                        "${weatherProvider.weatherModel?.clouds}",
                        style: GoogleFonts.lateef(
                          fontSize: 24,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
