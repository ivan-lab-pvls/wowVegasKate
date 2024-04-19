import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:vegas/app/theme.dart';
import 'package:vegas/custom/button.dart';
import 'package:vegas/custom/section_with_title.dart';
import 'package:vegas/custom/textfield.dart';
import 'package:vegas/features/home/models/enum/attraction/attraction.dart';
import 'package:vegas/features/home/models/enum/companionship/companionship.dart';
import 'package:vegas/features/home/models/enum/feedback/feedback.dart';
import 'package:vegas/features/home/models/enum/games/games.dart';
import 'package:vegas/features/new_place/new_place_cubit.dart';

class Page6 extends StatefulWidget {
  const Page6({
    super.key,
  });

  @override
  State<Page6> createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  bool? willReturn;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionWithTitle(
          title: 'Will you return to this place again',
          child: Row(
            children: [
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  child: CustomButton(
                    title: 'Yes',
                    onPressed: () {
                      setState(() => willReturn = true);
                      final cubit = context.read<NewPlaceCubit>();
                      cubit.set(cubit.state.copyWith(willReturn: willReturn));
                    },
                    accent: willReturn == null ? false : willReturn!,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  child: CustomButton(
                    title: 'No',
                    onPressed: () {
                      setState(() => willReturn = false);
                      final cubit = context.read<NewPlaceCubit>();
                      cubit.set(cubit.state.copyWith(willReturn: willReturn));
                    },
                    accent: willReturn == null ? false : !willReturn!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
