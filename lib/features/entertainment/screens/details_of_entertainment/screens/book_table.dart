import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import 'package:travel_club/features/entertainment/cubit/entertainment_cubit.dart';

import '../../../../../core/exports.dart';
import '../../../../transportation/screens/widgets/custom_from_to_date.dart';

class BookTableEntermaint extends StatelessWidget {
  const BookTableEntermaint({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<EntertainmentCubit>();
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(builder: (BuildContext context, state) {
      return CustomScreen(appbarTitle: AppTranslations.bookTable,body:
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomContainerWithShadow(child:
                InkWell(
                  onTap: (){
                    // Navigator.pushNamed(context, Routes.donePayment,
                    //     arguments: true);
                    // Navigator.pushNamed(context, Routes.bookTableEntermaint);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "تاجير يخت كامل",
                              style: getSemiBoldStyle(
                                fontSize: 14.sp,
                                color: AppColors.secondPrimary,
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Text(
                              "200"+" "+AppTranslations.currency,
                              style: getSemiBoldStyle(
                                fontSize: 14.sp,
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              AppTranslations.theTotal,
                              style: getSemiBoldStyle(
                                fontSize: 14.sp,
                                color: AppColors.secondPrimary,
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Text(
                              "200"+" "+AppTranslations.currency,
                              style: getSemiBoldStyle(
                                fontSize: 14.sp,
                                color: AppColors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),),
              ),              SizedBox(height: getHeightSize(context)*.05),

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppTranslations.theNumber,style: getMediumStyle(fontSize: 14.sp),),
              ),
              CustomTextField(hintText: "5",),
              //name of owner
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppTranslations.nameOwner,style: getMediumStyle(fontSize: 14.sp),),
              ),
              CustomTextField(hintText: "احمد مختار على",), Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppTranslations.numberOfPhoneContact,style: getMediumStyle(fontSize: 14.sp),),
              ),
              CustomTextField(hintText: "01000000000",),
              CustomButton(title: AppTranslations.bookTable,onTap: (){ Navigator.pushNamed(context, Routes.donePayment,
                  arguments: true);},)
            ]),
      ),
    )); },);
  }
}
