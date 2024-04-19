import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegas/app/router/router.dart';
import 'package:vegas/app/theme.dart';
import 'package:vegas/custom/nav_bar_button.dart';
import 'package:vegas/custom/section.dart';
import 'package:vegas/custom/section_with_title.dart';
import 'package:vegas/custom/textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegas/features/home/models/place/place.dart';
import 'package:vegas/features/home/place_list_cubit.dart';
import 'package:vegas/features/new_place/new_place_cubit.dart';
import 'package:vegas/features/new_place/pages/page1.dart';
import 'package:vegas/features/new_place/pages/page2.dart';
import 'package:vegas/features/new_place/pages/page3.dart';
import 'package:vegas/features/new_place/pages/page4.dart';
import 'package:vegas/features/new_place/pages/page5.dart';
import 'package:vegas/features/new_place/pages/page6.dart';

@RoutePage()
class NewPlaceScreen extends StatefulWidget implements AutoRouteWrapper {
  const NewPlaceScreen({super.key});

  @override
  State<NewPlaceScreen> createState() => _NewPlaceScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => NewPlaceCubit(),
      child: this,
    );
  }
}

class _NewPlaceScreenState extends State<NewPlaceScreen> {
  late TextEditingController nameController;
  late TextEditingController descController;
  late TextEditingController addrController;

  int page = 0;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descController = TextEditingController();
    addrController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    addrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          BlocBuilder<NewPlaceCubit, Place>(
            builder: (context, state) {
              bool condition = false;
              switch (page) {
                case 0:
                  condition = isValid(state.name) && isValid(state.description);
                  break;
                case 1:
                  condition = isValid(state.address) &&
                      state.date != null &&
                      state.feedback != null;
                  break;
                case 2:
                  condition =
                      state.duration != null && state.companionship != null;
                  break;
                case 3:
                  condition = isValid(state.attractions);
                  break;
                case 4:
                  condition = isValid(state.games);
                  break;
                case 5:
                  condition = state.willReturn != null;
                  break;
              }
              return CupertinoSliverNavigationBar(
                previousPageTitle: 'Your Places',
                largeTitle: const Text('Add New Place'),
                trailing: NavBarButton(
                  title: 'Next',
                  onPressed: () {
                    if (page != 5) {
                      setState(() {
                        ++page;
                        condition = false;
                      });
                    } else {
                      final cubit = context.read<NewPlaceCubit>();
                      final listCubit = context.read<PlaceListCubit>();
                      listCubit.create(cubit.state);
                      context.router.replace(const CongratulationsRoute());
                    }
                  },
                  active: condition,
                ),
              );
            },
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                SizedBox(height: 8.h),
                Section(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: (page + 1).toString(),
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .navActionTextStyle,
                            children: [
                              TextSpan(
                                text: '/6',
                                style: CupertinoTheme.of(context)
                                    .textTheme
                                    .navActionTextStyle
                                    .copyWith(color: secondaryColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Container(
                            height: 10.h,
                            decoration: BoxDecoration(
                              color: surfaceColor,
                              borderRadius: BorderRadius.circular(90.r),
                            ),
                            child: AnimatedFractionallySizedBox(
                              duration: const Duration(milliseconds: 250),
                              alignment: Alignment.centerLeft,
                              widthFactor: (page + 1) / 6,
                              child: Container(
                                height: 10.h,
                                decoration: BoxDecoration(
                                  color: orangeColor,
                                  borderRadius: BorderRadius.circular(90.r),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Builder(builder: (context) {
                  switch (page) {
                    case 0:
                      return const Page1();
                    case 1:
                      return const Page2();
                    case 2:
                      return const Page3();
                    case 3:
                      return const Page4();
                    case 4:
                      return const Page5();
                    case 5:
                      return const Page6();
                    default:
                      return Container();
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

bool isValid(dynamic string) => string != null && string.isNotEmpty;
