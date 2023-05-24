import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../models/city_model.dart';

abstract class CityRemoteDataSource {
  Future<Either<Failure, CityModel>> getCityWeather(String cityName);
}

class CityRemoteDataSourceImpl implements CityRemoteDataSource {
  final http.Client httpClient;
  final String baseUrl =
      'https://api.worldweatheronline.com/premium/v1/weather.ashx/';

  CityRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<Either<Failure, CityModel>> getCityWeather(String cityName) async {
    final response = await httpClient.get(
      Uri.parse(
          '$baseUrl/?key=7d197f528a0548e085e123715232205&q=$cityName&format=JSON'),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return Right(CityModel.fromJson(responseBody));
    } else {
      // Handle error
      throw ServerException();
    }
  }
}
