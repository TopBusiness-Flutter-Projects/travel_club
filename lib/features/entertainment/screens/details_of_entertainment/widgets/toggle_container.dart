import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';

import '../../../cubit/entertainment_cubit.dart';

class ToggleButtonScreen extends StatefulWidget {
  @override
  _ToggleButtonScreenState createState() => _ToggleButtonScreenState();
}

class _ToggleButtonScreenState extends State<ToggleButtonScreen> {

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<EntertainmentCubit>();
 return BlocBuilder<EntertainmentCubit, EntertainmentState>(builder: (BuildContext context, state) {    return Center(
   child: Container(
     padding: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(30.0),
     ),
     child: Row(
       mainAxisSize: MainAxisSize.min,
       children: [
         // Service Button
         Expanded(
           child: TextButton(
             style: TextButton.styleFrom(
               foregroundColor:cubit. isServiceSelected ? Colors.white : Colors.blue, backgroundColor:cubit. isServiceSelected ? Colors.blue : Colors.white,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(30.0),
               ),
             ),
             onPressed: () {
               cubit.changeIndex(true);
             },
             child: Text(AppTranslations.about),
           ),
         ),
         SizedBox(width: 8),
         // Company Button
         Expanded(
           child: TextButton(
             style: TextButton.styleFrom(
               foregroundColor:!(cubit.isServiceSelected) ? Colors.white : Colors.blue, backgroundColor: !(cubit.isServiceSelected) ? Colors.blue : Colors.white,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(30.0),
               ),
             ),
             onPressed: () {
               cubit.changeIndex(false);
             },
             child: Text(AppTranslations.services),
           ),
         ),
       ],
     ),
   ),
 ); },);
  }
}

