import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/_core.dart';
import '../../shared/components/_components.dart';
import '../../shared/constants/_constants.dart';
import '../create_timer/bloc/create_timer_bloc.dart';
import '../create_timer/create_timer_view.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';
import 'widgets/home_header.dart';
import 'widgets/timer_widget.dart';

class HomeView extends HookWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 1);
    return BaseScaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            children: [
              const HomeHeader(),
              TabBar(
                controller: controller,
                dividerHeight: 2,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: REdgeInsets.symmetric(horizontal: .35.sw),
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
                tabs: const [Tab(text: 'Local')],
              ),
              const Divider(height: 1),
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.timers.isEmpty) {
                      return Column(
                        children: [
                          const Expanded(
                            child: EmptyStateWidget(
                              imagePath: AppSvgAssets.noTimesheet,
                              title: 'You don’t have any odoo timesheets',
                              subtitle: 'Synchronize with odoo to get started',
                            ),
                          ),
                          AppButton(
                            label: 'Get Started',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider(
                                    create: (_) => CreateTimerBloc(),
                                    child: const CreateTimerView(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacing.vertSmall(),
                        Text(
                          'You have ${state.timerCount} Timer${state.timerCount == 1 ? '' : 's'}',
                          style: context.tTheme.labelLarge?.copyWith(
                            color: context.cScheme.onSurface,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: REdgeInsets.symmetric(vertical: 16),
                            itemCount: state.timers.length,
                            itemBuilder: (context, index) {
                              return TimeSheetWidget(index: index);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
