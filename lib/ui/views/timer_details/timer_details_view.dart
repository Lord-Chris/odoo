import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/_core.dart';
import '../../shared/components/_components.dart';
import '../../shared/constants/_constants.dart';
import 'widgets/details_tab.dart';
import 'widgets/timesheets_tab.dart';

class TimerDetailsView extends HookWidget {
  const TimerDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 2);
    return BaseScaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: AppColors.transparent,
            leadingWidth: 80,
            title: Text(
              'Get to know Apexer - Ivan',
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
    );
  }
}
