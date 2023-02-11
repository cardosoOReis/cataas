import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cat_cubit.dart';
import '../atoms/cat_display_atom.dart';
import '../atoms/loading_widget_atom.dart';
import '../atoms/main_cat_frame_atom.dart';
import '../atoms/messaage_display_atom.dart';

class ResultDisplayOrganism extends StatelessWidget {
  const ResultDisplayOrganism({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainCatFrameAtom(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 50,
          minWidth: double.maxFinite,
        ),
        child: BlocBuilder<CatCubit, CatState>(
          builder: (context, state) {
            if (state.status.isInitial) {
              return MessaageDisplayAtom(message: 'Get a Cat 😺');
            }
            if (state.status.isLoading) {
              return LoadingWidgetAtom();
            }
            if (state.status.isSuccess) {
              return Center(
                child: CatDisplayAtom(
                  catEntity: state.catEntity!,
                ),
              );
            }
            if (state.status.isFailure) {
              return MessaageDisplayAtom(
                message: state.failure!.message,
              );
            }

            return Placeholder();
          },
        ),
      ),
    );
  }
}
