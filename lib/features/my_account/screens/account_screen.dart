// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/preferences/preferences.dart';
import 'package:travel_club/core/utils/restart_app_class.dart';
import 'package:travel_club/features/main_screen/cubit/cubit.dart';
import 'package:travel_club/features/main_screen/cubit/state.dart';

import '../cubit/account_cubit.dart';
import '../cubit/account_state.dart';
import 'account_body.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AccountCubit cubit = context.read<AccountCubit>();
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return SizedBox(
          height: getHeightSize(context),
          width: getWidthSize(context),
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  child: Image.asset(
                    ImageAssets.mask,
                    fit: BoxFit.cover,
                    height: getHeightSize(context) * 0.3,
                    width: getWidthSize(context),
                  )),
              SizedBox(
                  height: getHeightSize(context),
                  width: getWidthSize(context),
                  child: const Accountbody())
            ],
          ),
        );
      },
    );
  }
}