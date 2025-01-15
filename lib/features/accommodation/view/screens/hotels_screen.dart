import 'package:travel_club/features/location/screens/accommodation_map.dart';

import '../../../../core/exports.dart';
import '../../../../core/widgets/no_data_widget.dart';
import '../../cubit/accomendation_cubit.dart';
import '../widgets/acommendation_widgets/accomendation_rating.dart';
import '../widgets/hotels_widgets/custom_filter.dart';
class HotelsScreenArguments {
  HotelsScreenArguments({required this.id,required this.title});
  final int? id;
  final String title;
}
class HotelsScreen extends StatefulWidget {
 const  HotelsScreen({super.key , required this.arguments});
 final  HotelsScreenArguments? arguments;
// String ?id;
  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  bool isMap = false;

  @override
  void initState() {
    context.read<AccomendationCubit>().getLodges(id: widget.arguments!.id!,context: context);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccomendationCubit, AccomendationState>(
      builder: (BuildContext context, state) {
        AccomendationCubit cubit = context.read<AccomendationCubit>();
        return isMap
            ? Scaffold(
                body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: AccomodationMap(
                        markers: cubit.hotelsMarkers,
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
                        child: CustomFilterBar(
                          mapWidget: InkWell(
                            onTap: () {
                              setState(() {
                                isMap = !isMap;
                              });
                            },
                            child: BuildFilterItem(
                              icon: isMap ? AppIcons.menu : AppIcons.map,
                              label: isMap
                                  ? AppTranslations.menu
                                  : AppTranslations.map,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomWidgetRating(
                          hotelsModel: cubit.selectedLodge,
                        ),
                      )
                    ]),
                  ],
                ),
              ))
            : CustomScreen(
                appbarTitle:widget.arguments!.title,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //filter row
                      CustomFilterBar(
                        mapWidget: InkWell(
                          onTap: () {
                            setState(() {
                              isMap = !isMap;
                            });
                          },
                          child: BuildFilterItem(
                            icon: isMap
                                ? AppIcons.menu
                                : AppIcons.map, // Flutter built-in icon for map
                            label: isMap
                                ? AppTranslations.menu
                                : AppTranslations.map,
                          ),
                        ),
                        id:widget.arguments!.id
                      ),
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
                      cubit.lodgesModel.data==null?const Center(child: CustomLoadingIndicator(),):
                      cubit.lodgesModel.data!.isEmpty?NoDataWidget( title: AppTranslations.noData,):
                      Expanded(
                        child: ListView.separated(
                            // physics: (),
                            shrinkWrap: true,
                            // scrollDirection: Axis.horizontal,
                            itemCount:  cubit.lodgesModel.data?.length??0,
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10.w,
                                  height: 1.h,
                                ),
                            itemBuilder: (context, index) => CustomWidgetRating(
                                  hotelsModel:
                                      cubit.lodgesModel.data![index],
                                )
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
