import 'package:flutter/cupertino.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import 'package:travel_club/features/food/cubit/food_cubit.dart';

import '../../../../../core/exports.dart';
import '../../../../transportation/screens/widgets/custom_from_to_date.dart';
import '../widgets/custom_conatiner_in_center.dart';

class BookTableScreen extends StatelessWidget {
  const BookTableScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
        builder: (BuildContext context, state) {
      var cubit = context.read<FoodCubit>();
      return CustomScreen(
          appbarTitle: AppTranslations.bookTable,
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "مطعم صبحي كابر روض الفرج",
                          style: getSemiBoldStyle(fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        StaggeredGrid.count(
                          crossAxisCount: 2,
                          children: List.generate(
                            2,
                            (index) => CustomMealContainer(cubit: cubit),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          AppTranslations.selectBookingDate,
                          style: getMediumStyle(fontSize: 14.sp),
                        ),
                    Container(
          decoration: BoxDecoration(
            color: AppColors.lightWhite2,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child:Padding(
                  padding: EdgeInsets.all(18.h),
                  child: DatePickerField(
                    selectedDate: cubit.singleDate,
                    isSingle: true,
                    onTap: () {
                      cubit.onSelectedDateSingle(context: context);
                    },
                  ),
                )),
                        Text(
                          AppTranslations.numberOfAttendees,
                          style: getMediumStyle(fontSize: 14.sp),
                        ),
                        CustomTextField(
                          hintText: "٤ اشخاص",
                        ),
                        Text(
                          AppTranslations.nameOwner,
                          style: getMediumStyle(fontSize: 14.sp),
                        ),
                        CustomTextField(
                          hintText: "احمد مختار علي",
                        ),
                        Text(
                          AppTranslations.numberOfPhoneContact,
                          style: getMediumStyle(fontSize: 14.sp),
                        ),
                        CustomTextField(
                          hintText: "٠١١٢٦٠٥٣٤٥٢",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomButton(
                    title: AppTranslations.bookTable,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.donePayment,
                          arguments: true);
                    }),
              ),
            ],
          ));
    });
  }
}

class CustomMealContainer extends StatelessWidget {
  const CustomMealContainer({
    super.key,
    required this.cubit,
  });

  final FoodCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: CustomContainerWithShadow(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.network(
                "https://picsum.photos/200/300",
                height: 100.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "وجبة الدجاج المحمر" + "\n",
                    maxLines: 2,
                    style: getSemiBoldStyle(fontSize: 14.sp, fontHeight: 1),
                  ),
                  AutoSizeText(
                    " 1000" + AppTranslations.currency,
                    maxLines: 1,
                    style: getSemiBoldStyle(
                        fontSize: 13.sp, fontHeight: 1, color: AppColors.green),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          cubit.addOrRemoveMenuCart(true);
                        },
                        child: Icon(
                          CupertinoIcons.add_circled,
                          color: AppColors.primary,
                          size: 20.sp,
                        ),
                      ),
                      if (cubit.itemsQty > 0) ...[
                        Text(
                          " ${cubit.itemsQty} ",
                          style: getSemiBoldStyle(
                              fontSize: 14.sp, color: AppColors.primary),
                        ),
                        GestureDetector(
                          onTap: () {
                            cubit.addOrRemoveMenuCart(false);
                          },
                          child: Icon(
                            CupertinoIcons.minus_circled,
                            color: AppColors.primary,
                            size: 20.sp,
                          ),
                        ),
                      ],
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
