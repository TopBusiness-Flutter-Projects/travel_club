
import 'package:travel_club/features/entertainment/data/model/get_orginization_model.dart';

import '../../../../../core/exports.dart';
import '../../../../entertainment/screens/widgets/custom_container_companies.dart';
import '../../../cubit/entertainment_cubit.dart';


class ContainerInCenterEntertainment extends StatelessWidget {
  ContainerInCenterEntertainment({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<EntertainmentCubit>();
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(builder: (BuildContext context, state) {
      return    Positioned(
        top: getHeightSize(context) * 0.29, // Adjust position from the top
        left: getWidthSize(context) * 0.05, // Adjust position from the left
        right: getWidthSize(context) * 0.05, // Adjust position from the right
        child: SizedBox(
          height: getHeightSize(context) * 0.50,

          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //النقط
            children: [
       SizedBox(height: 10.h,),
                CustomContainerCompanies(orginizationData: OrginizationData(),)
             // CustomRatingIncenter()
            ],


          ),
        ),
      );
    },);
  }
}
