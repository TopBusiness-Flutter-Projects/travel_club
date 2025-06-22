import 'package:travel_club/features/entertainment/cubit/entertainment_cubit.dart';

import '../../../../../core/exports.dart';
import '../../../data/model/get_orginization_details_model.dart';

class CustomServiceContainer extends StatefulWidget {
  const CustomServiceContainer({super.key, required this.wayServiceCategory});
  final WayServiceCategoryModel wayServiceCategory;

  @override
  State<CustomServiceContainer> createState() => _CustomServiceContainerState();
}

class _CustomServiceContainerState extends State<CustomServiceContainer> {
  bool isExpanded = false;
  final ExpansionTileController controller = ExpansionTileController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomContainerWithShadow(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  CustomExpandableWidget(
                    title: widget.wayServiceCategory.name ?? "",
                    isExpanded: isExpanded,
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: isExpanded
                        ? Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: Divider(
                                      color: AppColors.grey1,
                                    ),
                                  ),
                         
                              itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.wayServiceCategory.wayService?[index].name ?? ""
                                                    ,
                                                style: getSemiBoldStyle(
                                                  fontSize: 14.sp,
                                                  color: AppColors
                                                      .secondPrimary,
                                                ),
                                              ),
                                              10.h.verticalSpace,
                                              Text(
                                                 widget.wayServiceCategory.wayService?[index].price ??
                                                    " ${AppTranslations
                                                        .currency}",
                                                style: getSemiBoldStyle(
                                                  fontSize: 14.sp,
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context,
                                                  Routes
                                                      .bookTableEntermaint,
                                                  arguments:
                                                      widget.wayServiceCategory.wayService?[index]);
                                            },
                                            child: Text(
                                              AppTranslations.bookNow,
                                              style: getBoldStyle(
                                                  fontSize: 14.sp,
                                                  color: AppColors.primary),
                                            )),
                                      ],
                                    ),
                                  ),
                              itemCount: widget.wayServiceCategory.wayService?.length ?? 0,),
                        )
                        : Container(), // Empty container when collapsed
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomExpandableWidget extends StatelessWidget {
  const CustomExpandableWidget({
    super.key,
    required this.title,
    this.onTap,
    required this.isExpanded,
  });
  final String title;

  final void Function()? onTap;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white,
      highlightColor: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: getBoldStyle(fontSize: 14.sp)),
          AnimatedRotation(
            turns: isExpanded ? 0.5 : 0.0, // 0.5 turn for 180 degrees
            duration: const Duration(milliseconds: 250),
            child: Icon(Icons.expand_more_rounded,
                size: 35.h, color: AppColors.primary),
          )
        ],
      ),
    );
  }
}
