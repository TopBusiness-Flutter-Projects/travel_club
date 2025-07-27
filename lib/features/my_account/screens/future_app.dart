import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/my_account/cubit/account_cubit.dart';
import 'package:travel_club/features/my_account/cubit/account_state.dart';
import 'package:url_launcher/url_launcher.dart';

class FutureApp extends StatefulWidget {
  const FutureApp({super.key});

  @override
  State<FutureApp> createState() => _FutureAppState();
}

class _FutureAppState extends State<FutureApp> {
  @override
  void initState() {
    context.read<AccountCubit>().getSetting(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("future_app".tr()),
        centerTitle: true,
      ),
      body: BlocBuilder<AccountCubit, AccountState>(builder: (context, state) {
        var cubit = context.read<AccountCubit>();
        final apps = cubit.getSettingModel.data?.apps ?? [];

        return Column(
          children: [
            SizedBox(height: 10.h),
            Expanded(
              child: (apps.isEmpty)
                  ? const Center(child: CustomLoadingIndicator())
                  : ListView.builder(
                itemCount: apps.length,
                itemBuilder: (context, index) {
                  final app = apps[index];
                  final url = Platform.isAndroid
                      ? app.androidUrl
                      : app.iosUrl;

                  return InkWell(
                    onTap: () async {
                      if (url != null && await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                      } else {
                        print("لا يمكن فتح الرابط");
                      }
                    },
                    child: FutureAppCard(
                      nameApp: app.name ?? "",
                      image: app.icon ?? "",
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}

class FutureAppCard extends StatelessWidget {
  final String nameApp;
  final String image;

  const FutureAppCard({
    super.key,
    required this.nameApp,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              image,
              width: 60.w,
              height: 60.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image, size: 40),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              nameApp,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: AppColors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
