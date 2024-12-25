import 'package:flutter/material.dart';
import 'package:travel_club/core/exports.dart';



class SubToggleButtonsFood extends StatefulWidget {
  @override
  _SubToggleButtonsFoodState createState() => _SubToggleButtonsFoodState();
}

class _SubToggleButtonsFoodState extends State<SubToggleButtonsFood> {
  int selectedIndex = 0; // Default selected index is the first button

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MenuButton(
                title: " الوجبات",
                isSelected: selectedIndex == 0,
                onTap: () => setState(() => selectedIndex = 0),
              ),
              MenuButton(
                title: "السلطات",
                isSelected: selectedIndex == 1,
                onTap: () => setState(() => selectedIndex = 1),
              ),
              MenuButton(
                title: "المقبلات",
                isSelected: selectedIndex == 2,
                onTap: () => setState(() => selectedIndex = 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  MenuButton({required this.title, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
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
    );
  }
}
