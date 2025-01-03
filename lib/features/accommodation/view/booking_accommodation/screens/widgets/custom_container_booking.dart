import '../../../../../../core/exports.dart';
import '../../../../../transportation/cubit/transportation_cubit.dart';
import '../../../../cubit/accomendation_cubit.dart';

import 'custom_rooms_widget.dart';

class CustomContainerBooking extends StatelessWidget {
   CustomContainerBooking({super.key, this.widgetBottom});
  Widget? widgetBottom;
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<AccomendationCubit>();
    return BlocBuilder<AccomendationCubit,AccomendationState>(builder: (BuildContext context, state) {
      return  Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        CustomContainerWithShadow(
          // width:  400.h,
          //   height: 500.h,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("غرفه عادية ب سرير فردي",style: getBoldStyle(fontSize: 16.sp,color:AppColors.primary),),
                  SizedBox(height: 10.h,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIcons.correct),
                        SizedBox(width: 5.w,),
                        Text(AppTranslations.cancelFree+"  "+context.read<TransportationCubit>().toDate.toString()??"",style: getRegularStyle(fontSize: 14.sp,color: AppColors.green),),
                      ],
                    ),
                  ),
                  Divider(color: AppColors.lightBlue1,),
                  //custom rooms widget
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,

                      children: List.generate(6, (index) =>
                          // Text("dddd "+index.toString(),style: getRegularStyle(fontSize: 14.sp),),
                         SizedBox(
                             width: getWidthSize(context)*0.3,
                             child: CustomRoomsWidget())
                      ),
                    )

                    // StaggeredGrid.count(
                    //   crossAxisCount: 2,
                    //   children: List.generate(6, (index) =>
                    //       Text("dddd "+index.toString(),style: getRegularStyle(fontSize: 14.sp),),
                    //       // CustomRoomsWidget()
                    //   ),
                    //
                    // ),
                  ),
                 // Divider(color: AppColors.lightBlue1,),
                  widgetBottom??Container(),

                ],
              ),
            )
        ),
        //Container()
      );
    },);
  }
}
