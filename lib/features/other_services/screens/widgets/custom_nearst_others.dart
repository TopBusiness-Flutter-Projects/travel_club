import 'package:travel_club/core/widgets/network_image.dart';

import '../../../../core/exports.dart';
import '../../data/models/sub_services_model.dart';
import '../single_service_details.dart';

class CustomNearstOthers extends StatelessWidget {
  const CustomNearstOthers({super.key, required this.model});
  final SubServicesData model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailsOtherServices,
            arguments: ServicesDetailsArguments(id:  model.id??0));
      },
      child: CustomContainerWithShadow(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomNetworkImage(
                image: model.logo ?? "",
                height: 60.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title ?? "",
                      style: getSemiBoldStyle(
                          color: AppColors.secondPrimary, fontSize: 14.sp),
                    ),
                    Text(
                      model.location ?? "",
                      maxLines: 2,
                      style: getRegularStyle(
                          color: AppColors.grey, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     width: 44.w, // Adjust size as needed
              //     height: 44.h,
              //     decoration: BoxDecoration(
              //       color: AppColors.primary,
              //       shape: BoxShape.rectangle,
              //       borderRadius: BorderRadius.circular(
              //           15.r), // Circular with rounded corners
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: SvgPicture.asset(
              //         AppIcons.call,
              //         width: 15.w,
              //         height: 15.h,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                width: 10.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
