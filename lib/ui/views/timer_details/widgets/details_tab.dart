import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/_core.dart';
import '../../../shared/constants/_constants.dart';
import '../bloc/timer_details_bloc.dart';

class DetailsTab extends StatelessWidget {
  const DetailsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TimerDetailsBloc>().state;
    return ListView(
      padding: REdgeInsets.all(16),
      children: [
        Container(
          padding: REdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.cScheme.onSurface.withOpacity(.08),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Project',
                style: context.tTheme.bodySmall?.copyWith(
                  color: context.cScheme.onSurface,
                ),
              ),
              Spacing.vertTiny(),
              Row(
                children: [
                  Container(
                    width: 2,
                    height: 24.r,
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Spacing.horizSmall(),
                  Text(
                    state.timeSheet.project,
                    style: context.tTheme.titleMedium?.copyWith(
                      color: context.cScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Spacing.vertRegular(),
              Text(
                'Deadline',
                style: context.tTheme.bodySmall?.copyWith(
                  color: context.cScheme.onSurface,
                ),
              ),
              Spacing.vertTiny(),
              Row(
                children: [
                  Text(
                    DateFormat('dd/MM/yyyy').format(state.timeSheet.deadline),
                    style: context.tTheme.titleMedium?.copyWith(
                      color: context.cScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Spacing.vertRegular(),
              Text(
                'Assigned to',
                style: context.tTheme.bodySmall?.copyWith(
                  color: context.cScheme.onSurface,
                ),
              ),
              Spacing.vertTiny(),
              Row(
                children: [
                  Text(
                    state.timeSheet.assignee,
                    style: context.tTheme.titleMedium?.copyWith(
                      color: context.cScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Spacing.vertSmall(),
        Container(
          padding: REdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.cScheme.onSurface.withOpacity(.08),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Description',
                      style: context.tTheme.bodySmall?.copyWith(
                        color: context.cScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
              Spacing.vertTiny(),
              Text(
                state.timeSheet.description,
                style: context.tTheme.bodyMedium?.copyWith(
                  color: context.cScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
