import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/city_entity.dart';

abstract class CityRepository {
  Future<Either<Failure, City>> getCityWeather(String cityName);
}
