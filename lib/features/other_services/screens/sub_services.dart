import 'package:easy_localization/easy_localization.dart';

import '../../../core/exports.dart';
import '../../location/cubit/location_cubit.dart';
import '../cubit/other_services_cubit.dart';
import '../cubit/other_services_state.dart';
import 'package:travel_club/features/other_services/screens/widgets/custom_nearst_others.dart';

import '../data/models/sub_services_model.dart';

class SubServicesScreen extends StatefulWidget {
  const SubServicesScreen({super.key,required this.id});
final String id;
  @override
  State<SubServicesScreen> createState() => _SubServicesScreenState();
}

class _SubServicesScreenState extends State<SubServicesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // context.read<LocationCubit>().getAddressFromLatLng(
    //     double.tryParse( context.read<OtherServicesCubit>().subServicesModel.data?.first.latitude.toString() ?? "") ?? 0,
    //     double.tryParse(r.data?.longitude.toString() ?? "") ?? 0);
    context.read<OtherServicesCubit>().getSubServices(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<OtherServicesCubit>();
    return BlocBuilder<OtherServicesCubit, OtherServicesScreenState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
            appbarTitle: AppTranslations.details,
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      AppTranslations.nearstPlaces,
                      style: getMediumStyle(fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                      child:cubit.subServicesModel.data == null
                          ? Center(
                        child: CustomLoadingIndicator(),
                      )
                          : cubit.subServicesModel.data?.isEmpty??false
                          ? Center(
                        child: Text('no_data'.tr()),
                      ): ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return CustomNearstOthers(model: cubit.subServicesModel.data?[index]??SubServicesData(),);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 10.h,
                          );
                        },
                        itemCount: cubit.subServicesModel.data?.length??0,
                      ),
                    )
                  ]),
            ));
      },
    );
  }
}
