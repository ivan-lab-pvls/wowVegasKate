import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:vegas/app/router/router.dart';
import 'package:vegas/app/theme.dart';
import 'package:vegas/custom/button.dart';
import 'package:vegas/custom/orange_button.dart';
import 'package:vegas/custom/section.dart';
import 'package:vegas/features/home/models/place/place.dart';
import 'package:vegas/features/home/place_list_cubit.dart';
import 'package:vegas/features/new_place/pages/page3.dart';

@RoutePage()
class PlaceInfoScreen extends StatelessWidget {
  final Place place;
  const PlaceInfoScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            previousPageTitle: 'Back',
            largeTitle: Text(place.name!),
            border: null,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Section(
              children: [
                Row(
                  children: [
                    Expanded(child: Text(place.address!)),
                  ],
                ),
                SizedBox(height: 19.h),
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: borderRadius,
                  ),
                  child: Column(
                    children: [
                      DataWidget(
                        title: 'Description',
                        data: place.description!,
                      ),
                      SizedBox(height: 16.h),
                      DataWidget(
                        title: 'Date',
                        data: DateFormat('dd.MM.yyyy').format(place.date!),
                      ),
                      SizedBox(height: 16.h),
                      DataWidget(
                        title: 'Time spent',
                        data:
                            formatDuration(Duration(seconds: place.duration!)),
                      ),
                      SizedBox(height: 16.h),
                      DataWidget(
                        title: 'Liked',
                        data: place.feedback!.title,
                      ),
                      SizedBox(height: 16.h),
                      DataWidget(
                        title: 'Visited the place',
                        data: place.companionship!.title,
                      ),
                      SizedBox(height: 16.h),
                      DataWidget(
                        title: 'Exactly liked',
                        data: place.attractions!.fold('',
                            (previousValue, element) {
                          if (previousValue.isEmpty) {
                            return toBeginningOfSentenceCase(element.name);
                          } else {
                            return '${toBeginningOfSentenceCase(previousValue)}, ${toBeginningOfSentenceCase(element.name)}';
                          }
                        }),
                      ),
                      SizedBox(height: 16.h),
                      DataWidget(
                        title: 'Games',
                        data: place.games!.fold('', (previousValue, element) {
                          if (previousValue.isEmpty) {
                            return toBeginningOfSentenceCase(element.name);
                          } else {
                            return '${toBeginningOfSentenceCase(previousValue)}, ${toBeginningOfSentenceCase(element.name)}';
                          }
                        }),
                      ),
                      SizedBox(height: 16.h),
                      DataWidget(
                        title: 'Going to return',
                        data: place.willReturn! ? 'Yes' : 'No',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                OrangeButton(
                  title: 'Add new place',
                  onPressed: () => context.router.push(const NewPlaceRoute()),
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        title: 'Delete place',
                        onPressed: () => showCupertinoDialog(
                          useRootNavigator: false,
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: const Text('Are you sure?'),
                            actions: [
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                onPressed: () => context.router.popForced(),
                                child: const Text('No'),
                              ),
                              CupertinoDialogAction(
                                isDestructiveAction: true,
                                onPressed: () {
                                  final cubit = context.read<PlaceListCubit>();
                                  cubit.delete(cubit.state.indexOf(place));
                                  context.router
                                    ..popForced()
                                    ..popForced();
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          ),
                        ),
                        accent: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  final String title;
  final String data;
  const DataWidget({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: CupertinoTheme.of(context)
                .textTheme
                .textStyle
                .copyWith(fontWeight: FontWeight.w300, color: secondaryColor),
          ),
        ),
        Expanded(
          child: Text(
            data,
            textAlign: TextAlign.right,
            style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
