import 'package:atmos_api/controller/weather_provider.dart';
// import 'package:atmos_api/services/weather_services.dart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SunriseSet extends StatelessWidget {
  const SunriseSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 10,
              ),
              Consumer<WeatherProvider>(
                  builder: (context, weatherProvider, child) {
                var sunrise = weatherProvider.weatherModel?.sunrise;

                return Column(
                  children: [
                    Image.asset(
                      "assets/images/sunrise.png",
                      height: 50,
                    ),
                    Text(
                      "Sun rise",
                      style: GoogleFonts.lateef(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "$sunrise",
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
                  var sunset = weatherProvider.weatherModel?.sunset;

                  return Column(
                    children: [
                      Image.asset(
                        "assets/images/high-tide.png",
                        height: 50,
                      ),
                      Text(
                        "Sun Set",
                        style: GoogleFonts.lateef(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "$sunset",
                        style: GoogleFonts.lateef(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const Divider(
                thickness: 4,
                color: Colors.white,
                indent: 10,
                endIndent: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
