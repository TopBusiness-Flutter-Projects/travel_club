import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/favourites/cubit/favourites_cubit.dart';
import 'package:travel_club/features/favourites/cubit/favourites_state.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/data/models/get_companies_model.dart';

import '../../../../core/widgets/custom_fav_widget.dart';
import '../../cubit/transportation_state.dart';

class CustomCompanyContainer extends StatefulWidget {
  const CustomCompanyContainer({
    super.key,
    required this.companyModel,
    this.isFavouriteScreen=false,
  });
  final CompanyModel companyModel;
  final bool  isFavouriteScreen;
  @override
  State<CustomCompanyContainer> createState() => _CustomCompanyContainerState();
}

class _CustomCompanyContainerState extends State<CustomCompanyContainer> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TransportationCubit>();
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (BuildContext context, state) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, Routes.transportationBookingDetailsRoute,
                    arguments: widget.companyModel
                );
              },
              child: CustomContainerWithShadow(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: CustomNetworkImage(
                            image: widget.companyModel.image ?? '',
                            // image: AppStrings.testImageUrl,
                            width: 80.w,
                            height: 80.w,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    widget.companyModel.name ?? '',
                                    maxLines: 1,
                                    style: getMediumStyle(fontSize: 13.sp),
                                  ),
                                   BlocBuilder<FavouritesCubit,FavouritesState>(builder: (BuildContext context, state) {
                                    return  CustomFavWidget(isFav: widget.companyModel.isFavorite, id: widget.companyModel.id.toString(),isFavScreen: widget.isFavouriteScreen,);
                                  },)
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    StarRating(
                                      rating: double.parse(
                                          (widget.companyModel.rate ?? 0)
                                              .toString()),
                                      allowHalfRating: true,
                                      size: 14.sp,
                                      emptyIcon: CupertinoIcons.star_fill,
                                      filledIcon: CupertinoIcons.star_fill,
                                    ),
                                    SizedBox(width: 8.w),
                                    Flexible(
                                      child: AutoSizeText(
                                        "${widget.companyModel.users}${AppTranslations.personRateCompany}",
                                        maxLines: 2,
                                        style: getMediumStyle(
                                            fontSize: 13.sp,
                                            color: AppColors.grey),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        )
                      ]))),
            )
        );
      },
    );
  }
}
