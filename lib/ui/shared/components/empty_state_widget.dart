import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/_core.dart';
import '../constants/_constants.dart';

class EmptyStateWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const EmptyStateWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(imagePath),
        Spacing.vertExtraMedium(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.tTheme.headlineMedium?.copyWith(
            color: context.cScheme.onSurface,
          ),
        ),
        Spacing.vertSmall(),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: context.tTheme.bodyLarge?.copyWith(
            color: context.cScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
