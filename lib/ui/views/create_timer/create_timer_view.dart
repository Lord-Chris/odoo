import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/extensions/context_extenstion.dart';
import '../../shared/components/_components.dart';
import '../../shared/constants/_constants.dart';
import '../home/bloc/home_bloc.dart';
import '../home/bloc/home_event.dart';
import 'bloc/create_timer_bloc.dart';
import 'bloc/create_timer_event.dart';
import 'bloc/create_timer_state.dart';

class CreateTimerView extends StatelessWidget {
  const CreateTimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: AppColors.transparent,
            leadingWidth: 80,
            title: Text(
              'Create Timer',
              style: context.tTheme.headlineSmall?.copyWith(
                color: context.cScheme.onSurface,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<CreateTimerBloc, CreateTimerState>(
              builder: (context, state) {
                return Padding(
                  padding: REdgeInsets.all(16),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            AppDropdownField<String>(
                              items: AppConstants.projectNames,
                              value: state.project,
                              label: 'Project',
                              onChanged: (val) => context
                                  .read<CreateTimerBloc>()
                                  .add(ProjectChangedEvent(val)),
                            ),
                            Spacing.vertRegular(),
                            AppDropdownField<String>(
                              items: AppConstants.taskIDs,
                              value: state.task,
                              label: 'Task',
                              onChanged: (val) => context
                                  .read<CreateTimerBloc>()
                                  .add(TaskChangedEvent(val)),
                            ),
                            Spacing.vertRegular(),
                            AppTextField(
                              label: 'Description',
                              onChanged: (val) => context
                                  .read<CreateTimerBloc>()
                                  .add(DescChangedEvent(val)),
                            ),
                            Spacing.vertRegular(),
                            Row(
                              children: [
                                Checkbox(
                                  value: state.isFav,
                                  onChanged: (val) => context
                                      .read<CreateTimerBloc>()
                                      .add(IsFavChangedEvent(val)),
                                ),
                                Spacing.horizSmall(),
                                Text(
                                  'Make Favorite',
                                  style: context.tTheme.bodyLarge?.copyWith(
                                    color: context.cScheme.onSurface,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      AppButton(
                        label: 'Create Timer',
                        onTap: () {
                          Navigator.pop(context);
                          context
                              .read<HomeBloc>()
                              .add(AddTimeSheetEvent(state.toTimerModel()));
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
