import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/home/cubit/home_cubit.dart';

class CheckInternetWidget extends StatefulWidget {
  const CheckInternetWidget({super.key, this.whenResumed, required this.child});
  final void Function()? whenResumed;
  final Widget child;
  @override
  State<CheckInternetWidget> createState() => _CheckInternetWidgetState();
}

class _CheckInternetWidgetState extends State<CheckInternetWidget> {
  ConnectivityResult _connectionStatus = ConnectivityResult.wifi;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
      widget.whenResumed;
    });

    //  context.read<HomeCubit>().getHomeData();
    //  context.read<AccountCubit>().getAccount(context);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return _connectionStatus == ConnectivityResult.none
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                // Icons.error,
                CupertinoIcons.wifi_slash,
                size: 180.h,
                color: AppColors.primary,
              ),
              20.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppTranslations.lostConnection,
                    style: getMediumStyle(
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
              10.h.verticalSpace,
              InkWell(
                onTap: () {
                  context.read<HomeCubit>().getHomeData();
                },
                child: Icon(
                  // Icons.error,
                  CupertinoIcons.refresh_thin,
                  size: 50.h,
                  color: AppColors.grey,
                ),
              ),
            ],
          )
        : widget.child;
  }
}

class CustomHomeErrorWidget extends StatelessWidget {
  const CustomHomeErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          // Icons.error,
          CupertinoIcons.wifi_exclamationmark,
          size: 180.h,
          color: AppColors.primary,
        ),
        20.h.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppTranslations.someThingWrong,
              style: getMediumStyle(
                color: AppColors.grey,
              ),
            ),
          ],
        ),
        10.h.verticalSpace,
        InkWell(
          onTap: () {
            context.read<HomeCubit>().getHomeData();
          },
          child: Icon(
            // Icons.error,
            CupertinoIcons.refresh_thin,
            size: 50.h,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
