import 'package:travel_club/core/widgets/network_image.dart';

import '../../../../core/exports.dart';
import '../../cubit/account_cubit.dart';

class CustomContainerMyAccount extends StatelessWidget {
  const CustomContainerMyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    AccountCubit cubit = context.read<AccountCubit>();

    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: CustomContainerWithShadow(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CustomNetworkImage(
                      height: 60.w,
                      width: 60.w,
                      image: cubit.loginModel.data!.image ?? '',
                      isUser: true,
                    )),
              ),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cubit.loginModel.data!.name ?? "" , style: getMediumStyle(),),
                      Text(cubit.loginModel.data!.email ??
                          cubit.loginModel.data!.phone.toString(),style: getRegularStyle(
                        fontSize: 14.sp
                      ),),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
