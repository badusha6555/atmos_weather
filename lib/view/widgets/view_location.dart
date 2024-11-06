import 'package:atmos_api/controller/home_provider.dart';
import 'package:atmos_api/controller/location_provider.dart';
import 'package:atmos_api/controller/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ViewLocation extends StatelessWidget {
  const ViewLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('EEEE, dd MMMM').format(DateTime.now());
    LocationProvider locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    return Consumer<LocationProvider>(
      builder: (context, value, child) {
        String locationCity;
        if (locationProvider.currentLocationName != null) {
          locationCity =
              locationProvider.currentLocationName!.locality.toString();
        } else {
          locationCity = "Unknown location";
        }
        return Container(
          child: Row(children: [
            const SizedBox(width: 10),
            const Icon(
              Icons.location_on,
              color: Colors.redAccent,
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locationCity,
                  style: GoogleFonts.lateef(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  locationProvider.currentLocationName!.subLocality.toString(),
                  style: GoogleFonts.lateef(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            const SizedBox(width: 10),
            Consumer<HomeProvider>(
              builder: (context, value, child) {
                return IconButton(
                  onPressed: () {
                    value.Reload(context);
                  },
                  icon: const Icon(Icons.refresh),
                  color: Colors.redAccent,
                );
              },
            ),
            Container(
              height: 60,
              width: 170,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: value.searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.lateef(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            // const SizedBox(width: 0),
            IconButton(
                onPressed: () {
                  Provider.of<WeatherProvider>(context, listen: false)
                      .getWeatherData(
                    value.searchController.text,
                    context,
                  );
                },
                icon: Icon(Icons.search))
          ]),
        );
      },
    );
  }
}
