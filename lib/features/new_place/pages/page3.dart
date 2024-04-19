import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:vegas/app/theme.dart';
import 'package:vegas/custom/button.dart';
import 'package:vegas/custom/section_with_title.dart';
import 'package:vegas/custom/textfield.dart';
import 'package:vegas/features/home/models/enum/companionship/companionship.dart';
import 'package:vegas/features/home/models/enum/feedback/feedback.dart';
import 'package:vegas/features/new_place/new_place_cubit.dart';

class Page3 extends StatefulWidget {
  const Page3({
    super.key,
  });

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  Duration duration = Duration.zero;
  int companionship = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionWithTitle(
          title: 'How long did you spend in this place?',
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => TimeModalBottomSheet(
                onDurationChanged: (newDuration) {
                  setState(() {
                    duration = newDuration;
                  });
                },
              ),
            ).whenComplete(() {
              final cubit = context.read<NewPlaceCubit>();
              cubit.set(cubit.state.copyWith(duration: duration.inSeconds));
            }),
            child: Container(
              height: 54.h,
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: borderRadius,
                border: duration != Duration.zero
                    ? Border.all(color: primaryColor, width: 1)
                    : Border.all(color: surfaceColor, width: 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 18.w),
                      child: Text(
                        duration != Duration.zero
                            ? formatDuration(duration)
                            : 'Time',
                        style: duration != Duration.zero
                            ? CupertinoTheme.of(context).textTheme.textStyle
                            : CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(
                                  color: const Color.fromRGBO(70, 70, 73, 1),
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        SectionWithTitle(
          title: 'Were you alone or with company?',
          child: Wrap(
            spacing: 8.r,
            runSpacing: 8.r,
            children: List.generate(
              Companionship.values.length,
              (index) => SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20.w - 4.r,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  child: CustomButton(
                    title: Companionship.values[index].title,
                    onPressed: () => setState(() {
                      companionship = index;
                      final cubit = context.read<NewPlaceCubit>();
                      cubit.set(cubit.state.copyWith(
                          companionship: Companionship.values[index]));
                    }),
                    accent: companionship == index,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TimeModalBottomSheet extends StatelessWidget {
  final Function(Duration) onDurationChanged;

  const TimeModalBottomSheet({
    super.key,
    required this.onDurationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
      ),
      child: CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.hm,
        onTimerDurationChanged: (newDuration) {
          onDurationChanged(newDuration);
        },
      ),
    );
  }
}

String formatDuration(Duration duration) {
  int hours = duration.inHours;
  int minutes = duration.inMinutes.remainder(60);

  String hoursString = hours.toString().padLeft(2, '0');
  String minutesString = minutes.toString().padLeft(2, '0');

  return '$hoursString:$minutesString';
}
