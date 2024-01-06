import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/_core.dart';
import '../../../shared/components/_components.dart';
import '../../../shared/constants/_constants.dart';
import '../../timer_details/bloc/timer_details_bloc.dart';
import '../../timer_details/timer_details_view.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class TimeSheetWidget extends StatelessWidget {
  final int index;
  const TimeSheetWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timer = context.watch<HomeBloc>().state.timers[index];
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => TimerDetailsBloc(timer),
            child: const TimerDetailsView(),
          ),
        ),
      ),
      child: Container(
        width: 361.w,
        height: 112.h,
        margin: REdgeInsets.only(bottom: 8),
        padding: REdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.cScheme.onSurface.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 2,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.yellow,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Spacing.horizSmall(),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetail(
                    context,
                    AppSvgAssets.starFilled,
                    timer.project,
                    true,
                  ),
                  Spacing.vertTiny(),
                  _buildDetail(
                    context,
                    AppSvgAssets.bag,
                    timer.project,
                    false,
                  ),
                  Spacing.vertTiny(),
                  _buildDetail(
                    context,
                    AppSvgAssets.clock,
                    'Deadline ${DateFormat('MM/dd/yyyy').format(timer.deadline)}',
                    false,
                  ),
                ],
              ),
            ),
            Spacing.horizSmall(),
            TimeButton(index: index),
          ],
        ),
      ),
    );
  }

  Row _buildDetail(
      BuildContext context, String icon, String label, bool isBold) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(icon),
        Spacing.horizSmall(),
        Expanded(
          child: Text(
            label,
            style: (isBold
                    ? context.tTheme.titleMedium
                    : context.tTheme.bodyMedium)
                ?.copyWith(
              color: context.cScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }
}

class TimeButton extends HookWidget {
  final int index;

  const TimeButton({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final timesheet = context.watch<HomeBloc>().state.timers[index];

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        context.read<HomeBloc>().add(UpdateTimeEvent(index, Duration.zero));
      });
      return () => timer.cancel();
    }, [...timesheet.props]);
    return AppButton(
      label: timesheet.time.parsed,
      isCollapsed: true,
      borderRadius: 64,
      buttonColor: context.cScheme.primaryContainer
          .withOpacity(timesheet.isPaused ? 0.16 : 1),
      labelColor: timesheet.isPaused
          ? context.cScheme.primaryContainer
          : context.cScheme.onPrimaryContainer,
      suffixWidget: SvgPicture.asset(
        timesheet.isPaused ? AppSvgAssets.play : AppSvgAssets.pause,
        colorFilter: ColorFilter.mode(
          timesheet.isPaused
              ? context.cScheme.primaryContainer
              : context.cScheme.onPrimary,
          BlendMode.srcIn,
        ),
      ),
      onTap: () {
        if (timesheet.isPaused) {
          context.read<HomeBloc>().add(StartTimerEvent(timesheet));
        } else {
          context
              .read<HomeBloc>()
              .add(EndTimerEvent(timesheet, timesheet.time));
        }
      },
    );
  }
}
