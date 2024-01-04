import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/_core.dart';
import '../../../shared/constants/_constants.dart';

class DetailsTab extends StatelessWidget {
  const DetailsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                    'Apexive: Content Planning',
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
                    '10/11/2023',
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
                    'Ivan Zhuikov',
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
                'Sync with Client, communicate, work on the new design with designer, new tasks preparation call with the front end',
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
