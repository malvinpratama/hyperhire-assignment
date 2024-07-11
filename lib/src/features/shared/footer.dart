import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../configs/configs.dart';
import '../../utils/utils.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: REdgeInsets.fromLTRB(16, 20, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'LOGO Inc.',
              style: TextStyleAsset.kH4.copyWith(color: ColorAssets.kOldSilver),
            ),
            12.verticalSpace,
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  LocaleKeys.aboutUs.tr(),
                  style: GoogleFonts.notoSansKr(
                    fontSize: 13.sp,
                    letterSpacing: -0.05,
                    color: ColorAssets.kOldSilver,
                  ),
                ),
                _buildFooterSeparator(),
                Text(
                  LocaleKeys.talentRecruitment.tr(),
                  style: GoogleFonts.notoSansKr(
                    fontSize: 13.sp,
                    letterSpacing: -0.05,
                    color: ColorAssets.kOldSilver,
                  ),
                ),
                _buildFooterSeparator(),
                Text(
                  LocaleKeys.technologyBlog.tr(),
                  style: GoogleFonts.notoSansKr(
                    fontSize: 13.sp,
                    letterSpacing: -0.05,
                    color: ColorAssets.kOldSilver,
                  ),
                ),
                _buildFooterSeparator(),
                Text(
                  LocaleKeys.reviewCopyright.tr(),
                  style: GoogleFonts.notoSansKr(
                    fontSize: 13.sp,
                    letterSpacing: -0.05,
                    color: ColorAssets.kOldSilver,
                  ),
                ),
              ],
            ),
            18.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.send,
                      color: ColorAssets.kChineseSilver,
                      size: 16.sp,
                    ),
                    4.horizontalSpace,
                    Text(
                      'review@logo.com',
                      style: GoogleFonts.notoSansKr(
                        fontSize: 13.sp,
                        letterSpacing: -0.05,
                        color: ColorAssets.kOldSilver,
                      ),
                    )
                  ],
                ),
                PopupMenuButton(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: ColorAssets.kOldSilver),
                    ),
                    child: Padding(
                      padding: REdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      child: Row(
                        children: [
                          Text(
                            AppLocale.getLocaleShortName(context.locale),
                            style: GoogleFonts.notoSansKr(
                              fontSize: 10.sp,
                              letterSpacing: -0.05,
                              color: ColorAssets.kOldSilver,
                            ),
                          ),
                          24.horizontalSpace,
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 16.sp,
                            color: ColorAssets.kOldSilver,
                          ),
                        ],
                      ),
                    ),
                  ),
                  onSelected: (value) {
                    context.setLocale(AppLocale.getLocale(value));
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: 'INDONESIA',
                      child: Text(
                        'INDONESIA',
                        style: GoogleFonts.notoSansKr(
                          fontSize: 10.sp,
                          letterSpacing: -0.05,
                          color: ColorAssets.kOldSilver,
                        ),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'ENGLISH',
                      child: Text(
                        'ENGLISH',
                        style: GoogleFonts.notoSansKr(
                          fontSize: 10.sp,
                          letterSpacing: -0.05,
                          color: ColorAssets.kOldSilver,
                        ),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'KOREA',
                      child: Text(
                        'KOREA',
                        style: GoogleFonts.notoSansKr(
                          fontSize: 10.sp,
                          letterSpacing: -0.05,
                          color: ColorAssets.kOldSilver,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            16.verticalSpace,
            const Divider(
              color: ColorAssets.kChineseSilver,
            ),
            14.verticalSpace,
            Text(
              '@2022-2022 LOGO Lab, Inc. (주)아무개  서울시 강남구',
              style: GoogleFonts.notoSansKr(
                fontSize: 10.sp,
                letterSpacing: -0.02,
                color: ColorAssets.kOldSilver,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFooterSeparator() {
    return SizedBox(
      height: 9.h,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 10),
        child: const VerticalDivider(
          color: ColorAssets.kChineseSilver,
        ),
      ),
    );
  }
}
