import '../../../../../core/exports.dart';

class StarsFilter {
  final String text;
    bool isChecked;


  StarsFilter(  {required this.text,required this.isChecked, });
}
class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({super.key, required  this.starsFilter});
  StarsFilter ?starsFilter;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  // Function(bool?) ?onChanged;
  @override
  Widget build( BuildContext context) {

    return CheckboxListTile(
      title: Text(widget.starsFilter!.text.toString(), textAlign: TextAlign.right,style: getMediumStyle(fontSize: 14.sp),maxLines: 1,),
      value: widget.starsFilter!.isChecked,
      onChanged: (value){
        setState(() {
          widget.starsFilter!.isChecked =value!;

        });
      },
      checkColor: AppColors.white,
      activeColor: AppColors.primary,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}