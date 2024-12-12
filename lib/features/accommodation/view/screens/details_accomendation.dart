import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../../../core/exports.dart';
import '../widgets/custom_row.dart';

class DetailsAccomendation extends StatelessWidget {
  const DetailsAccomendation({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'https://via.placeholder.com/600x400', // Replace with your image URLs
      'https://via.placeholder.com/600x400',
      'https://via.placeholder.com/600x400',
    ];
    return  SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: getHeightSize(context),
          width: getWidthSize(context),
          child: Stack(
            alignment: Alignment.topCenter,

            children: [
              Stack(
                children: [
                Positioned(
                  child: SizedBox(
                    height: getHeightSize(context) * 0.65,
                    width: getWidthSize(context),
                    child: Swiper(
                    itemCount: imageUrls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                    //    margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 5,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            imageUrls[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    layout: SwiperLayout.DEFAULT, // You can change to STACK, TINDER, etc.
                    autoplay: true, // Enable auto scrolling
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeColor: Colors.white,
                        color: Colors.white.withOpacity(.4),
                      ),
                    ), // Dots indicator
                   // control: SwiperControl(), // Arrows for navigation
                    itemWidth: MediaQuery.of(context).size.width * 0.8,
                    itemHeight: 200.0, // Height of the card
                              ),
                  ),
                ),

                  CustomRow(),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: getHeightSize(context) * 0.55,
                  width: getWidthSize(context),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.r),
                      topRight: Radius.circular(18.r),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("نبذة عن الفندق",style: getMediumStyle(color: AppColors.secondPrimary,fontSize: 14.sp),),
                          Text(   """خسائر اللازمة ومطالبة حدة بل. الآخر الحلفاء أن غزو, إجلاء 
                          وتنامت عدد مع. لقهر معركة لبلجيكا، بـ انه, ربع الأثنان المقيتة
                          في, اقتصّت المحور حدة و. هذه ما طرفاً عالمية استسلام,
                          الصين وتنامت حين ٣٠, ونتج والحزب المذابح كل جوي. أسر
                          كارثة المشتّتون بل, وبعض وبداية الصفحة غزو قد, أي بحث
                          تعداد الجنوب.""",                          style: getMediumStyle(fontSize: 14.sp,color: AppColors.grey),
                          ),
                          SizedBox(height: 10.h,),
                          Text("ما يقدمه الفندق",style: getMediumStyle(color: AppColors.secondPrimary,fontSize: 14.sp),),
                          SizedBox(height: 10.h,),

                          SizedBox(
                        height: 80,
                        child: ListView.builder(
                          itemCount: 20,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              SvgPicture.asset(AppIcons.profile),
                              SizedBox(height: 10.h,),

                              Text("حمام سباحة",style: getMediumStyle(fontSize: 12.sp),)
                            ],);
                        },),
                      ),
                          Text("الموقع علي الخريطة",style: getMediumStyle(fontSize: 12.sp),),
                          SizedBox(height: 10.h,),

                          Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.red,
                          borderRadius: BorderRadius.all(
                             Radius.circular(30.r),
                          ),
                        ),
                        child: Image.asset(ImageAssets.map,width: double.infinity,fit:BoxFit.cover,),
                      )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
