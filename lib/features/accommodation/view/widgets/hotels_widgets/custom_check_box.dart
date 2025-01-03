import '../../../../../core/exports.dart';

class StarsFilter {
  final String text;
  bool isChecked;

  StarsFilter({required this.text, required this.isChecked});
}

class CustomCheckBox extends StatefulWidget {
  final StarsFilter starsFilter;

  const CustomCheckBox({super.key, required this.starsFilter});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start, // Align to the start of the row
      children: [
        SizedBox(
          width: 30.w,
          child: Checkbox(
            value: widget.starsFilter.isChecked,
            onChanged: (bool? newValue) {
              setState(() {
                widget.starsFilter.isChecked = newValue!;
              });
            },
            shape: RoundedRectangleBorder(              borderRadius:
            BorderRadius.circular(5.r),           ),
            side: BorderSide(color: AppColors.secondPrimary.withOpacity(.5), width: 1.w),
            checkColor: AppColors.white,
            // Color of the tick
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return AppColors.primary; // Primary color when checkbox is selected
              } else {
                return AppColors.white.withOpacity(0.6); // Less opacity when not selected
              }
            }),
          ),
        ),
        Text(
          widget.starsFilter.text,
          style: getMediumStyle(fontSize: 14.sp),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
