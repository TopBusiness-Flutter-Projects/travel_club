
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/dropdown_button_form_field.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';

class CustomFomToSection extends StatelessWidget {
  const CustomFomToSection({
    super.key,
   
  });

  

  @override
  Widget build(BuildContext context) {
       TransportationCubit cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
        return CustomContainerWithShadow(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Column(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 4.0,
                        top: getVerticalPadding(context) * 0.7),
                    child: Image.asset(ImageAssets.fromLocation,
                        width: 25.h),
                  ),
                  Expanded(
                    child: Column(
                      children: List.generate(
                          18,
                          (index) => Expanded(
                                child: Container(
                                  width: 2,
                                  // height: 3,
                                  color: index % 2 == 0
                                      ? AppColors.yellow
                                      : AppColors.white,
                                ),
                              )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: getVerticalPadding(context) * 0.7),
                    child: Image.asset(ImageAssets.marker,
                        width: 25.h),
                  ),
                ]),
                Expanded(
                  child: Column(
                    children: [
                      CustomDropdownButtonFormField(
                        items: cubit.cities,
                        onChanged: (value) {
                          print(value);
                          cubit.changeFromValue(value!);
                        },
                        value: cubit.bookingFromvalue,
                      ),
                      SizedBox(
                        height: getVerticalPadding(context),
                      ),
                      CustomDropdownButtonFormField(
                        items: cubit.cities,
                        onChanged: (value) {
                          cubit.changeToValue(value!);
                        },
                        value: cubit.bookingTovalue,
                      ),
                      SizedBox(
                        height: getVerticalPadding(context) * 0.6,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
      }
    );
  }
}