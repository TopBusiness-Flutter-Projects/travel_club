import 'package:flutter/cupertino.dart';
import '../../../../core/exports.dart';
import '../../cubit/accomendation_cubit.dart';
import '../widgets/acommendation_widgets/accomendadation_container.dart';
import '../widgets/acommendation_widgets/accomendation_rating.dart';

class AccomendationScreen extends StatelessWidget {
  const AccomendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
 return BlocBuilder<AccomendationCubit, AccomendationState>(builder: (BuildContext context, state) {
   return CustomScreen (appbarTitle: AppTranslations.accommodation,
   body:  Padding(
     padding: const EdgeInsets.all(8.0),
     child: Column(
       // mainAxisSize: MainAxisSize.min,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Padding(
           padding: EdgeInsets.symmetric(vertical: 10.h),
           child: StaggeredGrid.count(
               crossAxisCount: 2,
               mainAxisSpacing: 0,
               crossAxisSpacing: 0,
               children: List.generate(
                   4,
                       (index) => AcommendationContainer(
                     categoryModel: AcommndationModel(
                       title: "فنادق",
                       image: AppIcons.others,
                       onTap: () {
                         Navigator.pushNamed(context, Routes.hotelsScreen);

                       },
                     ),
                   ))),
         ),
         Text(AppTranslations.mostPlaceRating,style: getMediumStyle(fontSize: 14.sp),),
      Expanded(
     child: ListView.separated(
     // physics: (),
     shrinkWrap: true,
     // scrollDirection: Axis.horizontal,
     itemCount: 6,
     separatorBuilder: (context, index) => SizedBox(
     width: 10.w,
     height: 1.h,
     ),
     itemBuilder: (context, index) => CustomWidgetRating(hotelsModel: HotelsModel(title: 'مراسي ريزورت العين السخنه البحر الاحمر', rate:4 , discription: '٢٠٠ فرد قام بتقيم الفندق', image:   "https://lotel.efaculty.tech/storage/cities/38461735112771.webp"),)
     ),
      ),
        // Expanded(child: AccomendationRating(hotelsModel: HotelsModel(title: 'مراسي ريزورت العين السخنه البحر الاحمر', rate:4 , discription: '٢٠٠ فرد قام بتقيم الفندق', image:   "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),))
       ],
     ),
   ),); }, );
  }
}
