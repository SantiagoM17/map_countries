import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState?> {
  List<Country> _countries = [];
  final HomeRepository homeRepository;

  List<Country> get countries => _countries;

  HomeBloc({required this.homeRepository}) : super(null);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeStarted) {
      yield Loading();
      try {
        final token = await homeRepository.getAccessToken();
        _countries = await homeRepository.getCountries(token: token);
        if (countries.isNotEmpty) {
          yield GetCountries(countries: countries);
        } else {
          yield GetCountries(countries: const []);
        }
      } catch (e) {
        yield GetCountries(countries: const []);
      }
    } else if (event is HomeSearch) {
      yield Loading();

      List<Country> countries = [];
      for (var country in this.countries) {
        List<String> list = [country.countryName];
        bool results = list.any((element) =>
            (element.toLowerCase().contains(event.search.toLowerCase())));
        if (results) {
          countries.add(country);
        }
      }
      if (countries.isNotEmpty) {
        yield GetCountries(countries: countries);
      } else {
        yield SearchIsEmpty();
      }
    }
  }
}
