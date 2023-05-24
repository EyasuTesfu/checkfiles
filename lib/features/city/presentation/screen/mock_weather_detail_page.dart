import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/city_entity.dart';
import '../../domain/entities/weather_entity.dart';
import '../bloc/favourites/favourite_bloc.dart';
import '../bloc/favourites/favourite_event.dart';
import '../bloc/favourites/favourite_state.dart';

class CityWeatherDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Nia Name, Gabon',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '24 May 2023',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: 4, // Mocking with 4 items
                itemBuilder: (context, index) {
                  final weather = Weather(
                    date: '24 May 2023',
                    maxTempC: '30',
                    minTempC: '20',
                    avgTempC: '50',
                    url:
                        'https://www.metaweather.com/static/img/weather/png/64/sn.png',
                  ); // Mocking with a single weather object
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          weather.date,
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Row(
                          children: [
                            Text(
                              '${weather.maxTempC} / ${weather.minTempC}',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Image.network(
                              weather.url,
                              width: 50.0,
                              height: 50.0,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
