import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/_core.dart';
import '../../shared/components/_components.dart';
import '../../shared/constants/_constants.dart';

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
              const Expanded(
                child: EmptyStateWidget(
                  imagePath: AppSvgAssets.odooLogo,
                  title: 'You don’t have any odoo timesheets',
                  subtitle: 'Synchronize with odoo to get started',
                ),
              ),
              AppButton(
                label: 'Get Started',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
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
          onPressed: () {},
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
