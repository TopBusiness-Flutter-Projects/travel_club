import 'package:flutter/services.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import 'package:travel_club/features/entertainment/cubit/entertainment_cubit.dart';
import 'package:travel_club/features/entertainment/data/model/get_orginization_details_model.dart';

import '../../../../../core/exports.dart';
import '../../../../transportation/screens/widgets/custom_from_to_date.dart';

class BookTableEntermaint extends StatefulWidget {
  const BookTableEntermaint({super.key, required this.wayService});
  final WayService wayService;

  @override
  State<BookTableEntermaint> createState() => _BookTableEntermaintState();
}

class _BookTableEntermaintState extends State<BookTableEntermaint> {
  @override
  void initState() {
    context.read<EntertainmentCubit>().clientCountController.text = "1";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EntertainmentCubit>();
    GlobalKey<FormState> formKeyTable = GlobalKey<FormState>();
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
            appbarTitle: AppTranslations.booking,
            body: Form(
              key: formKeyTable,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomContainerWithShadow(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        widget.wayService.name?.toString() ??
                                            "",
                                        style: getSemiBoldStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.secondPrimary,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text(
                                        "${widget.wayService.price} ${AppTranslations.currency}",
                                        style: getSemiBoldStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        AppTranslations.theTotal,
                                        style: getSemiBoldStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.secondPrimary,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Text(
                                        cubit.clientCountController.text
                                                .isNotEmpty
                                            ? "${(double.parse(widget.wayService.price.toString()) * double.parse(cubit.clientCountController.text.toString()))} ${AppTranslations.currency}"
                                            : "0 ${AppTranslations.currency}",
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
                          ),
                        ),
                        SizedBox(height: getHeightSize(context) * .05),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            AppTranslations.selectBookingDate,
                            style: getMediumStyle(fontSize: 14.sp),
                          ),
                        ),
                        SizedBox(height: getHeightSize(context) / 90),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                          child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightWhite2,
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(18.h),
                                child: DatePickerField(
                                  selectedDate: cubit.singleDate,
                                  isSingle: true,
                                  onTap: () {
                                    cubit.onSelectedDateSingle(
                                        context: context);
                                  },
                                ),
                              )),
                        ),
                        SizedBox(height: getHeightSize(context) / 90),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            AppTranslations.numberOfAttendees,
                            style: getMediumStyle(fontSize: 14.sp),
                          ),
                        ),
                        CustomTextField(
                          controller: cubit.clientCountController,
                          keyboardType: TextInputType.number,
                          onChanged: (v) {
                            cubit.clientCountController.text = v;
                            setState(() {});
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          hintText: AppTranslations.enter +
                              AppTranslations.numberOfAttendees,
                          validator: (p0) => p0!.isEmpty
                              ? AppTranslations.enter +
                                  AppTranslations.numberOfAttendees
                              : null,
                        ),
                        SizedBox(height: getHeightSize(context) / 90),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            AppTranslations.nameOwner,
                            style: getMediumStyle(fontSize: 14.sp),
                          ),
                        ),
                        CustomTextField(
                          controller: cubit.userNameController,
                          keyboardType: TextInputType.text,
                          validator: (p0) => p0!.isEmpty
                              ? AppTranslations.enter +
                                  AppTranslations.nameOwner
                              : null,
                          hintText:
                              AppTranslations.enter + AppTranslations.nameOwner,
                        ),
                        SizedBox(height: getHeightSize(context) / 90),
                        CustomPhoneFormField(
                          controller: cubit.userPhoneController,
                          initialValue: cubit.countryCode,
                          title: AppTranslations.numberOfPhoneContact,
                          onCountryChanged: (v) {
                            cubit.countryCode = '+${v.fullCountryCode}';
                            debugPrint("Country changed to: ${v.name}");
                          },
                          onChanged: (phone) {
                            debugPrint(phone.completeNumber);
                          },
                        ),
                        CustomButton(
                          title: AppTranslations.bookNow,
                          onTap: () {
                            if (formKeyTable.currentState!.validate()) {
                              cubit.addEntertainmentReservation(
                                  context, widget.wayService);
                            }
                            // Navigator.pushNamed(
                            //     context, Routes.secondBookTableEntertainment,
                            //     arguments: true);
                          },
                        )
                      ]),
                ),
              ),
            ));
      },
    );
  }
}
