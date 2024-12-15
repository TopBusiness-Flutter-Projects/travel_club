import 'package:flutter/material.dart';
import 'package:travel_club/core/exports.dart';



// class HomePage extends StatelessWidget {
//   void _showFilterBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (BuildContext context) {
//         return FilterBottomSheet();
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("BottomSheet Example")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => _showFilterBottomSheet(context),
//           child: Text("Open Filter"),
//         ),
//       ),
//     );
//   }
// }

class FilterBottomSheet extends StatefulWidget {
  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  bool oneStar = true;
  bool twoStars = false;
  bool threeStars = false;
  bool fourStars = false;
  bool zeroStars = false;

  bool wifi = true;
  bool privateGarage = true;
  bool privatePool = false;
  bool privateBeach = false;
  bool coffeeShop = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Text(
            "فلتر النتائج",
            style: getSemiBoldStyle(fontSize: 20.sp),
          ),
          SizedBox(height: 30.h),
          Text(
            "تصنيف عدد النجوم",
            style:getSemiBoldStyle(fontSize: 14.sp),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              mainAxisSpacing: 10, // Vertical spacing
              crossAxisSpacing: 10, // Horizontal spacing
              childAspectRatio: 3, // Aspect ratio for each grid item (adjust for appearance)
            )  , itemBuilder: (BuildContext context, int index) {
              return buildCheckbox("نجمة واحدة", oneStar, (val) => setState(() => oneStar = val!));
            },),
          ),
          // buildCheckbox("نجمتان", twoStars, (val) => setState(() => twoStars = val!)),
          // buildCheckbox("3 نجوم", threeStars, (val) => setState(() => threeStars = val!)),
          // buildCheckbox("4 نجوم", fourStars, (val) => setState(() => fourStars = val!)),
          // buildCheckbox("0 نجوم", zeroStars, (val) => setState(() => zeroStars = val!)),

          SizedBox(height: 16.h),
          Text(
            "المرافق",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          buildCheckbox("واي فاي", wifi, (val) => setState(() => wifi = val!)),
          buildCheckbox("كراج خاص", privateGarage, (val) => setState(() => privateGarage = val!)),
          buildCheckbox("مسبح خاص", privatePool, (val) => setState(() => privatePool = val!)),
          buildCheckbox("شاطئ خاص", privateBeach, (val) => setState(() => privateBeach = val!)),
          buildCheckbox("كوفي شوب", coffeeShop, (val) => setState(() => coffeeShop = val!)),

          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              // Implement the action for filtering results
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
            ),
            child: Text(
              "تصفية النتائج",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                oneStar = true;
                twoStars = threeStars = fourStars = zeroStars = false;
                wifi = privateGarage = true;
                privatePool = privateBeach = coffeeShop = false;
              });
            },
            child: Text(
              "حذف الفلتر",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCheckbox(String title, bool value, Function(bool?) onChanged) {
    return CheckboxListTile(
      title: Text(title, textAlign: TextAlign.right),
      value: value,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
