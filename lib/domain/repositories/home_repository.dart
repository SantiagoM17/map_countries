import 'package:map_countries/domain/entities/country/country.dart';

abstract class HomeRepository {
  Future<String> getAccessToken();
  Future<List<Country>> getCountries({required String token});
}
