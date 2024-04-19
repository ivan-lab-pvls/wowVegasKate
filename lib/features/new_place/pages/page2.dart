import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:vegas/app/theme.dart';
import 'package:vegas/custom/button.dart';
import 'package:vegas/custom/section_with_title.dart';
import 'package:vegas/custom/textfield.dart';
import 'package:vegas/features/home/models/enum/feedback/feedback.dart';
import 'package:vegas/features/new_place/new_place_cubit.dart';

class Page2 extends StatefulWidget {
  const Page2({
    super.key,
  });

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  late TextEditingController addressController;
  String date = '';
  int feedback = -1;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController();
  }

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionWithTitle(
          title: 'Address of place',
          child: CustomTextfield(
            placeholder: 'Address',
            controller: addressController,
            onChanged: () {
              final cubit = context.read<NewPlaceCubit>();
              cubit.set(cubit.state.copyWith(address: addressController.text));
            },
          ),
        ),
        SizedBox(height: 24.h),
        SectionWithTitle(
          title: 'When did you visit this place?',
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) => DateModalBottomSheet(
                onDateChanged: (newDate) {
                  setState(() {
                    date = newDate;
                  });
                },
              ),
            ).whenComplete(() {
              final cubit = context.read<NewPlaceCubit>();
              cubit.set(cubit.state.copyWith(date: DateTime.parse(date)));
            }),
            child: Container(
              height: 54.h,
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: borderRadius,
                border: date.isNotEmpty
                    ? Border.all(color: primaryColor, width: 1)
                    : Border.all(color: surfaceColor, width: 1),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 18.w),
                      child: Text(
                        date.isNotEmpty
                            ? DateFormat('dd.MM.yyyy')
                                .format(DateTime.parse(date))
                            : 'Date',
                        style: date.isNotEmpty
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
          title: 'Did you like this place?',
          child: Wrap(
            spacing: 8.r,
            runSpacing: 8.r,
            children: List.generate(
              FeedBack.values.length,
              (index) => SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 20.w - 4.r,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  child: CustomButton(
                    title: FeedBack.values[index].title,
                    onPressed: () => setState(() {
                      feedback = index;
                      final cubit = context.read<NewPlaceCubit>();
                      cubit.set(cubit.state
                          .copyWith(feedback: FeedBack.values[index]));
                    }),
                    accent: feedback == index,
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

class DateModalBottomSheet extends StatelessWidget {
  final Function(String) onDateChanged;

  const DateModalBottomSheet({
    super.key,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
      ),
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: (newDate) {
          onDateChanged(newDate.toIso8601String());
        },
      ),
    );
  }
}
