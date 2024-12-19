import 'package:flutter/cupertino.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../config/routes/app_routes.dart';
import '../../accommodation_booking/widgets/big_container.dart';
import '../widgets/big_container_food.dart';




//body
class FoodBookingBody extends StatelessWidget {
  FoodBookingBody({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return    GestureDetector(
              onTap: (){

                Navigator.pushNamed(context, Routes.detailsBookingFood);
              },
              child: CustomBookingFoodContainerBig(foodModel: FoodModel(numofnights: "4 ليالي ",price:"5000",title:"nono",date: "13/12/2002",rate: 0,numOfBooking: "48721728" ,status: false),));
        },),
    );  }
}
