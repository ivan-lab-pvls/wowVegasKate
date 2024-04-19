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
import 'package:vegas/features/new_place/new_place_cubit.dart';

class Page4 extends StatefulWidget {
  const Page4({
    super.key,
  });

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  List<Attraction> attractions = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionWithTitle(
          title: 'What attracted you to this place?',
          child: Wrap(
            spacing: 8.r,
            runSpacing: 8.r,
            children: List.generate(
              Attraction.values.length,
              (index) {
                final attraction = Attraction.values[index];
                final condition = attractions.contains(attraction);
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 20.w - 4.r,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    child: CupertinoButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
                      color: condition ? primaryColor : surfaceColor,
                      onPressed: () => setState(() {
                        if (attractions.contains(attraction)) {
                          attractions.remove(attraction);
                        } else {
                          attractions.add(attraction);
                        }
                        final cubit = context.read<NewPlaceCubit>();
                        cubit.set(
                            cubit.state.copyWith(attractions: attractions));
                      }),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            attraction.emoji,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight:
                                  condition ? FontWeight.w600 : FontWeight.w400,
                              fontSize: 17.sp,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            toBeginningOfSentenceCase(attraction.name),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight:
                                  condition ? FontWeight.w600 : FontWeight.w400,
                              fontSize: 17.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
