import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/features/entertainment/cubit/entertainment_cubit.dart';

import '../../../../../core/exports.dart';
import '../../../data/model/get_orginization_details_model.dart';

class CustomServiceContainer extends StatefulWidget {
  const CustomServiceContainer({super.key, required this.wayService});
  final WayService wayService;

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
                    title: ' العاب',
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
                        ? Column(children: [
                            Padding(
                              padding: const EdgeInsets.only(top : 10.0),
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                                    child: Divider(
                                          color: AppColors.grey1,
                                        ),
                                  ),
                                  // const Divider(),
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric( horizontal:  20.0),
                                    child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment: CrossAxisAlignment.start  ,
                                                children: [
                                                  Text(
                                                    widget.wayService.name.toString() ,
                                                    style: getSemiBoldStyle(
                                                      fontSize: 14.sp,
                                                      color: AppColors.secondPrimary,
                                                    ),
                                                  ),
                                                  10.h.verticalSpace,
                                                  Text(
                                                    widget.wayService.price
                                                            .toString() +
                                                        " " +
                                                        AppTranslations.currency,
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
                                                  Navigator.pushNamed(context,
                                                      Routes.bookTableEntermaint,
                                                      arguments: widget.wayService);
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
                                  itemCount: 4),
                            ),
                          ])
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
