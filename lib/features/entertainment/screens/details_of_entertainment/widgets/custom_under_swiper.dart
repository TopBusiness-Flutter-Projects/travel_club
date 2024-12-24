
import 'package:travel_club/features/entertainment/screens/details_of_entertainment/widgets/toggle_container.dart';
import '../../../../../../core/exports.dart';
import '../../../cubit/entertainment_cubit.dart';
import 'about_widget.dart';
import 'custom_service_container.dart';

class ContainerUnderSwiperEntertainment  extends StatelessWidget {
  const ContainerUnderSwiperEntertainment({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<EntertainmentCubit>();
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(builder: (BuildContext context, state) {
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
            padding:  EdgeInsets.only(top:                  getHeightSize(context) * 0.07,
            ),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //togle
                ToggleButtonScreen(),
                if(cubit.isServiceSelected==true)
                  AboutWidget()
                else...[
                  SizedBox(height: 9.h,),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: 5, itemBuilder: (BuildContext context, int index) {
                    return CustomServiceContainer();
                          }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10.h); },),
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