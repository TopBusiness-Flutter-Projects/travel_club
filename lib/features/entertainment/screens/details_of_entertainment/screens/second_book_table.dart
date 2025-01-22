import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import 'package:travel_club/features/entertainment/cubit/entertainment_cubit.dart';

import '../../../../../core/exports.dart';
import '../../../../payment/screens/widgets/custom_price_widget.dart';
import '../../../../transportation/screens/widgets/custom_from_to_date.dart';

class SecondBookTableEntermaint extends StatelessWidget {
  const SecondBookTableEntermaint({super.key});

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
                  child: Text("شركة سيكرت ترافيل",style: getSemiBoldStyle(fontSize: 18.sp,),),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  CustomContainerWithShadow(child:
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
                ),
                SizedBox(height: getHeightSize(context)*.05),
                const CustomPricesWidget(
                  totalPrice: "50",
                  totalPriceAfterVat: "40",
                  vat: "40",
                  terms: "nono",
                  reservationId: 0,

                ),
              ]),
        ),
      )); },);
  }
}
