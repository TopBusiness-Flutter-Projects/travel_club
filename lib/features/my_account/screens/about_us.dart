

import 'package:flutter_html/flutter_html.dart';

import '../../../core/exports.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();

}

class _AboutUsState extends State<AboutUs> {

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<AccountCubit>();
    return BlocBuilder<AccountCubit, AccountState>(builder: (BuildContext context, state) {
      return
        CustomScreen(
          appbarTitle: AppTranslations.aboutUs,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: getVerticalPadding(context) * 1,),
                  //imag
                  if (state is GetSettingError )...[
                    Center(child: Text(state.error.toString()))

                  ]
                  //  Text("Error In Server please try again in another time")
                  else if (state is GetSettingLoading || cubit.getSettingModel.data == null)...[
                    SizedBox(
                      height: getHeightSize(context)/2,
                        child: Center(child: CustomLoadingIndicator()))

                  ]

                  else...[
                      Center(
                        child: Image.asset(
                          ImageAssets.about,
                          height: 140.h,
                          width:100.w,
                        ),
                      ),
                      SizedBox(height: getVerticalPadding(context) * 1.5,),

                      //  Text(AppTranslations.whoUs,style: getSemiBoldStyle(fontSize: 24.sp),),
                      SizedBox(height: getVerticalPadding(context) * .5,),


                      Html(
                        data:cubit.getSettingModel.data?.aboutUs?.toString()??"" ,
                      ),
                    ],

             //    Text(cubit.getSettingModel.data?.aboutUs?.toString()??"",
                  //    style: getMediumStyle(fontSize: 14.sp,color: AppColors.grey),),     SizedBox(height: getVerticalPadding(context) * 1,),
              SizedBox(height: 10.h,)
              //                 Text(AppTranslations.whoUsOffer,style: getSemiBoldStyle(fontSize: 24.sp),),
              //                 SizedBox(height: getVerticalPadding(context) * .5,),
              //                 Text("""خسائر اللازمة ومطالبة حدة بل. الآخر الحلفاء أن غزو, إجلاء
              // وتنامت عدد مع. لقهر معركة لبلجيكا، بـ انه, ربع الأثنان المقيتة
              // في, اقتصّت المحور حدة و. هذه ما طرفاً عالمية استسلام,
              // الصين وتنامت حين ٣٠, ونتج والحزب المذابح كل جوي. أسر
              // كارثة المشتّتون بل, وبعض وبداية الصفحة غزو قد, أي بحث
              // تعداد الجنوب.""",style: getMediumStyle(fontSize: 14.sp,color: AppColors.grey),),
              
                ],
              ),
            ),
          )
      );
    },);
  }
}
