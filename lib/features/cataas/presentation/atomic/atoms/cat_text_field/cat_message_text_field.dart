import 'cat_text_field.dart';

class CatMessageTextField extends CatTextField {
  const CatMessageTextField({
    required super.controller,
    super.key,
  }) : super(
          labelText: 'Text',
          hintText: 'Add some text to your cat image.',
        );
}
