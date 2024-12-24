import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../../../core/exports.dart';
import '../cubit/food_cubit.dart';
import '../widgets/big_container_food.dart';
import '../widgets/small_container_food.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit= context.read<FoodCubit>();
  return BlocBuilder<FoodCubit,FoodState>(builder: (BuildContext context, state) {
    return CustomScreen(appbarTitle: AppTranslations.food,body:
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height:getVerticalPadding(context)*1,),
        HomeScreen(),
        if(cubit.selectedIndex==0)...[
          SizedBox(height: 20.h,),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 5, itemBuilder: (BuildContext context, int index) { return
              BigContainerFood(); }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 13.h,); },),
          ),
          SizedBox(height: 10.h,)
        ]
      else if(cubit.selectedIndex==1)...[
          SizedBox(height: 20.h,),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 5, itemBuilder: (BuildContext context, int index) { return
              BigContainerFood(); }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 13.h,); },),
          ),
          SizedBox(height: 10.h,)
        ]else...[
          SizedBox(height: 20.h,),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 5, itemBuilder: (BuildContext context, int index) { return
              GestureDetector(
                onTap: (){
                  print("nono");
                  Navigator.pushNamed(context, Routes.detailsFoodRoute);
                },
                  child: BigContainerFood(index:index)); }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 13.h,); },),
          ),
          SizedBox(height: 10.h,)
        ]
      ],
        ),
    ) ,);
    },);
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var cubit= context.read<FoodCubit>();
   return BlocBuilder<FoodCubit,FoodState>(builder: (BuildContext context, state) {  return Center(
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         MenuButton(
           title: AppTranslations.fishes,
           isSelected: cubit.selectedIndex == 0,
           onTap: (){
             cubit.changeIndex(0);
           },
         ),
         MenuButton(
           title: AppTranslations.grilled,
           isSelected: cubit.selectedIndex == 1,
           onTap: (){
             cubit.changeIndex(1);
           },
         ),
         MenuButton(
           title: AppTranslations.allRestaurants,
           isSelected: cubit.selectedIndex == 2,
           onTap: () {
             cubit.changeIndex(2);
           },
         ),
       ],
     ),
   ); },);
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
       borderRadius: BorderRadius.circular(20),
         boxShadow:
          [
         BoxShadow(
           color: Colors.grey.withOpacity(0.1),
           spreadRadius: 5,
           blurRadius: 7,
           offset: const Offset(0, 3), // Shadow position
         ),
         ]
    //   border: Border.all(color: Colors.blue),
     ),
     child: Text(
       title,
       style: TextStyle(
         color: isSelected ? Colors.white : Colors.blue,
         fontSize: 16,
       ),
     ),
   ),
 );
   },);
  }
}
