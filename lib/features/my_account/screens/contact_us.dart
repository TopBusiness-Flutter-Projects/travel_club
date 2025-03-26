import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/widgets/custom_button.dart';
import 'package:travel_club/core/widgets/custom_text_form_field.dart';
import 'package:travel_club/features/home/cubit/home_state.dart';
import '../../../core/exports.dart';
import '../../../core/widgets/dropdown_button_form_field.dart';
import '../../home/cubit/home_cubit.dart';
import '../../home/data/models/home_model.dart';
import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<HomeCubit>().getHomeData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<AccountCubit>();
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
            appbarTitle: AppTranslations.contactUs,
            body: Form(
              key:cubit.formKey ,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getVerticalPadding(context) * 1,
                    ),
                    Center(
                      child: Image.asset(
                        ImageAssets.email,
                        width: 166.w,
                        height: 132.h,
                      ),
                    ),
                    SizedBox(
                      height: getVerticalPadding(context) * 1,
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Text(
                        "اختر ".tr(),
                        style: getMediumStyle(
                            color: AppColors.secondPrimary, fontSize: 14.sp),
                      ),
                    ),
                    SizedBox(
                      height: getVerticalPadding(context) * .5,
                    ),
                    context.read<HomeCubit>().homeModel.data==null?CustomLoadingIndicator():
                    BlocBuilder<HomeCubit, HomeState>(
                      builder: (BuildContext context, state) {
                        var cubit = context.read<HomeCubit>();

                        return CustomDropdownButtonFormField(
                          value: cubit.homeModel.data?.modules?.isNotEmpty == true
                              ? cubit.homeModel.data?.modules?.firstWhere(
                                (module) => module.id == cubit.selectedModulee?.id,
                            orElse: () =>  cubit.selectedModulee?? cubit.homeModel.data!.modules!.first, // تأمين عدم حدوث خطأ
                          )
                              : null, // إذا لم يكن هناك بيانات، القيمة تظل null
                          hint: "اختر الموديول",
                          items: cubit.homeModel.data?.modules?.map((ModuleModel module) {
                            return DropdownMenuItem<ModuleModel>(
                              value: module,
                              child: Text(module.name ?? ""),
                            );
                          }).toList() ?? [],
                          onChanged: (newModule) {
                            cubit.selectModule(newModule);
                          },
                        );
                      },
                    ),

                SizedBox(
                      height: getVerticalPadding(context) * 1,
                    ),

                    CustomTextField(
                      controller: cubit.subjectController,
                      title: AppTranslations.proplemTitle,
                      hintText: AppTranslations.proplemTitle,
                    ),

                    CustomTextField(
                      controller: cubit.messageController,
                      title: AppTranslations.message,
                      hintText: AppTranslations.message,
                      isMessage: true,
                    ),
                    context.read<HomeCubit>().homeModel.data==null?CustomLoadingIndicator():

            SizedBox(
                      height: getVerticalPadding(context) * 2,
                    ),
                    CustomButton(title: AppTranslations.send, onTap: (){
                      cubit.contactUs(context);
                    }),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
