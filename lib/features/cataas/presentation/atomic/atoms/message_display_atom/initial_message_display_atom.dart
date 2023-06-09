import '../../../../configs/app_strings.dart';
import 'message_display_atom.dart';

class InitialMessageDisplayAtom extends MessageDisplayAtom {
  const InitialMessageDisplayAtom({
    super.key,
  }) : super(message: AppStrings.initialStateText);
}
