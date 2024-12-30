import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_club/core/exports.dart';

import '../../cubit/account_cubit.dart';
import '../../cubit/account_state.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (BuildContext context, state) {
        return Column(
          children: [
            buildLanguageOption(
              isSelected:  EasyLocalization.of(context)!
                                              .locale
                                              .languageCode ==
                                          'ar' ,
              title: 'اللغه العربيه',
              value: 'Arabic',
            ),
            SizedBox(height: 16),
            buildLanguageOption(
              isSelected:  EasyLocalization.of(context)!
                                              .locale
                                              .languageCode !=
                                          'ar' ,
              title: 'English',
              value: 'English',
            ),
          ],
        );
      },
    );
  }

  Widget buildLanguageOption({required String title, required String value , required bool isSelected}) {
    var cubit = context.read<AccountCubit>();
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (BuildContext context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            leading: GestureDetector(
              onTap: () {
                cubit.changeLanguage(context,
                    value); // Call your cubit's method to update language
              },
              child: Icon(
                isSelected
                    ? Icons.check_circle // Checkmark icon when selected
                    : Icons
                        .radio_button_unchecked, // Unchecked icon when not selected
                color: isSelected
                    ? AppColors.primary
                    : AppColors.grey,
                size: 24.sp,
              ),
            ),
            title: Text(
              title,
              style: getMediumStyle(fontSize: 14.sp),
            ),
            trailing:
                Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.grey),
          ),
        );
      },
    );
  }
}
