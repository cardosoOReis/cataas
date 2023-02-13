class AppStrings {
  const AppStrings();

  static String get title => 'Cat as a Service';

  static String get getRandomCat => 'Get a Random Cat';

  static String get getCatById => "Get a Cat by it's Id";

  static String get getCatByIdLabel => 'ID';

  static String get getCatByIdHintText => "Get a cat based on it's id.";

  static String get getCatByTag => "Get a Cat by it's Tag";

  static String get getCatByTagLabel => "Tag";

  static String get getCatByTagHintText => "Get a cat based on tag.";

  static String get initialCatText => 'Welcome Back!';

  static String get saveCatLocallySuccess => 'Saved your cat successfully';

  static String get saveCatLocallyFailure =>
      'Sorry, it looks like something went wrong when saving your cat 😿.';

  static String get shareCatFailure =>
      'It appears that an error happened when we tried to share this cat. We are sorry 😿.';
}
