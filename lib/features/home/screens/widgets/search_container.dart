import 'package:flutter/material.dart';
import 'package:travel_club/core/exports.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0, // Adjust height as needed
      decoration: BoxDecoration(
        color: AppColors.lightWhite2, // Background color similar to the image
        borderRadius: BorderRadius.circular(25.0.r), // Rounded corners
      ),
      child: InkWell(
        hoverColor: Colors.black,
        onTap: () {
          Navigator.pushNamed(context, Routes.searchScreen);
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                AppTranslations.search,
                style: getRegularStyle(
                    color: AppColors.secondPrimary, fontSize: 14.sp),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: SvgPicture.asset(AppIcons.search)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
