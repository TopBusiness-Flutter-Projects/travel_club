import 'package:share_plus/share_plus.dart';

import '../../../../../core/exports.dart';
import '../../../../../core/widgets/custom_fav_widget.dart';

class CustomDetailsAppBar extends StatelessWidget {
  const CustomDetailsAppBar(
      {super.key, this.onTap, this.sharedLink, this.isFav = false, this.id});
  final void Function()? onTap;
  final String? sharedLink;
  final String? id;
  final bool isFav;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomBackButton(
            onTap: onTap,
          ),
          Spacer(),
          Expanded(
              child: Text(
            AppTranslations.details,
            style: getMediumStyle(color: AppColors.white, fontSize: 16.sp),
          )),
          InkWell(
            onTap: () async {
              await Share.share(sharedLink ?? "");
            },
            child: Container(
                width: 44.w, // Adjust size as needed
                height: 44.h,
                decoration: BoxDecoration(
                  color: AppColors.lightWhite,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(
                      15), // Circular with rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    AppIcons.share,
                  ),
                )),
          ),
          SizedBox(
            width: 8.w,
          ),
          CustomFavWidget(
            isFav: isFav,
            id: id.toString(),
          )
        ],
      ),
    );
  }
}
