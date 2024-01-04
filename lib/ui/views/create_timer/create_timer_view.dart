import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/extensions/context_extenstion.dart';
import '../../shared/components/_components.dart';
import '../../shared/constants/app_colors.dart';
import '../../shared/constants/spacing.dart';

class CreateTimerView extends StatelessWidget {
  const CreateTimerView({super.key});

  @override
  Widget build(BuildContext context) {
    String val = '';
    return BaseScaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: AppColors.transparent,
            leadingWidth: 80,
            title: Text(
              'Create Timer',
              style: context.tTheme.headlineSmall?.copyWith(
                color: context.cScheme.onSurface,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: REdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        AppDropdownField<String>(
                          items: const ['', 'a'],
                          value: null,
                          label: 'Project',
                          onChanged: (p0) {},
                        ),
                        Spacing.vertRegular(),
                        AppDropdownField<String>(
                          items: const ['', 's'],
                          value: val,
                          label: 'Task',
                          hint: 'Task',
                          onChanged: (p0) {
                            val = p0!;
                          },
                        ),
                        Spacing.vertRegular(),
                        const AppTextField(
                          label: 'Description',
                        ),
                        Spacing.vertRegular(),
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                            Spacing.horizSmall(),
                            Text(
                              'Make Favorite',
                              style: context.tTheme.bodyLarge?.copyWith(
                                color: context.cScheme.onSurface,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const AppButton(label: 'Create Timer'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
