import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'ui/shared/constants/_constants.dart';
import 'ui/views/home/bloc/home_bloc.dart';
import 'ui/views/home/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, _) {
        return BlocProvider(
          create: (_) => HomeBloc(),
          child: MaterialApp(
            title: AppConstants.appName,
            theme: AppTheme.lightTheme,
            home: const HomeView(),
            builder: (context, child) {
              BlocProvider.of<HomeBloc>(context);
              return child!;
            },
          ),
        );
      },
    );
  }
}
