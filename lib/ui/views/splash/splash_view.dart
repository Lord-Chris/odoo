import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/extensions/context_extenstion.dart';
import '../../shared/components/_components.dart';
import '../../shared/constants/_constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppSvgAssets.odooLogo),
          Spacing.vertExtraMedium(),
          Text(
            'Odoo',
            textAlign: TextAlign.center,
            style: context.tTheme.headlineLarge?.copyWith(
              color: context.cScheme.onSurface,
            ),
          ),
          Spacing.vertSmall(),
          Text(
            'Time management without obstacles',
            textAlign: TextAlign.center,
            style: context.tTheme.bodyLarge?.copyWith(
              color: context.cScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
