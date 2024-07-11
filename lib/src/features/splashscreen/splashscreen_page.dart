import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../../services/services.dart';
import 'bloc/splashscreen_bloc.dart';

class SplashscreenPage extends StatelessWidget {
  static const String route = '/';
  const SplashscreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) =>
              SettingsRepository(context.read<DatabaseService>()),
        ),
      ],
      child: BlocProvider(
        create: (context) => SplashscreenBloc(
          context.read<SettingsRepository>(),
        ),
        child: BlocListener<SplashscreenBloc, SplashscreenState>(
          listener: (context, state) {
            if (state.viewStatus == ViewStatusModel.success) {
              context.pushReplacementNamed(state.nextRoute!);
            }
          },
          child: Scaffold(
            body: Center(
              child: FlutterLogo(
                size: 128.r,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
