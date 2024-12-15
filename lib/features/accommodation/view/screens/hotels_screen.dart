import '../../../../core/exports.dart';
import '../../cubit/accomendation_cubit.dart';
import '../widgets/acommendation_widgets/accomendation_rating.dart';
import '../widgets/hotels_widgets/custom_filter.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<AccomendationCubit, AccomendationState>(builder: (BuildContext context, state) {  return CustomScreen (appbarTitle:"الفنادق ",
     body:  SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               CustomFilterBar(),
               SizedBox(height: 20.h,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                 child: Text("قائمة الفنادق",style: getMediumStyle(fontSize: 14.sp),),
               ),
               AccomendationRating(hotelsModel: HotelsModel(title: 'مراسي ريزورت العين السخنه البحر الاحمر', rate:4 , discription: '٢٠٠ فرد قام بتقيم الفندق', image:   "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",onTap: (){
                 Navigator.pushNamed(context, Routes.detailsAccomendation);
               }),)
             ],
           ),
         )),); },);
  }
}
