// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/location/cubit/location_cubit.dart';
import 'package:travel_club/features/location/cubit/location_state.dart';
import 'package:travel_club/features/location/screens/transportation_map.dart';

class TransportationMapScreen extends StatefulWidget {
  const TransportationMapScreen({super.key});
  @override
  State<TransportationMapScreen> createState() =>
      _TransportationMapScreenState();
}

class _TransportationMapScreenState extends State<TransportationMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: getHeightSize(context),
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                height: getHeightSize(context),
                child: const TransportationMap()),
            Column(children: [
              SizedBox(height: getVerticalPadding(context) * 2),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalPadding(context)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackButton(),
                      Text(
                        AppTranslations.transportation,
                        style: getSemiBoldStyle(
                            color: AppColors.black, fontSize: 16.sp),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                    ]),
              ),
              const Spacer(),
              BlocBuilder<LocationCubit, LocationState>(
                  builder: (context, state) {
                LocationCubit cubit = context.read<LocationCubit>();

                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getHorizontalPadding(context) * 2.8),
                  child: Opacity(
                    opacity: cubit.selectedLocation != null ? 1 : 0.5,
                    child: CustomButton(
                        title: AppTranslations.transportationResults,
                        onTap: () {
                          print(
                              "Selected Location lat: ${cubit.selectedLocation?.latitude}");
                          print(
                              "Selected Location long: ${cubit.selectedLocation?.longitude}");
                          if (cubit.selectedLocation != null) {
                            Navigator.pushNamed(
                                context, Routes.transportationMenuRoute);
                          }
                        }),
                  ),
                );
              }),
            ]),
          ],
        ),
      ),
    );
  }
}
