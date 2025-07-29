import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/cases/cubit/cases_cubit.dart';

import 'package:travel_club/features/payment/screens/widgets/custom_price_widget.dart';
import 'package:travel_club/features/residence/view/residence_booking/widgets/custom_container_booking.dart';

class BookCaseScreen extends StatefulWidget {
  const BookCaseScreen({
    super.key,
  });

  @override
  State<BookCaseScreen> createState() => _BookCaseScreenState();
}

class _BookCaseScreenState extends State<BookCaseScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CasesCubit, CasesState>(
      builder: (BuildContext context, state) {
        var cubit = context.read<CasesCubit>();
        return CustomScreen(
          appbarTitle: AppTranslations.detailsBooking,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  
                  if (cubit.bookSuitcaseDetailsModel?.data == null)
                    Padding(
                      padding:
                          EdgeInsets.only(top: getHeightSize(context) * 0.15),
                      child: const Center(
                        child: CustomLoadingIndicator(),
                      ),
                    )
                  else ...[
                    CustomPricesWidget(
                      nights: cubit.bookSuitcaseDetailsModel!.data!.nightCount
                          .toString(),
                      totalPrice: cubit
                          .bookSuitcaseDetailsModel!.data!.totalPrice
                          .toString(),
                      totalPriceAfterVat: cubit
                          .bookSuitcaseDetailsModel!.data!.totalPriceAfterVat
                          .toString(),
                      vat: cubit.bookSuitcaseDetailsModel!.data!.vat.toString(),
                      reservationId:
                          cubit.getSuitcaseDetailsModel?.data?.id ?? 0,
                    ),
                    SizedBox(
                      height: 40.h,
                    )
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
