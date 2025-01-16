import '../../../../../../core/exports.dart';

class LinearProgress extends StatelessWidget {
   LinearProgress({super.key, this.value});
  double? value;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        height: 5.h, // Set thickness of the progress bar
        width: 165.w, // Set width as needed
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: value??0.25, // Adjust progress (0.0 - 1.0)
            backgroundColor: Colors.grey[200], // Background color
            valueColor: AlwaysStoppedAnimation<Color>(
              Colors.blue, // Progress color
            ),
          ),
        ),
      ),
    );
  }
}
