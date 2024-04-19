import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vegas/custom/section_with_title.dart';
import 'package:vegas/custom/textfield.dart';
import 'package:vegas/features/new_place/new_place_cubit.dart';

class Page1 extends StatefulWidget {
  const Page1({
    super.key,
  });

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  late TextEditingController nameController;
  late TextEditingController descController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    descController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionWithTitle(
          title: 'Place name',
          child: CustomTextfield(
            placeholder: 'Place name',
            controller: nameController,
            onChanged: () {
              final cubit = context.read<NewPlaceCubit>();
              cubit.set(cubit.state.copyWith(name: nameController.text));
            },
          ),
        ),
        SizedBox(height: 24.h),
        SectionWithTitle(
          title: 'Describe the place',
          child: CustomTextfield(
            placeholder: 'Type something',
            controller: descController,
            onChanged: () {
              final cubit = context.read<NewPlaceCubit>();
              cubit.set(cubit.state.copyWith(description: descController.text));
            },
          ),
        ),
      ],
    );
  }
}
