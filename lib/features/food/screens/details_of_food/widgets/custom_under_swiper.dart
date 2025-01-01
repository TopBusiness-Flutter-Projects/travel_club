
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/features/food/screens/details_of_food/widgets/rating_widget.dart';
import 'package:travel_club/features/food/screens/details_of_food/widgets/sub_toggle_buttons.dart';
import 'package:travel_club/features/food/screens/details_of_food/widgets/toggle_container.dart';
import '../../../../../../core/exports.dart';
import '../../../cubit/food_cubit.dart';
import 'about_widget.dart';
import 'custom_menue_container.dart';

class ContainerUnderSwiperFood  extends StatelessWidget {
  const ContainerUnderSwiperFood({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<FoodCubit>();
    return BlocBuilder<FoodCubit, FoodState>(builder: (BuildContext context, state) {
      return     Positioned(
        bottom: 0,
        child: Container(
          height: getHeightSize(context) * 0.59,
          width: getWidthSize(context),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.r),
              topRight: Radius.circular(18.r),
            ),
          ),
          child: Padding(
            padding:  EdgeInsets.only(top:                  getHeightSize(context) * 0.17,
            ),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //togle
                ToggleButtonsFood(),
              //sub
              if  (cubit.selectedIndexMenue==0)...[
                SubToggleButtonsFood(),
                ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: 1, itemBuilder: (BuildContext context, int index) {
                  return CustomMenueContainer();
                }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10.h); },),
              ]
                //about
                else if(cubit.selectedIndexMenue==1)...[
                SizedBox(height: 9.h,),
                AboutWidgetFood(),
                // ListView.separated(
                //   shrinkWrap: true,
                //   physics: BouncingScrollPhysics(),
                //   itemCount: 5, itemBuilder: (BuildContext context, int index) {
                //   return CustomMenueContainer();
                //         }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10.h); },),
                SizedBox(height: 100.h,)
              ]
                 // rating()
                else...[
                  SizedBox(height: 9.h,),
                  ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5, itemBuilder: (BuildContext context, int index) {
                    return  RatingWidgetFood();
                  }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10.h,); },),
                  SizedBox(height: 100.h,)
                ]
              ],
            ),
          ),
        ),
      );
    },);
  }
}
