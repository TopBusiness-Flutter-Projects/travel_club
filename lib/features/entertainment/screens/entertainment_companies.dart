import 'package:flutter_rating/flutter_rating.dart';
import 'package:travel_club/features/entertainment/screens/widgets/custom_container_companies.dart';
import '../../../core/exports.dart';
import '../cubit/entertainment_cubit.dart';

class EntertainmentCompanies extends StatelessWidget {
  const EntertainmentCompanies({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(builder: (BuildContext context, state) {
      return CustomScreen(
        appbarTitle: AppTranslations.entertainmentMeans,
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:getVerticalPadding(context)*2),
              Text(AppTranslations.ListOfCompanies,style: getMediumStyle(fontSize: 14.sp),),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                  return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, Routes.detailsEntertainment);
                      },
                      child: CustomContainerCompanies(isDetails: true,)
                    ),
                  );
                } ,itemCount: 10,),
              ),
              SizedBox(height:getVerticalPadding(context)*1),
            ],
          ),
        ),
      );
    },);

  }
}
