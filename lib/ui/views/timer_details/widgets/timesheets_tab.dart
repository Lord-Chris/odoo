import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/_core.dart';
import '../../../shared/constants/_constants.dart';

class TimeSheetsTab extends StatelessWidget {
  const TimeSheetsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: REdgeInsets.all(16),
      children: [
        const CurrentRecord(),
        Spacing.vertRegular(),
        Text(
          'Completed Records',
          style: context.tTheme.bodySmall?.copyWith(
            color: context.cScheme.onSurface,
          ),
        ),
        Spacing.vertSmall(),
        ListView.separated(
          shrinkWrap: true,
          itemCount: 3,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) => Spacing.vertSmall(),
          itemBuilder: (context, index) {
            return const CompletedRecord();
          },
        ),
      ],
    );
  }
}

class CurrentRecord extends StatelessWidget {
  const CurrentRecord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.cScheme.onSurface.withOpacity(.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Monday',
            style: context.tTheme.bodySmall?.copyWith(
              color: context.cScheme.onSurface,
            ),
          ),
          Spacing.vertTiny(),
          Text(
            '17.07.2023',
            style: context.tTheme.titleMedium?.copyWith(
              color: context.cScheme.onSurface,
            ),
          ),
          Spacing.vertTiny(),
          Text(
            'Start Time 10:00',
            style: context.tTheme.bodySmall?.copyWith(
              color: context.cScheme.onSurface,
            ),
          ),
          Spacing.vertSmall(),
          Row(
            children: [
              Expanded(
                child: Text(
                  '08:08:20',
                  style: context.tTheme.displaySmall?.copyWith(
                    color: context.cScheme.onSurface,
                  ),
                ),
              ),
              IconButton.filled(
                onPressed: () {},
                iconSize: 60.r,
                padding: REdgeInsets.all(15),
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor:
                      context.cScheme.onSecondaryContainer.withOpacity(.16),
                ),
                icon: SvgPicture.asset(AppSvgAssets.stop),
              ),
              Spacing.horizSmall(),
              IconButton.filled(
                onPressed: () {},
                iconSize: 48.r,
                padding: REdgeInsets.all(15),
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: context.cScheme.onSecondaryContainer,
                ),
                icon: SvgPicture.asset(AppSvgAssets.pause),
              ),
            ],
          ),
          Spacing.vertSmall(),
          const Divider(),
          Spacing.vertSmall(),
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
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(AppSvgAssets.pencil),
              ),
            ],
          ),
          Spacing.vertTiny(),
          ReadMoreText(
            'Sync with Client, communicate, work on the new design with designer, new tasks preparation call with the front end',
            trimLines: 2,
            style: context.tTheme.bodyMedium?.copyWith(
              color: context.cScheme.onSurface,
            ),
            moreStyle: context.tTheme.bodySmall?.copyWith(
              color: context.cScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class CompletedRecord extends StatelessWidget {
  const CompletedRecord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.cScheme.onSurface.withOpacity(.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AppSvgAssets.check),
          Spacing.horizSmall(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Monday',
                  style: context.tTheme.bodySmall?.copyWith(
                    color: context.cScheme.onSurface,
                  ),
                ),
                Text(
                  '17.07.2023',
                  style: context.tTheme.titleMedium?.copyWith(
                    color: context.cScheme.onSurface,
                  ),
                ),
                Text(
                  'Start Time 10:00',
                  style: context.tTheme.bodySmall?.copyWith(
                    color: context.cScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
          Spacing.horizSmall(),
          Container(
            padding: REdgeInsets.fromLTRB(12, 6, 12, 6),
            decoration: BoxDecoration(
              color: context.cScheme.secondaryContainer.withOpacity(.16),
              borderRadius: BorderRadius.circular(64),
            ),
            child: Text(
              '08:00',
              style: context.tTheme.bodySmall?.copyWith(
                color: context.cScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
