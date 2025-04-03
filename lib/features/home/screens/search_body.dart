import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/no_data_widget.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/home/cubit/home_state.dart';
import 'package:travel_club/features/residence/data/models/lodges_model.dart';
import 'package:travel_club/features/residence/view/widgets/residence_widgets/accomendation_rating.dart';
import 'package:travel_club/features/home/screens/widgets/custom_booking_sectoin.dart';
import 'package:travel_club/features/transportation/data/models/get_companies_model.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../entertainment/screens/widgets/entertainment_widget.dart';
import '../../food/data/models/get_resturant_model.dart';
import '../../food/widgets/big_container_food.dart';
import '../../other_services/screens/other_services_screen.dart';
import '../../transportation/screens/widgets/custom_company_container.dart';
class Searchbody extends StatefulWidget {
  const Searchbody({
    super.key,
  });
  @override
  State<Searchbody> createState() => _SearchbodyState();
}

class _SearchbodyState extends State<Searchbody> {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: getVerticalPadding(context) * 2),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const CustomBackButton(),
              5.w.horizontalSpace,
              Expanded(
                child: CustomTextField(
                  controller: cubit.searchController,
                  autoFocus: true,
                  hintText: AppTranslations.search,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppIcons.search),
                  ),
                    onChanged: (value) {
                      EasyDebounce.debounce(
                          'home_reports-emplyee-debouncer',
                          const Duration(seconds: 1),
                              () async => await cubit.  getHomeFilterData( context:  context)
                          ());

                  },
                ),
              ),
            ],
          ),
        ),
 Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //list view حجوزات اول حاجه
              Padding(
                padding: EdgeInsets.only(top: 10.0.h, right: 10.w),
                child: SizedBox(
                  height: 54.h, // Fixed height for the ListView
                  child: ListView.separated(
                    itemCount: cubit.homeModel.data?.modules?.length??0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomBookingSectionSearch(
                        index: index, categoryModel: cubit.homeModel.data!.modules![index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 10.w);
                    },
                  ),
                ),
              ),
            //  CustomCategorySection(),
              //body ...
              if (cubit.selectedIndex == 0) ...[
                // Container()

                Expanded(
                    child:   state is LoadingHomeFilterDataState? CustomLoadingIndicator()    :
                    cubit.residenceFavouriteModel.data?.isEmpty??false?
                    Center(child:NoDataWidget(title: "no_data".tr()),):
                    ListView.builder(
                  itemCount: cubit.residenceFavouriteModel.data?.length??0,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    CustomLodgeContainer(
                      lodgesModel: cubit.residenceFavouriteModel.data?[index]??LodgeModel(),
                    ),
                  ),
                )
                ),
              ],
              // SizedBox(height: 30.h,)
              if (cubit.selectedIndex == 1) ...[
                Expanded(
                    child:   state is LoadingHomeFilterDataState? Center(child: CustomLoadingIndicator())    :cubit.transportationFavouriteModel.data?.isEmpty??false?
                    Center(child:NoDataWidget(title: "no_data".tr()),): ListView.builder(
                        itemCount: cubit.transportationFavouriteModel.data?.length??0,
                        itemBuilder: (context, index) => CustomCompanyContainer(companyModel: cubit.transportationFavouriteModel.data?[index]??CompanyModel(),))),
              ],
              if (cubit.selectedIndex == 2) ...[
                SizedBox(height: 20.h,),
                Expanded(
                  child:



                  state is LoadingHomeFilterDataState? Center(child: CustomLoadingIndicator())    :  cubit.getRestaurantModel?.data?.isEmpty??true?
                  Center(child: NoDataWidget(title: "no_data".tr()),):
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: cubit.getRestaurantModel?.data?.length??0, itemBuilder: (BuildContext context, int index) { return
                    BigContainerFood(
                      resturantData: cubit.getRestaurantModel?.data?[index] ?? ResturantData(),

                    ); }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 13.h,); },),
                ),
                // Container()
              ],
              if (cubit.selectedIndex == 3) ...[
                Expanded(
                  child:
                  state is LoadingHomeFilterDataState? Center(child: CustomLoadingIndicator())    :    cubit.getWaysModel.data?.isEmpty??false?
                  Center(child: NoDataWidget(title: "no_data".tr()),):
                  GridView.builder(gridDelegate: const
                  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1, crossAxisSpacing: 2, childAspectRatio: 0.8),itemBuilder: (context, index) {
                    return  EntertainmentWidget(waysData:cubit.getWaysModel.data![index] ,);
                  } ,itemCount: cubit.getWaysModel.data?.length??0,),
                ),
              ],
              if (cubit.selectedIndex == 4) ...[

                Expanded(
                  child:            state is LoadingHomeFilterDataState? Expanded(child: Center(child: CustomLoadingIndicator()))    :       cubit.othersModel.data?.isEmpty??true?Center(child: NoDataWidget(title: "no_data".tr()),):
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount:  cubit.othersModel.data?.length??0, itemBuilder: (BuildContext context, int index) { return
                    OtherServicesContainer(
                      categoryModel: OtherServicesModel(
                        title:cubit.othersModel.data?[index].title??'',
                        image: cubit.othersModel.data?[index].image??'',
                        onTap: () {
                          Navigator.pushNamed(context, Routes.subServicesRoute,arguments: cubit.othersModel.data?[index].id.toString());
                        },
                      ),
                    );
                      }, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 13.h,); },),
                ),
              ],
            ],
          ),
        ),
        10.h.verticalSpace
      ]);
    });
  }
}
