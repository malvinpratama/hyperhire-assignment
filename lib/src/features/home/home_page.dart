import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:template/src/features/pages.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';
import '../shared/shared.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: const LinearGradient(
                    colors: [
                      ColorAssets.kAquamarine,
                      ColorAssets.kVioletBlue,
                    ],
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: REdgeInsets.all(2),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: LocaleKeys.enterSearchTerm.tr(),
                      hintStyle: GoogleFonts.notoSansKr(fontSize: 12.sp),
                      suffixIcon: Icon(
                        Icons.search_sharp,
                        color: ColorAssets.kOceanBlue,
                        size: 24.sp,
                      ),
                    ),
                    style: GoogleFonts.notoSansKr(fontSize: 12.sp),
                  ),
                ),
              ),
            ),
            2.verticalSpace,
            _buildBanner(),
            _buildProductList(),
            14.verticalSpace,
            _buildUserList(),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Container _buildUserList() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.goldLevelUsers.tr(),
              style: TextStyleAsset.kComments,
            ),
            3.verticalSpace,
            Text(
              LocaleKeys.best10Reviewer.tr(),
              style: TextStyleAsset.kH2,
            ),
            14.verticalSpace,
            BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              return SizedBox(
                height: 106.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => 18.horizontalSpace,
                  itemCount: state.userList.length,
                  itemBuilder: (context, index) {
                    final user = state.userList[index];
                    return InkWell(
                      onTap: () {
                        context.pushNamed(UserPage.route, extra: user);
                      },
                      child: Stack(
                        children: [
                          if (index == 0)
                            Positioned(
                              child: Image.asset(
                                ImageAssets.kCrown,
                                width: 16.r,
                                height: 13.r,
                              ),
                            ),
                          Column(
                            children: [
                              10.verticalSpace,
                              Container(
                                height: 64.r,
                                width: 64.r,
                                decoration: index != 0
                                    ? null
                                    : const BoxDecoration(
                                        color: ColorAssets.kSunglow,
                                        shape: BoxShape.circle,
                                      ),
                                child: Padding(
                                  padding: index != 0
                                      ? EdgeInsets.zero
                                      : REdgeInsets.all(2),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(user.avatar),
                                  ),
                                ),
                              ),
                              10.verticalSpace,
                              Text(
                                user.name,
                                style: GoogleFonts.notoSansKr(
                                    fontSize: 14.sp,
                                    letterSpacing: -0.02,
                                    color: ColorAssets.kAmericanSilver),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 28),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.hottestReviews.tr(),
                      style: TextStyleAsset.kComments,
                    ),
                    Text(
                      LocaleKeys.top3Reviews.tr(),
                      style: TextStyleAsset.kH2,
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 24.sp,
                )
              ],
            ),
            14.verticalSpace,
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) {
                return previous.productList != current.productList;
              },
              builder: (context, state) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.productList.length,
                  separatorBuilder: (context, index) => 16.verticalSpace,
                  itemBuilder: (context, index) {
                    final product = state.productList[index];

                    return _buildProductCard(product, index);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  BlocBuilder<HomeBloc, HomeState> _buildBanner() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bloc = context.read<HomeBloc>();
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 221.h,
              child: InfiniteCarousel.builder(
                loop: true,
                itemCount: state.bannerList.length,
                itemExtent: 1.sw,
                onIndexChanged: (index) {
                  bloc.onChangeBannerIndex(index);
                },
                itemBuilder: (context, itemIndex, realIndex) {
                  final banner = state.bannerList[itemIndex];
                  return Image.asset(
                    banner,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 10.r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: Iterable.generate(state.bannerList.length, (index) {
                  return Padding(
                    padding: REdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: index == state.bannerIndex
                            ? BorderRadius.circular(10.r)
                            : null,
                        shape: index == state.bannerIndex
                            ? BoxShape.rectangle
                            : BoxShape.circle,
                        color: index == state.bannerIndex
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                      width: index == state.bannerIndex ? 9.r : 4.r,
                      height: 4.r,
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        );
      },
    );
  }

  Row _buildProductCard(Product product, int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 104.r,
          height: 104.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(
              color: ColorAssets.kAmericanSilver,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: REdgeInsets.fromLTRB(12, 22, 12, 0),
                child: Image.asset(product.image),
              ),
              Positioned(
                top: 6,
                left: 6,
                child: Image.asset(
                  _getCrown(index),
                  width: 19.w,
                  height: 15.h,
                ),
              )
            ],
          ),
        ),
        8.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: product.brand,
                      style: TextStyleAsset.kH4Bold,
                    ),
                    TextSpan(
                      text: product.name,
                      style: TextStyleAsset.kH4,
                    ),
                  ],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              6.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\u2022 ${product.comments[0]}',
                    style: TextStyleAsset.kComments.copyWith(
                      letterSpacing: -0.02,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\u2022 ${product.comments[1]}',
                    style: TextStyleAsset.kComments.copyWith(
                      letterSpacing: -0.02,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              6.verticalSpace,
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: ColorAssets.kSunglow,
                    size: 12.sp,
                  ),
                  4.horizontalSpace,
                  Text(
                    '${product.rating}',
                    style: GoogleFonts.notoSansKr(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorAssets.kSunglow,
                    ),
                  ),
                  2.horizontalSpace,
                  Text(
                    '(${product.totalComment})',
                    style: GoogleFonts.notoSansKr(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorAssets.kSilverSand,
                    ),
                  )
                ],
              ),
              6.verticalSpace,
              SizedBox(
                height: 24.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.tags.length,
                  separatorBuilder: (context, index) => 4.horizontalSpace,
                  itemBuilder: (context, idx) {
                    final tag = product.tags[idx];
                    return Container(
                      decoration: BoxDecoration(
                        color: ColorAssets.kAntiFlashWhite,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Padding(
                        padding:
                            REdgeInsets.symmetric(horizontal: 6, vertical: 5),
                        child: Text(
                          tag,
                          style: GoogleFonts.notoSansKr(
                            fontSize: 11.sp,
                            color: ColorAssets.kOldSilver,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  String _getCrown(int index) {
    switch (index) {
      case 0:
        return ImageAssets.kCrownGold;
      case 1:
        return ImageAssets.kCrownSilver;
      case 2:
        return ImageAssets.kCrownBronze;
      default:
        return '';
    }
  }
}
