import 'package:flutter/material.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/entertainment/cubit/entertainment_cubit.dart';

class ContactButtonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(builder: (BuildContext context, state) { return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenlynly,
          children: <Widget>[
            // Phone Button
            Flexible(
              child: SizedBox(
                width: 227.w,
                height: 46.h,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Handle WhatsApp Button Press
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.green, // Icon and Text color
                    minimumSize: Size(150, 50), // Button size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  icon: SvgPicture.asset(AppIcons.whatsapp),
                  label: Text(AppTranslations.contactWhatsApp),
                ),
              ),
            ),
            SizedBox(width: 20.w,),
            SizedBox(
              width: 124.w,
              height: 46.h,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle Phone Button Press
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue, // Icon and Text color
                  minimumSize: Size(150, 50), // Button size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                icon: SvgPicture.asset(AppIcons.call),
                label: Text(AppTranslations.calling),
              ),
            ),
            // WhatsApp Button

          ],
        ),
      ),
    ); },);
  }
}


