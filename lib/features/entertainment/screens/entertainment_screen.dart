import 'package:travel_club/features/entertainment/screens/widgets/entertainment_widget.dart';
import '../../../core/exports.dart';
import '../cubit/entertainment_cubit.dart';

class EntertainmentScreen extends StatelessWidget {
  const EntertainmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
   return BlocBuilder<EntertainmentCubit, EntertainmentState>(builder: (BuildContext context, state) {
     return CustomScreen(
     appbarTitle: AppTranslations.entertainmentMeans,
     body: Column(
       children: [
         SizedBox(height:getVerticalPadding(context)*2),
         Expanded(
           child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
               mainAxisSpacing: 1, crossAxisSpacing: 2, childAspectRatio: 0.8),itemBuilder: (context, index) {
             return  EntertainmentWidget();
           } ,itemCount: 10,),
         ),
         SizedBox(height:getVerticalPadding(context)*1),
       ],
     ),
   );
     },);
  }
}
