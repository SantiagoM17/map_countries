import 'package:flutter/material.dart';

import 'package:map_countries/commons/widgets/view_map_widget.dart';
import 'package:map_countries/domain/entities/country/country.dart';

class ViewCountry extends StatelessWidget {
  final Country country;
  const ViewCountry({Key? key, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ViewMap()),
        );
      },
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.place),
          ),
          title: Column(
            children: [
              Text(country.countryName),
              Text(country.countryShortName),
              Text('${country.countryPhoneCode}'),
            ],
          ),
        ),
      ),
    );
  }
}
