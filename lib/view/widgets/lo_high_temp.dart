import 'package:atmos_api/controller/weather_provider.dart';
import 'package:atmos_api/services/weather_services.dart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoHighTemp extends StatelessWidget {
  const LoHighTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<WeatherProvider>(
                  builder: (context, weatherProvider, child) {
                var tempMax = weatherProvider.weatherModel?.temp_max;

                return Column(
                  children: [
                    Image.asset(
                      "assets/images/high-temperature.png",
                      height: 50,
                    ),
                    Text(
                      "High Temperature",
                      style: GoogleFonts.lateef(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "$tempMax°C",
                      style: GoogleFonts.lateef(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(
                width: 110,
              ),
              Consumer<WeatherProvider>(
                builder: (context, weatherProvider, child) {
                  var tempMin = weatherProvider.weatherModel?.temp_min;

                  return Column(
                    children: [
                      Image.asset(
                        "assets/images/low-temperature.png",
                        height: 50,
                      ),
                      Text(
                        "High Temperature",
                        style: GoogleFonts.lateef(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "$tempMin°C",
                        style: GoogleFonts.lateef(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
