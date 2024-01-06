import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/_core.dart';
import '../../../shared/constants/_constants.dart';
import '../../create_timer/bloc/create_timer_bloc.dart';
import '../../create_timer/create_timer_view.dart';

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
