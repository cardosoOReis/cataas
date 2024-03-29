import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cat_cubit.dart';
import '../atoms/loading_widget_atom.dart';
import '../atoms/main_cat_frame_atom.dart';
import '../atoms/message_display_atom/initial_message_display_atom.dart';
import '../atoms/message_display_atom/message_display_atom.dart';
import 'cat_sucess_organism.dart';

class ResultDisplayOrganism extends StatelessWidget {
  const ResultDisplayOrganism({super.key});

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 150,
          minWidth: double.maxFinite,
        ),
        child: MainCatFrameAtom(
          child: BlocBuilder<CatCubit, CatState>(
            builder: (context, state) => switch (state) {
              CatInitial() => const InitialMessageDisplayAtom(),
              CatLoading() => const LoadingWidgetAtom(),
              CatSuccess(:final cat) => CatSucessOrganism(cat: cat),
              CatFailure(:final failure) =>
                MessageDisplayAtom(message: failure.message),
            },
          ),
        ),
      );
}
