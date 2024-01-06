import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/_core.dart';
import '../../../../models/time_sheet_model.dart';
import '../../../shared/constants/_constants.dart';
import '../../home/bloc/home_bloc.dart';
import '../bloc/timer_details_bloc.dart';
import '../bloc/timer_details_event.dart';
import '../bloc/timer_details_state.dart';

class TimeSheetsTab extends StatelessWidget {
  const TimeSheetsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeState = context.read<HomeBloc>().state;
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
          itemCount: min(homeState.timerCount, 3),
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) => Spacing.vertSmall(),
          itemBuilder: (context, index) {
            final timer = homeState.timers[index];
            return CompletedRecord(timeSheet: timer);
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
    final state = context.watch<TimerDetailsBloc>().state;
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
          DeadlineInfo(deadline: state.timeSheet.deadline),
          Spacing.vertSmall(),
          _buildTimerSection(state, context),
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
            state.timeSheet.description,
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

  Row _buildTimerSection(TimerDetailsState state, BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            state.timeSheet.time.parsedWithHr,
            style: context.tTheme.displaySmall?.copyWith(
              color: context.cScheme.onSurface,
            ),
          ),
        ),
        IconButton.filled(
          onPressed: () => context.read<TimerDetailsBloc>().add(StopTapEvent()),
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
          onPressed: () =>
              context.read<TimerDetailsBloc>().add(PausePlayTapEvent()),
          iconSize: 48.r,
          padding: REdgeInsets.all(15),
          style: IconButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: context.cScheme.onSecondaryContainer,
          ),
          icon: SvgPicture.asset(
            state.timeSheet.isPaused ? AppSvgAssets.play : AppSvgAssets.pause,
            colorFilter: ColorFilter.mode(
              context.cScheme.surface,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}

class CompletedRecord extends StatelessWidget {
  final TimeSheetModel timeSheet;
  const CompletedRecord({
    Key? key,
    required this.timeSheet,
  }) : super(key: key);

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
          Expanded(child: DeadlineInfo(deadline: timeSheet.deadline)),
          Spacing.horizSmall(),
          Container(
            padding: REdgeInsets.fromLTRB(12, 6, 12, 6),
            decoration: BoxDecoration(
              color: context.cScheme.secondaryContainer.withOpacity(.16),
              borderRadius: BorderRadius.circular(64),
            ),
            child: Text(
              timeSheet.time.parsed,
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

class DeadlineInfo extends StatelessWidget {
  const DeadlineInfo({
    super.key,
    required this.deadline,
  });

  final DateTime deadline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          DateFormat('EEEE').format(deadline),
          style: context.tTheme.bodySmall?.copyWith(
            color: context.cScheme.onSurface,
          ),
        ),
        Spacing.vertTiny(),
        Text(
          DateFormat('dd.MM.yyyy').format(deadline),
          style: context.tTheme.titleMedium?.copyWith(
            color: context.cScheme.onSurface,
          ),
        ),
        Spacing.vertTiny(),
        Text(
          'Start Time ${DateFormat('hh:mm').format(deadline)}',
          style: context.tTheme.bodySmall?.copyWith(
            color: context.cScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
