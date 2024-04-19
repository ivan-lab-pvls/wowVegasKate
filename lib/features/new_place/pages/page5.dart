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

class Page5 extends StatefulWidget {
  const Page5({
    super.key,
  });

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  List<Game> games = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionWithTitle(
          title: 'What games did you play in this place?',
          child: Wrap(
            spacing: 8.r,
            runSpacing: 8.r,
            children: List.generate(
              Game.values.length,
              (index) {
                final game = Game.values[index];
                final condition = games.contains(game);
                return SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 20.w - 4.r,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    child: CustomButton(
                      title: Game.values[index].title,
                      onPressed: () => setState(() {
                        if (games.contains(game)) {
                          games.remove(game);
                        } else {
                          games.add(game);
                        }
                        final cubit = context.read<NewPlaceCubit>();
                        cubit.set(cubit.state.copyWith(games: games));
                      }),
                      accent: condition,
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
