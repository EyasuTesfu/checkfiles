import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/city_entity.dart';
import '../repositories/get_city_weather.dart';

class GetCityWeatherUseCase {
  final CityRepository repository;

  GetCityWeatherUseCase({required this.repository});

  Future<Either<Failure, City>> call(String cityName) async {
    return await repository.getCityWeather(cityName);
  }
}
