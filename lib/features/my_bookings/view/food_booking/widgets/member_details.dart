import '../../../../../core/exports.dart';

class MemberDetails extends StatelessWidget {
  const MemberDetails({super.key});

  @override
  Widget build(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomContainerWithShadow(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Text(AppTranslations.numberOfMembers,style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                  SizedBox(height: 5.h,),
                  Text("٤ "+AppTranslations.members,style: getMediumStyle(fontSize: 14.sp),),
                  SizedBox(height: 30.h,),
                  Text(AppTranslations.callPhone,style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                  SizedBox(height: 5.h,),

                  Text("01292879872 ",style: getMediumStyle(fontSize: 14.sp),),
                  SizedBox(height: 10.h,)

                ],),
                Column(children: [
                  Text(AppTranslations.bookAppointment,style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                  SizedBox(height: 5.h,),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.calendar,color: AppColors.primary,),
                      Text("٢٠ يناير ٢٠٢٢",style: getMediumStyle(fontSize: 14.sp,color: AppColors.primary),),
                    ],
                  ),
                  SizedBox(height: 30.h,),
                  Text(AppTranslations.nameOwner,style: getRegularStyle(fontSize: 14.sp,color: AppColors.grey),),
                  SizedBox(height: 5.h,),

                  Text("احمد مختار علي",style: getMediumStyle(fontSize: 14.sp),),
                  SizedBox(height: 10.h,)
                ],)],),
          )),
    );
  }
}
