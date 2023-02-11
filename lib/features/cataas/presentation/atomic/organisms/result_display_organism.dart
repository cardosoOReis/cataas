import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../cubits/cat_cubit.dart';
import '../../utils/app_colors.dart';
import '../atoms/cat_display_atom.dart';
import '../atoms/loading_widget_atom.dart';
import '../atoms/main_cat_frame_atom.dart';
import '../atoms/message_display_atom.dart';

class ResultDisplayOrganism extends StatelessWidget {
  const ResultDisplayOrganism({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainCatFrameAtom(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 100,
          minWidth: double.maxFinite,
        ),
        child: BlocBuilder<CatCubit, CatState>(
          builder: (context, state) {
            if (state.status.isInitial) {
              return const Center(
                child: MessageDisplayAtom(message: 'Get a Cat 😺'),
              );
            }
            if (state.status.isLoading) {
              return const LoadingWidgetAtom();
            }
            if (state.status.isSuccess) {
              return Center(
                child: Column(
                  children: [
                    CatDisplayAtom(
                      catEntity: state.catEntity!,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.maxFinite,
                      height: 50,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Cat ID: ${state.catEntity?.id}',
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const SizedBox.square(
                              dimension: 35,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    Icons.share,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const SizedBox.square(
                              dimension: 35,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.secondary,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Center(
                                  child: FaIcon(
                                    Icons.download,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state.status.isFailure) {
              return MessageDisplayAtom(
                message: state.failure!.message,
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
