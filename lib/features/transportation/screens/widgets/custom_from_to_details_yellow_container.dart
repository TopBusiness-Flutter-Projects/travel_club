
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';

class CustomFromToDetails extends StatelessWidget {
  const CustomFromToDetails({
    super.key,
    required this.cubit,
  });

  final TransportationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: AutoSizeText(
                    "Cairosss",
                    maxLines: 2,
                    style: getRegularStyle(fontSize: 14.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
                Flexible(
                  child: AutoSizeText(
                    "Alexandria",
                    maxLines: 2,
                    style: getRegularStyle(fontSize: 14.sp),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: AutoSizeText(
                    cubit.singleDate,
                    maxLines: 1,
                    style: getRegularStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                SvgPicture.asset(
                  AppIcons.calendar,
                  width: 25.w,
                  color: AppColors.secondPrimary,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
