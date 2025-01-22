import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../cubit/payment_cubit.dart';
import '../cubit/payment_state.dart';

class PaymentWebViewScreen extends StatefulWidget {
  const PaymentWebViewScreen({super.key, this.url, required this.reservationid});
  final String? url;
  final int reservationid;
  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late final WebViewController _controller;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            // Navigator.pop(context);
          },
          onWebResourceError: (WebResourceError error) {},
          onUrlChange: (v) {
            print(" url " + v.url.toString());
            if (v.url.toString().toLowerCase() ==
                'https://accept.paymob.com/unifiedcheckout/payment-status') {
              Navigator.pop(context);
             
              context.read<PaymentCubit>().checkPaymentStatus(context, reservationId: widget.reservationid);

              // if (v.url
              //     .toString()
              //     .toLowerCase()
              //     .contains('api/payment-success')) {
              // if (v.url.toString().toLowerCase().contains('api/payment/callback')) {
              // Navigator.pop(context);
              // Navigator.pop(context);
              // context.read<PaymentCubit>().checkPayment(v.url!);

              // print(v);
              // Navigator.pop(context);
              // Navigator.pop(context);

              // print("000000");

              // Uri uri = Uri.parse(v.url!);

              // String successValue = uri.queryParameters['success'] ?? '';
              // if (successValue.toString() == 'false') {
              //   print('false ..');
              //   print('فشلت عملية الدفع');

              //   print('false ..');
              // } else {
              //   // Navigator.pushAndRemoveUntil(
              //   //     context,
              //   //     MaterialPageRoute(
              //   //         builder: (context) => OrderConfirmedScreen(
              //   //               orederId: widget.orderId!,
              //   //               transitionId: uri.queryParameters['id'] ?? '',
              //   //             )),
              //   //     (route) => false);
              //   print('تمت عملية الدفع');
              //   // successGetBar('تمت عملية الدفع');
              //   print('true ..');
              // }
            }
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url ?? 'https://flutter.dev'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'payment'.tr(),
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: WebViewWidget(controller: _controller))));
  }
}
