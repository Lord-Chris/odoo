import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/_core.dart';
import '../../shared/components/_components.dart';
import '../../shared/constants/_constants.dart';
import '../create_timer/create_timer_view.dart';

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
                indicatorPadding: REdgeInsets.symmetric(horizontal: .4.sw),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacing.vertSmall(),
                    Text(
                      'You have 16 Timers',
                      style: context.tTheme.labelLarge?.copyWith(
                        color: context.cScheme.onSurface,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: REdgeInsets.symmetric(vertical: 16),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const TimerWidget();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Column(
              //   children: [
              //     const EmptyStateWidget(
              //       imagePath: AppSvgAssets.odooLogo,
              //       title: 'You don’t have any odoo timesheets',
              //       subtitle: 'Synchronize with odoo to get started',
              //     ),
              //     AppButton(
              //       label: 'Get Started',
              //       onTap: () {},
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  'iOS app deployment',
                  true,
                ),
                Spacing.vertTiny(),
                _buildDetail(
                  context,
                  AppSvgAssets.bag,
                  'SO056 - Booqio V2',
                  false,
                ),
                Spacing.vertTiny(),
                _buildDetail(
                  context,
                  AppSvgAssets.clock,
                  'Deadline 07/20/2023',
                  false,
                ),
              ],
            ),
          ),
          Spacing.horizSmall(),
          AppButton(
            label: '00:30',
            isCollapsed: true,
            borderRadius: 64,
            buttonColor: context.cScheme.primaryContainer,
            labelColor: context.cScheme.onPrimaryContainer,
            suffixWidget: SvgPicture.asset(AppSvgAssets.pause),
            onTap: () {},
          ),
        ],
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

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Timesheets',
            style: context.tTheme.headlineLarge?.copyWith(
              color: context.cScheme.onSurface,
            ),
          ),
        ),
        IconButton.filled(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const CreateTimerView()));
          },
          iconSize: 48.r,
          padding: REdgeInsets.all(3),
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor:
                context.cScheme.onSecondaryContainer.withOpacity(.16),
          ),
          icon: SvgPicture.asset(AppSvgAssets.add),
        ),
      ],
    );
  }
}
