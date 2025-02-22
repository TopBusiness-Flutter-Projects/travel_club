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
import '../../entertainment/screens/widgets/custom_container_companies.dart';
import '../../food/widgets/big_container_food.dart';
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
                      cubit.onChangeSearch(value, context);
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    child:cubit.residenceFavouriteModel.data?.isEmpty??false?
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
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) => CustomCompanyContainer(companyModel: cubit.transportationFavouriteModel.data?[index]??CompanyModel(),))),
              ],
              if (cubit.selectedIndex == 2) ...[
                //  FoodBookingBody()
                SizedBox(
                  height: 30.h,
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BigContainerFood(
                      index: 0,

                      isFavouriteScreen: false,
                    ),
                  ),
                ))

                // Container()
              ],
              if (cubit.selectedIndex == 3) ...[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.detailsEntertainment);
                            },
                            child: CustomContainerCompanies(
                              isDetails: true,
                              isFavouriteScreen: false,
                            )),
                      );
                    },
                    itemCount: 10,
                  ),
                )
              ],
            ],
          ),
        ),
        10.h.verticalSpace
      ]);
    });
  }
}
