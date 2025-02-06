import 'package:flutter/cupertino.dart';
import 'package:travel_club/features/favourites/cubit/favourites_cubit.dart';
import 'package:travel_club/features/favourites/cubit/favourites_state.dart';

import '../exports.dart';

class CustomFavWidget extends StatefulWidget {
   CustomFavWidget({super.key,required this.isFav,required this.id});
  bool isFav;
 final String id;
  @override
  State<CustomFavWidget> createState() => _CustomFavWidgetState();
}

class _CustomFavWidgetState extends State<CustomFavWidget> {
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<FavouritesCubit>();
   return BlocConsumer<FavouritesCubit,FavouritesState>(
     builder: (BuildContext context, state) {
     return    GestureDetector(
       onTap: () {
         setState(() {
           widget.isFav = !(widget.isFav);
         });
      cubit.   addAndRemoveFav( id: widget.id.toString(), isFav: widget.isFav, context: context);
       },
       child: CircleAvatar(
         backgroundColor:
         widget.isFav
             ? AppColors.red
             : AppColors.lightWhite,
         child: Icon(
           CupertinoIcons.heart,
           color:  widget.isFav
               ? AppColors.white
               : AppColors.secondPrimary,
           size: 25.sp,
         ),
       ),
     );
   },
     listener: (BuildContext context, FavouritesState state) { if(state is ErrorReservationFavourite){
     setState(() {
       widget.isFav = !(widget.isFav);
     });
   } },);
  }
}
