import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';

import '../../../../../core/exports.dart';
import '../widgets/custom_service_container.dart';

class BookTableEntermaint extends StatelessWidget {
  const BookTableEntermaint({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(appbarTitle: AppTranslations.bookTable,body:
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
          CustomServiceContainer(),
              SizedBox(height: getHeightSize(context)*.05),
        
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppTranslations.selectBookingDate,style: getMediumStyle(fontSize: 14.sp),),
              ),
              CustomTextField(suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AppIcons.calendar),
              ),hintText: "16 يناير 2022",)  ,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppTranslations.theNumber,style: getMediumStyle(fontSize: 14.sp),),
              ),
              CustomTextField(hintText: "5",),
              //name of owner
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppTranslations.nameOwner,style: getMediumStyle(fontSize: 14.sp),),
              ),
              CustomTextField(hintText: "احمد مختار على",), Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppTranslations.numberOfPhoneContact,style: getMediumStyle(fontSize: 14.sp),),
              ),
              CustomTextField(hintText: "01000000000",),
              CustomButton(title: AppTranslations.bookTable)
        
        ]),
      ),
    ));
  }
}
