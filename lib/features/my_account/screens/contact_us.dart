import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import '../../../core/exports.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(builder: (BuildContext context, state) {
      return  CustomScreen(
          appbarTitle: AppTranslations.contactUs,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: getVerticalPadding(context) * 1,),
                Image.asset(ImageAssets.email,width: 166.w,height: 132.h,),
                CustomTextField(title: AppTranslations.proplemTitle,hintText: AppTranslations.proplemTitle,),
                CustomTextField(title: AppTranslations.message,hintText: AppTranslations.message,isMessage: true,),
                SizedBox(height: getVerticalPadding(context) * 2,),
                CustomButton(title: AppTranslations.send),
              ],
            ),
          )
      );
    },);
  }
}
