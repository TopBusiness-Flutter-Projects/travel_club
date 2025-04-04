
import '../../../../../core/exports.dart';
import '../../../entertainment/cubit/entertainment_cubit.dart';
import '../../data/models/sub_services_model.dart';
import 'custom_container_others.dart';


class ContainerInCenterOthers extends StatelessWidget {
  ContainerInCenterOthers({super.key,required this.model});
  SubServicesData model;
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

              CustomContainerOthers(model: model,)
              // CustomRatingIncenter()
            ],


          ),
        ),
      );
    },);
  }
}
