import 'package:map_countries/commons/api/api_manager.dart';
import 'package:map_countries/data/models/country_model.dart';
import 'package:map_countries/domain/entities/country/country.dart';
import 'package:map_countries/domain/services/home_service.dart';

import '../../commons/utils/utils.dart' show Constants;

class HomeServiceImpl implements HomeService {
  final APIManager apiManager;
  final CountryModel _countryModel = CountryModel();

  HomeServiceImpl({required this.apiManager});

  @override
  Future<String> getAccessToken() async {
    var data = await apiManager.getAPICall('${Constants.host}/getaccesstoken',
        timeLimit: const Duration(seconds: 60),
        headers: {
          'Accept': 'application/json',
          'api-token':
              'qXe6lBmljoAbZ2n6vxBJsyc4dXyDRnvgC5azPeGu-mwRtNDDkyFNU0isudsbxGMG_xs',
          'user-email': 'andresfelipemaragua@gmail.com',
        });

    final String token = data["auth_token"];

    return Future.value(token);
  }

  @override
  Future<List<Country>> getCountries({required String token}) async {
    var data = await apiManager.getAPICall('${Constants.host}/countries',
        timeLimit: const Duration(seconds: 20),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    final List<Country> countries = (data as List)
        .map((res) => _countryModel.fromJson(res as Map<String, dynamic>))
        .toList();

    return Future.value(countries);
  }
}
