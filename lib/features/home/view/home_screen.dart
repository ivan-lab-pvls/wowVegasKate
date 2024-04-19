import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegas/app/router/router.dart';
import 'package:vegas/app/theme.dart';
import 'package:vegas/custom/info_column.dart';
import 'package:vegas/custom/nav_bar_button.dart';
import 'package:vegas/custom/orange_button.dart';
import 'package:vegas/custom/section.dart';
import 'package:vegas/features/home/models/place/place.dart';
import 'package:vegas/features/home/place_list_cubit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            leading: NavBarButton(
              title: 'Settings',
              onPressed: () => context.router.push(const SettingsRoute()),
              active: true,
            ),
            largeTitle: const Text('Your Places'),
          ),
          BlocBuilder<PlaceListCubit, List<Place>>(
            builder: (context, state) {
              if (state.isEmpty) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      const InfoColumn(
                        imageAsset: 'assets/map.png',
                        title: 'There are no places yet',
                        subtitle: 'Add your first place',
                      ),
                      SizedBox(height: 24.h),
                      Section(
                        children: [
                          OrangeButton(
                            title: 'Add new place',
                            onPressed: () => context.router.push(
                              const NewPlaceRoute(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return SliverList.separated(
                  itemCount: state.length + 2,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Section(
                        children: [
                          SizedBox(height: 8.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 15.w),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Add your Vegas places now!',
                                        style: CupertinoTheme.of(context)
                                            .textTheme
                                            .textStyle
                                            .copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.sp,
                                            ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        'Add your favorite places to always have them on your phone',
                                        style: CupertinoTheme.of(context)
                                            .textTheme
                                            .textStyle
                                            .copyWith(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Image.asset('assets/people.png'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.h),
                        ],
                      );
                    } else if (index == state.length + 1) {
                      return Section(
                        children: [
                          SizedBox(height: 8.h),
                          OrangeButton(
                            title: 'Add new place',
                            onPressed: () => context.router.push(
                              const NewPlaceRoute(),
                            ),
                          ),
                        ],
                      );
                    } else {
                      final place = state[index - 1];
                      return CupertinoButton(
                        onPressed: () =>
                            context.router.push(PlaceInfoRoute(place: place)),
                        padding: EdgeInsets.zero,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 12.w),
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                            color: surfaceColor,
                            borderRadius: borderRadius,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/map.png',
                                width: 42.r,
                                height: 48.r,
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      place.name!,
                                      style: CupertinoTheme.of(context)
                                          .textTheme
                                          .textStyle
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      place.address!,
                                      style: CupertinoTheme.of(context)
                                          .textTheme
                                          .textStyle
                                          .copyWith(
                                              fontWeight: FontWeight.w300,
                                              color: secondaryColor),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
