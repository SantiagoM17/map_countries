import 'package:map_countries/domain/entities/country/country.dart';
import 'package:map_countries/domain/repositories/home_repository.dart';
import 'package:map_countries/domain/services/home_service.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeService homeService;

  HomeRepositoryImpl({required this.homeService});

  @override
  Future<String> getAccessToken() async {
    return await homeService.getAccessToken();
  }

  @override
  Future<List<Country>> getCountries({required String token}) async {
    return await homeService.getCountries(token: token);
  }
}
