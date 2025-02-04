import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';

import '../../../../../core/exports.dart';

class CustomTicketsWidget extends StatelessWidget {
  const CustomTicketsWidget(
      {super.key, this.isReturn = false, required this.isClickable, this.topPadding});
  final bool isReturn;
  final bool isClickable;
  final double? topPadding;
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
      builder: (BuildContext context, state) {
        return Padding(
          padding:  EdgeInsets.only(top: topPadding ?? 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                cubit.isGoOnly
                    ? AppTranslations.numberOfMembers
                    : isReturn
                        ? AppTranslations.numberOfMembersReturn
                        : AppTranslations.numberOfMembersGo,
                style: getMediumStyle(fontSize: 14.sp),
              ),
              if (isClickable) Spacer(),
              if (isClickable)
                GestureDetector(
                  onTap: () {
                    cubit.changeCounter(isPlus: true, isReturn: isReturn);
                  },
                  child: Container(
                    width: 35.w,
                    height: 35.w,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                  ),
                ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                  isReturn
                      ? cubit.returnCounter.toString()
                      : cubit.goCounter.toString(),
                  style: getRegularStyle(fontSize: 18.sp)),
              SizedBox(
                width: 10.w,
              ),
              if (isClickable)
                GestureDetector(
                  onTap: () {
                    cubit.changeCounter(isPlus: false, isReturn: isReturn);
                  },
                  child: Container(
                    width: 35.w,
                    height: 35.w,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(isReturn
                          ? cubit.returnCounter == 1
                              ? 0.5
                              : 1
                          : cubit.goCounter == 1
                              ? 0.5
                              : 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.remove,
                      color: AppColors.white,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
