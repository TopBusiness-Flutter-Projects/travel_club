import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';

class CustomFromToDetails extends StatelessWidget {
  const CustomFromToDetails({
    super.key,
    required this.fromDate,
    required this.from,
    required this.to,
    this.toDate,
  });

  final String fromDate;
  final String from;
  final String to;
  final String? toDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.yellow, borderRadius: BorderRadius.circular(20.r)),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Column(
        children: [
          CustomRow(from: from, to: to, date: fromDate),
          if (toDate != null) ...[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Divider(color: AppColors.white, thickness: 1.w),
            ),
            CustomRow(from: to, to: from, date: toDate!),
          ]
        ],
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.from,
    required this.to,
    required this.date,
  });

  final String from;
  final String to;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: AutoSizeText(
                from,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: getRegularStyle(fontSize: 14.sp),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
            Flexible(
              child: AutoSizeText(
                to,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: getRegularStyle(fontSize: 14.sp),
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 2.w),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            date,
            maxLines: 1,
            style: getRegularStyle(
              fontSize: 14.sp,
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
    ]);
  }
}
