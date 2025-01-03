// class City {
//   String cityName;
//   String countryName;
//   String description;

//   City({
//     required this.cityName,
//     required this.countryName,
//     required this.description,
//   });

//   // Convert JSON to City object
//   factory City.fromJson(Map<String, dynamic> json) {
//     return City(
//       cityName: json['city_name'],
//       countryName: json['country_name'],
//       description: json['description'],
//     );
//   }

//   // Convert City object to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'city_name': cityName,
//       'country_name': countryName,
//       'description': description,
//     };
//   }
// }
