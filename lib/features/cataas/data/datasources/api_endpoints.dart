class ApiEndpoints {
  static String get baseUrl => 'https://cataas.com';

  static String get catsEndpoint => '/cat';

  static String getRandomCat() => '$baseUrl$catsEndpoint';

  static String getCatById(String id) => '$baseUrl$catsEndpoint/$id';

  static String getCatByTag(String tag) => '$baseUrl$catsEndpoint/$tag';

  static String getCatByIdOrTag(String value) => '$baseUrl$catsEndpoint/$value';
}
