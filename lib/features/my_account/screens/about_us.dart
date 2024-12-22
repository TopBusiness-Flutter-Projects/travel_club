

import '../../../core/exports.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(builder: (BuildContext context, state) {
      return  CustomScreen(
          appbarTitle: AppTranslations.aboutUs,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: getVerticalPadding(context) * 1,),
                //imag
                Center(
                  child: Image.asset(
                    ImageAssets.about,
                    height: 140.h,
                     width:100.w,
                  ),
                ),
                SizedBox(height: getVerticalPadding(context) * 1.5,),

                Text(AppTranslations.whoUs,style: getSemiBoldStyle(fontSize: 24.sp),),
                SizedBox(height: getVerticalPadding(context) * .5,),
                Text("""خسائر اللازمة ومطالبة حدة بل. الآخر الحلفاء أن غزو, إجلاء 
وتنامت عدد مع. لقهر معركة لبلجيكا، بـ انه, ربع الأثنان المقيتة 
في, اقتصّت المحور حدة و. هذه ما طرفاً عالمية استسلام, 
الصين وتنامت حين ٣٠, ونتج والحزب المذابح كل جوي. أسر 
كارثة المشتّتون بل, وبعض وبداية الصفحة غزو قد, أي بحث 
تعداد الجنوب.""",style: getMediumStyle(fontSize: 14.sp,color: AppColors.grey),),     SizedBox(height: getVerticalPadding(context) * 1,),

                Text(AppTranslations.whoUsOffer,style: getSemiBoldStyle(fontSize: 24.sp),),
                SizedBox(height: getVerticalPadding(context) * .5,),
                Text("""خسائر اللازمة ومطالبة حدة بل. الآخر الحلفاء أن غزو, إجلاء 
وتنامت عدد مع. لقهر معركة لبلجيكا، بـ انه, ربع الأثنان المقيتة 
في, اقتصّت المحور حدة و. هذه ما طرفاً عالمية استسلام, 
الصين وتنامت حين ٣٠, ونتج والحزب المذابح كل جوي. أسر 
كارثة المشتّتون بل, وبعض وبداية الصفحة غزو قد, أي بحث 
تعداد الجنوب.""",style: getMediumStyle(fontSize: 14.sp,color: AppColors.grey),),

              ],
            ),
          )
      );
    },);
  }
}
