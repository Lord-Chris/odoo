import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/_core.dart';
import '../../shared/components/_components.dart';
import '../../shared/constants/_constants.dart';
import '../home/bloc/home_bloc.dart';
import '../home/bloc/home_event.dart';
import 'bloc/timer_details_bloc.dart';
import 'bloc/timer_details_state.dart';
import 'widgets/details_tab.dart';
import 'widgets/timesheets_tab.dart';

class TimerDetailsView extends HookWidget {
  const TimerDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<TimerDetailsBloc>();
    final state = bloc.state;
    final controller = useTabController(initialLength: 2);
    return BaseScaffold(
      body: BlocListener<TimerDetailsBloc, TimerDetailsState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error!.message,
                  style: context.tTheme.bodyMedium,
                ),
              ),
            );
          }
        },
        child: PopScope(
          canPop: true,
          onPopInvoked: (__) {
            context.read<HomeBloc>().add(UpdateTimeSheetEvent(state.timeSheet));
          },
          child: Column(
            children: [
              AppBar(
                backgroundColor: AppColors.transparent,
                leadingWidth: 80,
                title: Text(
                  state.timeSheet.project,
                  style: context.tTheme.titleMedium?.copyWith(
                    color: context.cScheme.onSurface,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(AppSvgAssets.pencil),
                  ),
                ],
              ),
              TabBar(
                controller: controller,
                dividerHeight: 2,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: REdgeInsets.symmetric(horizontal: .12.sw),
                labelStyle: context.tTheme.labelLarge?.copyWith(
                  color: context.cScheme.onSurface,
                ),
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: context.cScheme.onSecondary,
                    ),
                  ),
                ),
                tabs: const [
                  Tab(text: 'Timesheets'),
                  Tab(text: 'Details'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: const [
                    TimeSheetsTab(),
                    DetailsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
