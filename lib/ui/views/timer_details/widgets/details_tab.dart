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
              DetailItem(
                title: 'Project',
                body: state.timeSheet.project,
                hasLine: true,
              ),
              Spacing.vertRegular(),
              DetailItem(
                title: 'Deadline',
                body: DateFormat('dd/MM/yyyy').format(state.timeSheet.deadline),
              ),
              Spacing.vertRegular(),
              DetailItem(title: 'Assigned to', body: state.timeSheet.assignee),
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

class DetailItem extends StatelessWidget {
  final String title;
  final String body;
  final bool hasLine;
  const DetailItem({
    Key? key,
    required this.title,
    required this.body,
    this.hasLine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: context.tTheme.bodySmall?.copyWith(
            color: context.cScheme.onSurface,
          ),
        ),
        Spacing.vertTiny(),
        Row(
          children: [
            if (hasLine) ...[
              Container(
                width: 2,
                height: 24.r,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Spacing.horizSmall(),
            ],
            Text(
              body,
              style: context.tTheme.titleMedium?.copyWith(
                color: context.cScheme.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
