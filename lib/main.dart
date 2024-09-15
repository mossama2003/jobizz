import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobizz/core/style/app_theme.dart';
import 'package:jobizz/features/verification/presentation/screens/verify_screen.dart';

import 'core/shared/controllers/theme/theme_cubit.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        title: 'Jobizz App',
        home: const VerifyScreen(),
      ),
    );
  }
}