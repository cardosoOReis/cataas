import 'cat_text_field.dart';

class CatMessageTextField extends CatTextField {
  const CatMessageTextField({
    super.key,
    super.onValueChanged,
  }) : super(
          labelText: 'Text',
          hintText: 'Add some text to your cat image.',
        );
}
