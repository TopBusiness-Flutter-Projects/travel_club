import 'package:travel_club/core/widgets/network_image.dart';
import '../../../../core/exports.dart';
import '../../cubit/entertainment_cubit.dart';
import '../../data/model/get_ways_model.dart';

class EntertainmentWidget extends StatelessWidget {
  EntertainmentWidget({super.key, required this.waysData});
  WaysData waysData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(
      builder: (BuildContext context, state) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.compainiesEntertainment,
                arguments: waysData.id.toString(),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.r), // تأكد أن ClipRRect يحيط بكل شيء
              child: Container(
                height: 178.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.r), // تطبيق الحدود على الصورة أيضًا
                      child: CustomNetworkImage(
                        height: 178.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        image: waysData.image.toString(),
                      ),
                    ),

                    /// التدرج اللوني فوق الصورة
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r), // إضافة BorderRadius هنا أيضًا
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              waysData.name.toString(),
                              style: getSemiBoldStyle(
                                fontSize: 14.sp,
                                color: AppColors.white,
                              ),
                            ),
                            Image.asset(
                              ImageAssets.container,
                              width: 62.w,
                              height: 18.h,
                              color: AppColors.primary,
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

