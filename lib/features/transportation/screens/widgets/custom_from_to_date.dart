import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';

class CustomFromToDate extends StatelessWidget {
  const CustomFromToDate({
    super.key,
    this.isGoOnly,
    this.isShowOnly = false, this.toDate, this.fromDate, this.singleDate,
  });
  final bool? isGoOnly; 
  /////  when isShowOnly = true ////////       
  final bool isShowOnly;
  final String? toDate;
  final String? fromDate;
  final String? singleDate;


  @override
  Widget build(BuildContext context) {
    TransportationCubit cubit = context.read<TransportationCubit>();
    return BlocBuilder<TransportationCubit, TransportationState>(
        builder: (context, state) {
      return Container(
          decoration: BoxDecoration(
            color: AppColors.lightWhite2,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: isGoOnly ?? cubit.goOnly
              ? Padding(
                  padding: EdgeInsets.all(18.h),
                  child: DatePickerField(
                    selectedDate: singleDate ?? cubit.singleDate,
                    isSingle: true,
                    onTap: () {
                      if (isShowOnly) {
                      } else {
                        cubit.onSelectedDateSingle(context: context);
                      }
                    },
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DatePickerField(
                        selectedDate: fromDate ?? cubit.fromDate,
                        onTap: () {
                          if (isShowOnly) {
                          } else {
                            cubit.onSelectedDate(
                                isStartDate: true, context: context);
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: SvgPicture.asset(
                        AppIcons.line,
                        height: 50.h,
                        width: 20.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: DatePickerField(
                        selectedDate: toDate ?? cubit.toDate,
                        onTap: () {
                          if (isShowOnly) {
                          } else {
                            cubit.onSelectedDate(
                                isStartDate: false, context: context);
                          }
                        },
                      ),
                    ),
                  ],
                ));
    });
  }
}

class DatePickerField extends StatefulWidget {
  final String selectedDate;
  final bool isSingle;
  final void Function()? onTap;

  const DatePickerField(
      {super.key,
      required this.selectedDate,
      this.onTap,
      this.isSingle = false});

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  // // Function to show the date picker
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(), // Default date is today
  //     firstDate: DateTime(2000), // Minimum date
  //     lastDate: DateTime(2100), // Maximum date
  //   );
  //   if (pickedDate != null) {
  //     setState(() {
  //       _selectedDate =
  //           "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap, // Call the date picker on tap
      child: Row(
        mainAxisAlignment: widget.isSingle
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.center,
        children: [
          Text(
            widget.selectedDate,
            style: getRegularStyle(
              fontSize: 14.sp,
              color: AppColors.grey,
            ),
          ),
          SizedBox(width: 8.w),
          SvgPicture.asset(
            AppIcons.calendar,
            width: 25.w,
          ),
        ],
      ),
    );
  }
}
