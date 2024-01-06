import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/extensions/context_extenstion.dart';
import '../../shared/components/_components.dart';
import '../../shared/constants/_constants.dart';
import '../home/home_view.dart';

class SplashView extends HookWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeView())),
      );
      return () {};
    }, []);
    return BaseScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImgAssets.odooLogo, scale: 2),
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
