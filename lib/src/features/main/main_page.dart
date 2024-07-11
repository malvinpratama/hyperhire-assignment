import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:template/src/features/pages.dart';
import '../../utils/utils.dart';
import 'bloc/main_bloc.dart';

class MainPage extends StatelessWidget {
  static const String route = '/main';
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc(),
      child: Scaffold(
        backgroundColor: ColorAssets.kBrightGray,
        appBar: AppBar(
          elevation: 12,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.black.withOpacity(0.15),
          leading: Padding(
            padding: REdgeInsets.all(16),
            child: FlutterLogo(
              size: 42.sp,
            ),
          ),
        ),
        body: const HomePage(),
        bottomNavigationBar: buildBottomAppBar(context),
      ),
    );
  }

  BottomAppBar buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.zero,
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          final bloc = context.read<MainBloc>();
          return Container(
            height: 64.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10.7,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 28),
              child: Padding(
                padding: REdgeInsets.fromLTRB(0, 6, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          bloc.changeIndex(0);
                        },
                        child: SizedBox(
                          width: 70.w,
                          child: Padding(
                            padding: REdgeInsets.symmetric(vertical: 2),
                            child: Column(
                              children: [
                                ImageIcon(
                                  const AssetImage(IconAssets.kHome),
                                  size: 22.sp,
                                  color: ColorAssets.kSlateGray,
                                ),
                                2.verticalSpace,
                                Text(
                                  LocaleKeys.home.tr(),
                                  style: GoogleFonts.notoSansKr(
                                    fontSize: 10.sp,
                                    letterSpacing: -0.05,
                                    color: ColorAssets.kEerieBlack,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          bloc.changeIndex(1);
                        },
                        child: SizedBox(
                          width: 70.w,
                          child: Padding(
                            padding: REdgeInsets.symmetric(vertical: 2),
                            child: Column(
                              children: [
                                ImageIcon(
                                  const AssetImage(IconAssets.kCategory),
                                  size: 22.sp,
                                  color: ColorAssets.kLightSilver,
                                ),
                                2.verticalSpace,
                                Text(
                                  LocaleKeys.category.tr(),
                                  style: GoogleFonts.notoSansKr(
                                    fontSize: 10.sp,
                                    letterSpacing: -0.05,
                                    color: ColorAssets.kLightSilver,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          bloc.changeIndex(2);
                        },
                        child: SizedBox(
                          width: 70.w,
                          child: Padding(
                            padding: REdgeInsets.symmetric(vertical: 2),
                            child: Column(
                              children: [
                                ImageIcon(
                                  const AssetImage(IconAssets.kCommunity),
                                  size: 22.sp,
                                  color: ColorAssets.kLightSilver,
                                ),
                                2.verticalSpace,
                                Text(
                                  LocaleKeys.community.tr(),
                                  style: GoogleFonts.notoSansKr(
                                    fontSize: 10.sp,
                                    letterSpacing: -0.05,
                                    color: ColorAssets.kLightSilver,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          bloc.changeIndex(3);
                        },
                        child: SizedBox(
                          width: 70.w,
                          child: Padding(
                            padding: REdgeInsets.symmetric(vertical: 2),
                            child: Column(
                              children: [
                                ImageIcon(
                                  const AssetImage(IconAssets.kProfile),
                                  size: 22.sp,
                                  color: ColorAssets.kLightSilver,
                                ),
                                2.verticalSpace,
                                Text(
                                  LocaleKeys.myPage.tr(),
                                  style: GoogleFonts.notoSansKr(
                                    fontSize: 10.sp,
                                    letterSpacing: -0.05,
                                    color: ColorAssets.kLightSilver,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
