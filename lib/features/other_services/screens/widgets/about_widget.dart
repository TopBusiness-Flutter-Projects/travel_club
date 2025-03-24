import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/features/entertainment/screens/details_of_entertainment/widgets/custom_contact_container.dart';
import 'package:travel_club/features/location/screens/position_map.dart';
import 'package:travel_club/features/other_services/cubit/other_services_cubit.dart';
import 'package:travel_club/features/other_services/cubit/other_services_state.dart';

import '../../../../../core/exports.dart';
import '../../data/models/get_single_service_model.dart';

class ServiceAboutWidget extends StatelessWidget {
  const ServiceAboutWidget({super.key,required this.singleServiceData});
final  SingleServiceData singleServiceData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherServicesCubit, OtherServicesScreenState>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if(singleServiceData.about.toString()!="null")...[
                Text(
                  AppTranslations.about,
                  style: getMediumStyle(
                    color: AppColors.secondPrimary,
                    fontSize: 14.sp,
                  ),
                ),

                Text(
                  singleServiceData.about.toString(),
                  style: getMediumStyle(
                    fontSize: 14.sp,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 10.h),
              ]
           ,


              ContactButtonsScreen(phoneNumberForCall: singleServiceData.phone.toString(), phoneNumberForWhatsApp: singleServiceData.whatsapp.toString(),),
              SizedBox(height: 10.h),
              //map
              PositionMap(lat: double.tryParse(singleServiceData.latitude.toString())??0.0 , long: double.tryParse(singleServiceData.longitude.toString())??0.0,),
              SizedBox(height: 30.h),
            ],
          ),
        );
      },
    );
  }
}
