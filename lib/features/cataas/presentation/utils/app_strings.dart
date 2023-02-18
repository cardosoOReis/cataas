class AppStrings {
  const AppStrings();

  static String get title => 'Cat as a Service';

  static String get getRandomCat => 'Get a Random Cat';

  static String get initialStateText => 'Get a Cat 😺!';

  static String get initialCatText => 'Welcome Back!';

  static String get saveCatLocallySuccess => 'Saved your cat successfully';

  static String get saveCatLocallyFailure =>
      'Sorry, it looks like something went wrong when saving your cat 😿.';

  static String get shareCatFailure =>
      'It appears that an error happened when we tried to share this cat. We are sorry 😿.';

  static String get getCatFailure =>
      'Oh oh, it appears something went wrong when fetching your cat 😿. Could you please try again?';
}
