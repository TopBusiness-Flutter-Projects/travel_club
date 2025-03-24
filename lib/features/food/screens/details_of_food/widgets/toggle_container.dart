import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:travel_club/core/exports.dart';

import '../../../cubit/food_cubit.dart';



class ToggleButtonsFood extends StatefulWidget {
  @override
  _ToggleButtonsFoodState createState() => _ToggleButtonsFoodState();
}

class _ToggleButtonsFoodState extends State<ToggleButtonsFood> {

  @override
  Widget build(BuildContext context) {
    var cubit= context.read<FoodCubit>();
 return BlocBuilder<FoodCubit,FoodState>(builder: (BuildContext context, state) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomContainerWithShadow(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               if( cubit.getRestaurantDetailsModel?.data?.hasMenu==1)...[
                 MenuButton(
                   title: "menu_food".tr(),
                   isSelected: cubit.selectedIndexMenue == 0,
                   onTap: () {
                     cubit.changeIndexMenue(0);
                   },
                 ),
               ],

                MenuButton(
                  title: "about_restaurant".tr(),
                  isSelected: cubit.selectedIndexMenue == 1,
                  onTap: () {
   cubit.changeIndexMenue(1);}
                ),
                MenuButton(
                  title: "evaluation".tr(),
                  isSelected: cubit.selectedIndexMenue == 2,
                  onTap: (){cubit.changeIndexMenue(2);},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  });
  }
}

class MenuButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  MenuButton({required this.title, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<FoodCubit,FoodState>(builder: (BuildContext context, state) {
     return GestureDetector(
     onTap: onTap,
     child: Container(

       padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
       decoration: BoxDecoration(

         color: isSelected ? Colors.blue : Colors.white,
         borderRadius: BorderRadius.circular(30),
         // border: Border.all(color: Colors.blue),
       ),
       child: Text(
         title,
         style: TextStyle(
           color: isSelected ? Colors.white : Colors.blue,
           fontSize: 16,
         ),
       ),
     ),
   ); },);
  }
}
