import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/city_entity.dart';
import '../../domain/repositories/get_city_weather.dart';
import '../datasources/city_remote_datasources.dart';

class CityRepositoryImpl implements CityRepository {
  final CityRemoteDataSource remoteDataSource;

  CityRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, City>> getCityWeather(String cityName) async {
    return await remoteDataSource.getCityWeather(cityName);
  }
}
