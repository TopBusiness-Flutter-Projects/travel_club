import 'package:flutter/cupertino.dart';


import '../../../../../../config/routes/app_routes.dart';

import '../widgets/big_container.dart';



//body
class AccommodationBookingBody extends StatelessWidget {
  AccommodationBookingBody({super.key});

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
          Navigator.pushNamed(context, Routes.detailsBooking);
        },
          child: CustomBookingAccommodationContainerBig());
    },),
);  }
}
