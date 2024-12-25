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
                MenuButton(
                  title: "قائمة الطعام",
                  isSelected: cubit.selectedIndexMenue == 0,
                  onTap: () {
                    cubit.changeIndexMenue(0);
                  },
                ),
                MenuButton(
                  title: "عن المطعم",
                  isSelected: cubit.selectedIndexMenue == 1,
                  onTap: () {
   cubit.changeIndexMenue(1);}
                ),
                MenuButton(
                  title: "التقييم",
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
