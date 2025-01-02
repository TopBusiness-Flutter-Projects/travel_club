import '../../../core/exports.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(builder: (BuildContext context, state) {
      return  CustomScreen(
          appbarTitle: AppTranslations.privacy,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getVerticalPadding(context) * 3,),
                  Text( AppTranslations.PrivacyAndSecurity,style: getSemiBoldStyle(fontSize: 24.sp),),
                  SizedBox(height: getVerticalPadding(context) * .5,),
              
              
                  Text("""خسائر اللازمة ومطالبة حدة بل. الآخر الحلفاء أن غزو, إجلاء 
وتنامت عدد مع. لقهر معركة لبلجيكا، بـ انه, ربع الأثنان المقيتة 
في, اقتصّت المحور حدة و. هذه ما طرفاً عالمية استسلام, 
الصين وتنامت حين ٣٠, ونتج والحزب المذابح كل جوي. أسر 
كارثة المشتّتون بل, وبعض وبداية الصفحة غزو قد, أي بحث 
تعداد الجنوب.""",style: getMediumStyle(fontSize: 14.sp,color: AppColors.grey),),
                  SizedBox(height: getVerticalPadding(context) * 1,),
                  Text(AppTranslations.cancellationPolicy,style: getSemiBoldStyle(fontSize: 24.sp),),
                  SizedBox(height: getVerticalPadding(context) * .5,),
              Text("وتنامت عدد مع. لقهر معركة لبلجيكا، ابح كل جوي. أسركارثة المشتّتون بل, وبعض وبداية الصفحة غزو قد, أي بحثتعداد الجن",
                style: getMediumStyle(fontSize: 14.sp, color: AppColors.grey),
              ),]
            ),
          )
      ));
    },);
  }
}
