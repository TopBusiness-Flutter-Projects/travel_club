import 'package:card_swiper/card_swiper.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/accomendation_cubit.dart';

class CustomSwiper extends StatelessWidget {
  const CustomSwiper({super.key, this.height});
final double? height;
  @override
  Widget build(BuildContext context) {
   return BlocBuilder<AccomendationCubit, AccomendationState>(builder: (BuildContext context, state) {
     var cubit=context.read<AccomendationCubit>();

     return   Positioned(
     child: SizedBox(
       height:height?? getHeightSize(context) * 0.65,
       width: getWidthSize(context),
       child: Swiper(
         // controller: ,
         onIndexChanged: (index) {
         //  => cubit.currentIndex = index
       cubit.changeIndex(index);
         },
         itemCount:             cubit.lodgesDetailsModel.data?.media?.length??0 ,
         itemBuilder: (BuildContext context, int index) {
           return Container(
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
             cubit.lodgesDetailsModel.data?.media?[index].image??"",
                 fit: BoxFit.cover,
               ),
             ),
           );
         },
         layout: SwiperLayout.DEFAULT,
         autoplay: true,
         pagination: SwiperPagination(
           builder: DotSwiperPaginationBuilder(
             activeColor: Colors.white,
             color: Colors.white.withOpacity(.4),
           ),
         ),
         itemWidth: MediaQuery.of(context).size.width * 0.8,
         itemHeight: 200.0,
       ),
     ),
   ); },);
  }
}
