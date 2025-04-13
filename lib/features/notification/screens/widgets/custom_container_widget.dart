import 'dart:developer';

import '../../../../core/exports.dart';
import '../../../entertainment/screens/details_of_entertainment/screens/details_entertainment.dart';
import '../../../food/screens/details_of_food/screens/details_food_screen.dart';
import '../../../main_screen/cubit/cubit.dart';
import '../../../my_bookings/cubit/my_bookings_cubit.dart';
import '../../../residence/view/screens/lodge_details.dart';
import '../../../residence/view/screens/lodges_screen.dart';
import '../../cubit/notification_cubit.dart';
import '../../data/model/get_notification.dart';

class CustomContainerWidget extends StatelessWidget {
  const CustomContainerWidget({super.key,required this.data});
 final NotificationData data;
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<NotificationCubit>();
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (BuildContext context, state) {
        return InkWell(
          onTap: (){
            log(data.referenceId.toString());
            log(data.referenceTable.toString());

            if(data.referenceTable=="places"){
              Navigator.pushNamed(context, Routes.hotelsScreen,
                  arguments: LodgesScreenArguments(
                      placeId: data.referenceId??0,
                      title: data.title.toString()));
             // Navigator.pushNamed(context, Routes.)
            }
            else if(data.referenceTable=="lodges"){
              log(data.referenceId.toString());

              Navigator.pushNamed(context, Routes.lodgeDetailsRoute,
                  arguments: LodgeDetailsArguments(lodgeId: data.referenceId??0));
            }
            else if(data.referenceTable=="offers"||data.referenceTable=="suitcases"){
              log(data.referenceId.toString());
              context.read<MainCubit>().changePage(0);
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainRoute,
                    (route) => false,
              );
            }
            else if(data.referenceTable=="room_reservations"){
              log(data.referenceId.toString());
              context.read<MainCubit>().changePage(1);
              context.read<MyReservationsCubit>() . selectedModuleId=1;
              context.read<MyReservationsCubit>() . changeModule(1);
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainRoute,
                    (route) => false,
              );
            } else if(data.referenceTable=="bus_reservations"){
              log(data.referenceId.toString());
              context.read<MainCubit>().changePage(1);
              context.read<MyReservationsCubit>() . selectedModuleId=2;
              context.read<MyReservationsCubit>() . changeModule(2);
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainRoute,
                    (route) => false,
              );
            } else if(data.referenceTable=="organization_reservations"){
              log(data.referenceId.toString());
              context.read<MainCubit>().changePage(1);
              context.read<MyReservationsCubit>() . selectedModuleId=3;
              context.read<MyReservationsCubit>() . changeModule(3);
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainRoute,
                    (route) => false,
              );
            } else if(data.referenceTable=="restaurant_reservations"){
              log(data.referenceId.toString());
              context.read<MainCubit>().changePage(1);
              context.read<MyReservationsCubit>() . selectedModuleId=4;
              context.read<MyReservationsCubit>() . changeModule(4);
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.mainRoute,
                    (route) => false,
              );
            }
            else if(data.referenceTable == "restaurants"){
              log(data.referenceId.toString());
              Navigator.pushNamed( context,Routes.detailsFoodRoute,
                  arguments: DetailsFoodArgs(id:  data.referenceId.toString()));
            }
            else if(data.referenceTable == "organizations"){
              Navigator.pushNamed(
                  context, Routes.detailsEntertainment,
                  arguments:EntertainmentDetailsArgs(
                    id:  data.referenceId ?? 0,
                  )


              );
            }
            else if(data.referenceTable == "companies"){
              Navigator.pushNamed(
                  context, Routes.detailsEntertainment,
                  arguments:EntertainmentDetailsArgs(
                    id:  data.referenceId ?? 0,
                  )


              );
            }

         if (data.seen==0){
           data.seen=1;
           cubit.seenNotification(context, id: data.id.toString());
         }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomContainerWithShadow(
              color:data.seen==0? AppColors.lbny.withOpacity(.4):AppColors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //notification icon
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.lbny.withOpacity(.2),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: SvgPicture.asset(
                            AppIcons.notificationIcon,
                            color: AppColors.primary,
                          )),
                    ),
                    SizedBox(width: 15.w),
                    //column
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(data.body.toString()??""),
                          SizedBox(
                            height: getVerticalPadding(context) * 1,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                AppIcons.calendar,
                                color: AppColors.grey,
                              ),
                              Text(
                               data.createdAt.toString().substring(0,10),
                                style: getMediumStyle(
                                    color: AppColors.grey, fontSize: 14.sp),
                              ),
                            ],
                          ),

                        ],
                      ),
                    )
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
