import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/home/screens/widgets/search_container.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'widgets/custom_appbar.dart';
import 'widgets/custom_bag_section.dart';
import 'widgets/custom_category_section.dart';
import 'widgets/custom_offers_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeCubit>().getHomeData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return        cubit.homeModel.data==null?const Center(child: CircularProgressIndicator(),):
      RefreshIndicator(
        onRefresh: ()async{
          cubit.getHomeData();
        },
        child: Column(children: [
          SizedBox(height: getVerticalPadding(context) * 2),
           CustomHomeAppbar(isHome: true, title: 'Guest',),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomCategorySection(), // search bar
                  SizedBox(height: 10.h,),
                  //search container
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getHorizontalPadding(context) / 2),
                    child:
                    SearchContainer(onTap: (){
                      Navigator.pushNamed(context, Routes.searchScreen);
                    },)
                  ),
                  SizedBox(height: 10.h,),
                  if ((cubit.homeModel.data!.suitcases!.isEmpty ) &&
                      (cubit.homeModel.data!.offers!.isEmpty )) ...[
                        SizedBox(height: 30.h,),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(child: Image.asset(ImageAssets.noOffers,width: 150.w,)),
                            ],
                          ),
                        ),
                    SizedBox(height: 30.h,),

                    Text(AppTranslations.commingSoon.tr(),style: getBoldStyle(color: AppColors.primary,fontSize: 24.sp),)
                  ],

                  if (cubit.homeModel.data?.suitcases?.isNotEmpty ?? false)
                    const CustomOffersSection(),
                  SizedBox(height: getVerticalPadding(context)),
                  if (cubit.homeModel.data?.suitcases?.isNotEmpty ?? false)
                  const CustomBagSection(),
                  SizedBox(height: getHeightSize(context) * 0.13),
                ],
              ),
            ),
          ),
        ]),
      );
    });
  }
}
