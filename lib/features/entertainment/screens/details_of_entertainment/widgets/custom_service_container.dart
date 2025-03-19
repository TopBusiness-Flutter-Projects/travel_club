import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/entertainment/cubit/entertainment_cubit.dart';

import '../../../../../core/exports.dart';
import '../../../data/model/get_orginization_details_model.dart';

class CustomServiceContainer extends StatelessWidget {
  const CustomServiceContainer({super.key,required this.wayService});
 final WayService wayService ;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomContainerWithShadow(
            child: InkWell(
              onTap: () {
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
                         wayService.name.toString(),
                          style: getSemiBoldStyle(
                            fontSize: 14.sp,
                            color: AppColors.secondPrimary,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          wayService.price.toString() + " " + AppTranslations.currency,
                          style: getSemiBoldStyle(
                            fontSize: 14.sp,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        child: CustomButton(
                            title: AppTranslations.bookNow,
                            width: 123.w,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.bookTableEntermaint);
                            })),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
