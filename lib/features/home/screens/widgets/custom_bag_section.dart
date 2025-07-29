import 'package:flutter/cupertino.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/cases/screens/widgets/custom_container_widget.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';
import 'package:travel_club/features/home/cubit/home_state.dart';

import '../../data/models/home_model.dart';

class CustomBagSection extends StatelessWidget {
  const CustomBagSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit =context.read<HomeCubit>();
  return BlocBuilder<HomeCubit,HomeState>(builder: (BuildContext context, state) {   return Column(
    children: [
      Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getHorizontalPadding(context)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppTranslations.bestBags,
                style: getBoldStyle(fontSize: 16.sp)),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.casesScreenRoute);
              },
              child: Text(
                AppTranslations.more,
                style:
                getUnderLine(color: AppColors.primary, fontSize: 14.sp),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: getHeightSize(context) * 0.01,
      ),
      SizedBox(
          height: getHeightSize(context) * 0.3,
          child: ListView.builder(
            itemBuilder: (context, index) =>
                CustomBagContainer(
                  suitcase: cubit.homeModel.data?.suitcases?[index],
                  
                    isLast: index == 2),

            itemCount: cubit.homeModel.data?.suitcases?.length,

            scrollDirection: Axis.horizontal,
          ))
    ],
  ); },);
  }
}
