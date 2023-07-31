class LocationSuggestionPost {
  final String location;
  final String countryCode;

  LocationSuggestionPost({
    required this.location,
    required this.countryCode,
  });

  Map toJson() => {
        "location": location,
        "country_code": countryCode,
      };
}
