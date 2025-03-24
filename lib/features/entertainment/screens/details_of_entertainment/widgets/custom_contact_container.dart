import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/entertainment/cubit/entertainment_cubit.dart';

class ContactButtonsScreen extends StatelessWidget {
  final String phoneNumberForCall ; // رقم الهاتف الذي سيتم استخدامه
  final String phoneNumberForWhatsApp ;

  const ContactButtonsScreen({super.key, required this.phoneNumberForCall, required this.phoneNumberForWhatsApp}); // رقم الهاتف الذي سيتم استخدامه

  // فتح محادثة WhatsApp
  void _launchWhatsApp() async {
    final url = "https://wa.me/$phoneNumberForWhatsApp";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      debugPrint("⚠️ لا يمكن فتح WhatsApp");
    }
  }

  // إجراء مكالمة هاتفية
  void _launchPhoneCall() async {
    final url = "tel:$phoneNumberForCall";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      debugPrint("⚠️ لا يمكن إجراء مكالمة هاتفية");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(
      builder: (BuildContext context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // زر واتساب
                Flexible(
                  child: SizedBox(
                    width: 227.w,
                    height: 46.h,
                    child: ElevatedButton.icon(
                      onPressed: _launchWhatsApp,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      icon: SvgPicture.asset(AppIcons.whatsapp),
                      label: Text(AppTranslations.contactWhatsApp),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                // زر الاتصال
                SizedBox(
                  width: 124.w,
                  height: 46.h,
                  child: ElevatedButton.icon(
                    onPressed: phoneNumberForCall=="null"?null:_launchPhoneCall,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    icon: SvgPicture.asset(AppIcons.call),
                    label: Text(AppTranslations.calling),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
