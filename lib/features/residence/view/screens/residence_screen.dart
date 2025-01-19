import 'package:travel_club/features/residence/view/widgets/residence_widgets/place_container.dart';
import 'package:travel_club/features/residence/view/widgets/residence_widgets/accomendation_rating.dart';

import '../../../../core/exports.dart';
import '../../cubit/residence_cubit.dart';

class AccomendationScreen extends StatefulWidget {
  const AccomendationScreen({super.key});

  @override
  State<AccomendationScreen> createState() => _AccomendationScreenState();
}

class _AccomendationScreenState extends State<AccomendationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ResidenceCubit>().getPlaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ResidenceCubit>();
    return BlocBuilder<ResidenceCubit, ResidenceState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
          appbarTitle: AppTranslations.accommodation,
          body: cubit.placesModel.data == null
              ? const Center(
                  child: CustomLoadingIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: StaggeredGrid.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            children: List.generate(
                                cubit.placesModel.data?.places!.length ?? 0,
                                (index) => CustomPlaceContainer(
                                      categoryModel:
                                          cubit.placesModel.data!.places![index],
                                    ))),
                      ),
                      if (cubit.placesModel.data?.lodges != null)
                      if (cubit.placesModel.data!.lodges!.isNotEmpty)
                      ...[
                      Text(
                        AppTranslations.mostPlaceRating,
                        style: getMediumStyle(fontSize: 14.sp),
                      ),
                      Expanded(
                        child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: cubit.placesModel.data!.lodges!.length ,
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10.w,
                                  height: 1.h,
                                ),
                            itemBuilder: (context, index) =>
                                CustomLodgeContainer(
                                    hotelsModel:cubit.placesModel.data!.lodges![index] )),
                      ),]
                    ],
                  ),
                ),
        );
      },
    );
  }
}
