import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/models.dart';
import '../../utils/utils.dart';
import 'bloc/user_bloc.dart';

class UserPage extends StatelessWidget {
  static const String route = '/user';
  const UserPage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(user),
      child: Scaffold(
        appBar: AppBar(
          elevation: 12,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.black.withOpacity(0.15),
          centerTitle: true,
          title: user.rank != 1
              ? null
              : Column(
                  children: [
                    Text(
                      LocaleKeys.ranking1stPlace.tr(),
                      style: GoogleFonts.notoSansKr(
                        fontSize: 10.sp,
                        color: ColorAssets.kOldSilver,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      LocaleKeys.bestReviewer.tr(),
                      style: GoogleFonts.notoSansKr(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorAssets.kEerieBlack,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildUserCard(),
              14.verticalSpace,
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          REdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                LocaleKeys.writtenReview.tr(),
                                style: TextStyleAsset.kH3,
                              ),
                              4.horizontalSpace,
                              Text(
                                LocaleKeys.total.tr(
                                  args: [user.totalReview.toString()],
                                ),
                                style: GoogleFonts.notoSansKr(
                                  fontSize: 12.sp,
                                  letterSpacing: -0.02,
                                  color: ColorAssets.kGraniteGray,
                                ),
                              ),
                            ],
                          ),
                          PopupMenuButton(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.r),
                                border:
                                    Border.all(color: ColorAssets.kOldSilver),
                              ),
                              child: Padding(
                                padding: REdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      LocaleKeys.latest.tr(),
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
                            onSelected: (value) {},
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'latest',
                                child: Text(
                                  LocaleKeys.latest.tr(),
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
                    ),
                    const Divider(
                      color: ColorAssets.kAntiFlashWhite,
                    ),
                    _buildCommentList(),
                  ],
                ),
              ),
              14.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<UserBloc, UserState> _buildCommentList() {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return ListView.separated(
          shrinkWrap: true,
          itemCount: state.comments.length,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => 20.horizontalSpace,
          itemBuilder: (context, index) {
            final comment = state.comments[index];
            return _buildCommentCard(comment);
          },
        );
      },
    );
  }

  Column _buildCommentCard(Comment comment) {
    return Column(
      children: [
        Padding(
          padding: REdgeInsets.fromLTRB(16, 20, 16, 8),
          child: Row(
            children: [
              Container(
                width: 104.r,
                height: 104.r,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorAssets.kAmericanSilver,
                  ),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Center(child: Image.asset(ImageAssets.kRyzen)),
              ),
              14.horizontalSpace,
              Flexible(
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: comment.product,
                            style: TextStyleAsset.kH4Bold,
                          ),
                          TextSpan(
                            text: comment.model,
                            style: TextStyleAsset.kH4,
                          ),
                        ],
                      ),
                    ),
                    2.5.verticalSpace,
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) {
                              return Icon(
                                Icons.star,
                                color: index < comment.rating - 1
                                    ? ColorAssets.kSunglow
                                    : ColorAssets.kAntiFlashWhite,
                              );
                            },
                          ),
                        ),
                        8.horizontalSpace,
                        Text(
                          comment.rating.toStringAsPrecision(3),
                          style: TextStyleAsset.kH2,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const Divider(
          color: ColorAssets.kAntiFlashWhite,
        ),
        14.verticalSpace,
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 34.r,
                    height: 34.r,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(user.avatar),
                    ),
                  ),
                  6.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: REdgeInsets.only(left: 2),
                        child: Text(
                          user.name,
                          style: TextStyleAsset.kH4,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              5,
                              (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < comment.rating - 1
                                      ? ColorAssets.kSunglow
                                      : ColorAssets.kAntiFlashWhite,
                                );
                              },
                            ),
                          ),
                          2.horizontalSpace,
                          Text(
                            DateFormat('yyyy.MM.dd').format(comment.createdAt),
                            style: GoogleFonts.notoSansKr(
                              fontSize: 10.sp,
                              color: ColorAssets.kOldSilver,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Icon(
                Icons.bookmark_border_rounded,
                color: ColorAssets.kOldSilver,
                size: 24.sp,
              )
            ],
          ),
        ),
        26.verticalSpace,
        Padding(
          padding: REdgeInsets.only(left: 16),
          child: SizedBox(
            height: 16.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: comment.tag?.length ?? 0,
              separatorBuilder: (context, index) => 20.horizontalSpace,
              itemBuilder: (context, index) {
                final tag = comment.tag![index];
                return Text(
                  tag,
                  style: GoogleFonts.notoSansKr(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.05,
                    color: ColorAssets.kQuickSilver,
                  ),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        ),
        18.verticalSpace,
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: comment.comments?.length ?? 0,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => 18.verticalSpace,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  ImageIcon(
                    const AssetImage(IconAssets.kEnergy),
                    color: index == 0
                        ? ColorAssets.kOceanBlue
                        : ColorAssets.kLightSilver,
                    size: 20.sp,
                  ),
                  10.horizontalSpace,
                  Flexible(
                    child: Text(
                      comment.comments![index],
                      style: TextStyleAsset.kBody,
                    ),
                  )
                ],
              );
            },
          ),
        ),
        18.verticalSpace,
        Padding(
          padding: REdgeInsets.only(left: 53, right: 14),
          child: SizedBox(
            height: 72.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: comment.image?.length ?? 0,
              separatorBuilder: (context, index) => 10.horizontalSpace,
              itemBuilder: (context, index) {
                final image = comment.image![index];
                return Image.asset(
                  image,
                  width: 73.w,
                  height: 70.h,
                );
              },
            ),
          ),
        ),
        15.verticalSpace,
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: const Divider(
            color: ColorAssets.kAntiFlashWhite,
          ),
        ),
        Padding(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: REdgeInsets.only(right: 4),
                child: const ImageIcon(
                  AssetImage(IconAssets.kComment),
                ),
              ),
              prefixIconColor: ColorAssets.kSilverSand,
              prefixIconConstraints: BoxConstraints(
                maxHeight: 16.r,
                minHeight: 16.r,
                maxWidth: 16.r,
                minWidth: 16.r,
              ),
              hintText: LocaleKeys.leaveComment.tr(),
              hintStyle: GoogleFonts.notoSansKr(
                fontSize: 10.sp,
                letterSpacing: -0.05,
                color: ColorAssets.kGraniteGray,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container _buildUserCard() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          24.verticalSpace,
          SizedBox(
            width: 120.r,
            height: 120.r,
            child: CircleAvatar(
              backgroundImage: AssetImage(user.avatar),
            ),
          ),
          12.verticalSpace,
          Text(
            user.name,
            style: TextStyleAsset.kH1,
          ),
          2.verticalSpace,
          if (user.rank == 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAssets.kCrown,
                  width: 19.w,
                  height: 15.h,
                ),
                2.5.horizontalSpace,
                Text(
                  LocaleKeys.gold.tr(),
                  style:
                      TextStyleAsset.kH4.copyWith(color: ColorAssets.kSunglow),
                )
              ],
            ),
          if (user.note != null)
            Column(
              children: [
                18.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: ColorAssets.kAntiFlashWhite,
                  ),
                  child: Padding(
                    padding: REdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      user.note ?? '',
                      style: TextStyleAsset.kH4
                          .copyWith(color: ColorAssets.kOldSilver),
                    ),
                  ),
                ),
              ],
            ),
          28.verticalSpace,
        ],
      ),
    );
  }
}
