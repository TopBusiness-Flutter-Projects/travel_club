import 'package:flutter/material.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/food/cubit/food_cubit.dart';
import 'package:travel_club/features/food/data/models/get_catogrey_model.dart';
import 'package:travel_club/features/food/screens/details_of_food/widgets/toggle_container.dart';

class SubToggleButtonsFood extends StatefulWidget {
  @override
  _SubToggleButtonsFoodState createState() => _SubToggleButtonsFoodState();
}

class _SubToggleButtonsFoodState extends State<SubToggleButtonsFood> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FoodCubit>();
    return BlocBuilder<FoodCubit, FoodState>(
        builder: (BuildContext context, state) {
      return SizedBox(
        height: 50.h,
        child:
            // state is LoadingGetFood?Center(child: CustomLoadingIndicator(),):
            ListView.builder(
                itemCount: cubit.categoryMenuModel.data?.length ?? 0,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: MenuButton(
                      title: cubit.categoryMenuModel.data?[index].name
                              ?.toString() ??
                          "",
                      isSelected: cubit.selectedMenuCat?.id ==
                          cubit.categoryMenuModel.data?[index].id,
                      onTap: () {
                        cubit.changeMenuCat(
                            cubit.categoryMenuModel.data?[index] ??
                                CatogreyDataFood());
                      },
                    ),
                  );
                }),
      );
    });
  }
}

// class MenuButton extends StatelessWidget {
//   final String title;
//   final bool isSelected;
//   final VoidCallback onTap;

//   MenuButton(
//       {required this.title, required this.isSelected, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.blue : Colors.white,
//           borderRadius: BorderRadius.circular(30),
//           // border: Border.all(color: Colors.blue),
//         ),
//         child: Text(
//           title,
//           style: TextStyle(
//             color: isSelected ? Colors.white : Colors.blue,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }
// }
