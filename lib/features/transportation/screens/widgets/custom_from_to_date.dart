import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/transportation/cubit/transportation_cubit.dart';
import 'package:travel_club/features/transportation/cubit/transportation_state.dart';

class CustomFromToDate extends StatelessWidget {
  const CustomFromToDate({
    super.key,
  });

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DatePickerField(
                  selectedDate: cubit.fromDate!,
                  onTap: () {
                    cubit.onSelectedDate(true, context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: SvgPicture.asset(
                  AppIcons.line,
                  height: 50.h,
                  width: 20.w,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: DatePickerField(
                  selectedDate: cubit.toDate!,
                  onTap: () {
                    cubit.onSelectedDate(false, context);
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
  final void Function()? onTap;

  const DatePickerField({super.key, required this.selectedDate, this.onTap});

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
        mainAxisAlignment: MainAxisAlignment.center,
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
