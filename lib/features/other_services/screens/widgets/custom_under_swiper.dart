
import 'package:travel_club/features/entertainment/screens/details_of_entertainment/widgets/about_widget.dart';
import 'package:travel_club/features/entertainment/screens/details_of_entertainment/widgets/toggle_container.dart';
import 'package:travel_club/features/other_services/cubit/other_services_cubit.dart';
import 'package:travel_club/features/other_services/cubit/other_services_state.dart';
import '../../../../../../core/exports.dart';
import 'about_widget.dart';

class ContainerUnderSwiperOtherService  extends StatelessWidget {
  const ContainerUnderSwiperOtherService({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<OtherServicesCubit>();
    return BlocBuilder<OtherServicesCubit, OtherServicesScreenState>(builder: (BuildContext context, state) {
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
            padding:  EdgeInsets.only(top:                  getHeightSize(context) * 0.05,
            ),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
           
                  ServiceAboutWidget()
               

              ],
            ),
          ),
        ),
      );
    },);
  }
}
