import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/src/features/main/main_page.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../../services/services.dart';
import 'bloc/intro_bloc.dart';

class IntroPage extends StatelessWidget {
  static const String route = '/intro';
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SettingsRepository(context.read<DatabaseService>()),
      child: BlocProvider<IntroBloc>(
        create: (context) => IntroBloc(context.read<SettingsRepository>()),
        child: BlocListener<IntroBloc, IntroState>(
          listener: (context, state) {
            if (state.viewStatus == ViewStatusModel.success) {
              context.pushReplacementNamed(MainPage.route);
            }
          },
          child: Scaffold(
            body: SafeArea(
              child: BlocBuilder<IntroBloc, IntroState>(
                builder: (context, state) {
                  final bloc = context.read<IntroBloc>();
                  final introModel = state.introModelList[state.index];
                  return Padding(
                    padding: REdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: bloc.controller,
                            children: state.introModelList.map(
                              (e) {
                                return _buildPage(introModel);
                              },
                            ).toList(),
                          ),
                        ),
                        Column(
                          children: [
                            32.verticalSpace,
                            _buildIndicator(state),
                            62.verticalSpace,
                            _buildButton(bloc, state),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildIndicator(IntroState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Iterable.generate(state.introModelList.length, (index) {
        return Padding(
          padding: REdgeInsets.symmetric(horizontal: 6),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == state.index
                  ? const Color(0xFFFF7622)
                  : const Color(0xFFFFE1CE),
            ),
            width: 10.r,
            height: 10.r,
          ),
        );
      }).toList(),
    );
  }

  Column _buildButton(IntroBloc bloc, IntroState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            if (state.index < state.introModelList.length - 1) {
              bloc.next();
            } else {
              bloc.finish();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFF7622),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: REdgeInsets.symmetric(vertical: 22),
              child: Center(
                child: Text(
                  state.index != state.introModelList.length - 1
                      ? 'Next'
                      : 'Get Started',
                  style: GoogleFonts.sen(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        16.verticalSpace,
        if (state.index != state.introModelList.length - 1)
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                bloc.skip();
              },
              child: Text(
                'Skip',
                style: GoogleFonts.sen(
                  fontSize: 16.sp,
                  color: const Color(0xFF646982),
                ),
              ),
            ),
          ),
        22.verticalSpace,
      ],
    );
  }

  Widget _buildPage(IntroModel introModel) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          48.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 12),
            child: Image.asset(
              introModel.image,
              height: 292.h,
            ),
          ),
          48.verticalSpace,
          Text(
            introModel.title,
            style: GoogleFonts.sen(
              fontSize: 24.sp,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.center,
          ),
          18.verticalSpace,
          Text(
            introModel.description,
            style: GoogleFonts.sen(
              fontSize: 16.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
