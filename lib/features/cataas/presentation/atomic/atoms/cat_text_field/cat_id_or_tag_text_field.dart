import 'cat_text_field.dart';

class CatIdOrTagTextField extends CatTextField {
  const CatIdOrTagTextField({
    super.key,
    super.controller,
  }) : super(
          labelText: 'Id or Tag',
          hintText: "Get a cat based on it's id or tag",
        );
}
