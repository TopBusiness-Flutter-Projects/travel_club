import 'package:travel_club/features/location/screens/accommodation_map.dart';
import 'package:travel_club/features/residence/data/models/lodges_model.dart';
import 'package:travel_club/features/residence/view/widgets/hotels_widgets/custom_filter.dart';

import '../../../../core/exports.dart';
import '../../../../core/widgets/no_data_widget.dart';
import '../../cubit/residence_cubit.dart';
import '../widgets/residence_widgets/accomendation_rating.dart';

class LodgesScreenArguments {
  LodgesScreenArguments({required this.placeId, required this.title});
  final int placeId;
  final String title;
}

class LodgesScreen extends StatefulWidget {
  const LodgesScreen({super.key, required this.arguments});
  final LodgesScreenArguments? arguments;

  @override
  State<LodgesScreen> createState() => _LodgesScreenState();
}

class _LodgesScreenState extends State<LodgesScreen> {
  bool isMap = false;

  @override
  void initState() {
    context.read<ResidenceCubit>().lodgesModel = GetLodgesModel();
    context.read<ResidenceCubit>().removeAllFilters();
    context.read<ResidenceCubit>().getLodges(placeId: widget.arguments!.placeId, context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResidenceCubit, ResidenceState>(
      builder: (BuildContext context, state) {
        ResidenceCubit cubit = context.read<ResidenceCubit>();
        return isMap
            ? MapUI(
                filterBar: CustomFilterBar(
                  mapWidget: InkWell(
                    onTap: () {
                      setState(() {
                        isMap = !isMap;
                      });
                    },
                    child: BuildFilterItem(
                      icon: isMap ? AppIcons.menu : AppIcons.map,
                      label: isMap ? AppTranslations.menu : AppTranslations.map,
                    ),
                  ),
                ),
              )
            : ListUI(
                filterBar: CustomFilterBar(
                    mapWidget: InkWell(
                      onTap: () {
                        setState(() {
                          isMap = !isMap;
                        });
                      },
                      child:
                      BuildFilterItem(
                        icon: isMap
                            ? AppIcons.menu
                            : AppIcons.map, // Flutter built-in icon for map
                        label:
                            isMap ? AppTranslations.menu : AppTranslations.map,
                      ),
                    ),
                    id: widget.arguments!.placeId),
                title: widget.arguments!.title,
              );
      },
    );
  }
}

class MapUI extends StatelessWidget {
  const MapUI({super.key, required this.filterBar});
  final Widget filterBar;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResidenceCubit, ResidenceState>(
        builder: (BuildContext context, state) {
      ResidenceCubit cubit = context.read<ResidenceCubit>();
      return Scaffold(
          body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            cubit.lodgesModel.data == null
                ? const Center(
                    child: CustomLoadingIndicator(),
                  )
                : cubit.lodgesModel.data!.isEmpty
                    ? NoDataWidget(
                        title: AppTranslations.noData,
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: AccomodationMap(
                          markers: cubit.lodgesMarkers,
                        ),
                      ),
            Column(children: [
              SizedBox(height: getVerticalPadding(context) * 2),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getHorizontalPadding(context)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomBackButton(),
                      Text(
                        AppTranslations.map,
                        style: getSemiBoldStyle(
                            color: AppColors.black, fontSize: 16.sp),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: filterBar,
              ),
              Spacer(),
              if (cubit.selectedLodge != null && cubit.lodgesModel.data != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomLodgeContainer(
                    lodgesModel: cubit.selectedLodge!,
                  ),
                )
            ]),
          ],
        ),
      ));
    });
  }
}

class ListUI extends StatelessWidget {
  const ListUI({super.key, required this.filterBar, required this.title});
  final Widget filterBar;
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResidenceCubit, ResidenceState>(
        builder: (BuildContext context, state) {
      ResidenceCubit cubit = context.read<ResidenceCubit>();
      return CustomScreen(
        appbarTitle: title,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            //
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //filter row
              filterBar,
              SizedBox(
                height: 20.h,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  AppTranslations.menu,
                  style: getMediumStyle(fontSize: 14.sp),
                ),
              ),
              // AccomendationRating(hotelsModel: HotelsModel(title: 'مراسي ريزورت العين السخنه البحر الاحمر', rate:4 , discription: '٢٠٠ فرد قام بتقيم الفندق', image:   "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
              // onTap: (){
              // Navigator.pushNamed(context, Routes.detailsAccomendation);
              //  }
              Expanded(
                child: cubit.lodgesModel.data == null
                    ? const Center(
                        child: CustomLoadingIndicator(),
                      )
                    : cubit.lodgesModel.data!.isEmpty
                        ? NoDataWidget(
                            title: AppTranslations.noData,
                          )
                        : ListView.separated(
                            // physics: (),
                            shrinkWrap: true,
                            // scrollDirection: Axis.horizontal,
                            itemCount: cubit.lodgesModel.data?.length ?? 0,
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10.w,
                                  height: 1.h,
                                ),
                            itemBuilder: (context, index) =>
                                CustomLodgeContainer(
                                  lodgesModel: cubit.lodgesModel.data![index],
                                )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
