import '../../../core/exports.dart';
import '../cubit/other_services_cubit.dart';
import '../cubit/other_services_state.dart';
import 'widgets/custom_nearst_others.dart';

class SubServicesScreen extends StatelessWidget {
  const SubServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return CustomNearstOthers();
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 10.h,
                          );
                        },
                        itemCount: 5,
                      ),
                    )
                  ]),
            ));
      },
    );
  }
}
