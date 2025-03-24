import 'package:travel_club/features/entertainment/screens/widgets/custom_container_companies.dart';
import '../../../core/exports.dart';
import '../cubit/entertainment_cubit.dart';

class EntertainmentCompanies extends StatefulWidget {
  const EntertainmentCompanies({super.key,required this.id});
 final String id;
  @override
  State<EntertainmentCompanies> createState() => _EntertainmentCompaniesState();
}

class _EntertainmentCompaniesState extends State<EntertainmentCompanies> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<EntertainmentCubit>().getOrginization(id: widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit=context.read<EntertainmentCubit>();
    return BlocBuilder<EntertainmentCubit, EntertainmentState>(
      builder: (BuildContext context, state) {
        return CustomScreen(
          appbarTitle: AppTranslations.entertainmentMeans,
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getVerticalPadding(context) * 2),
                if((cubit.getOrganizationsModel?.data!=null)&&(cubit.getOrganizationsModel?.data?.isNotEmpty??false) )
                Text(
                  AppTranslations.listOfCompanies,
                  style: getMediumStyle(fontSize: 14.sp),
                ),
                Expanded(
                  child: cubit.getOrganizationsModel?.data==null?const Center(child: CircularProgressIndicator(),):      cubit.getOrganizationsModel!.data!.isEmpty? Center(child: Text(AppTranslations.noData)):
                  ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.detailsEntertainment,
                                arguments:{
                                  "orginizationData":cubit.getOrganizationsModel!.data![index],
                                }


                              );
                            },
                            child: CustomContainerCompanies(
                              isDetails: true, orginizationData: cubit.getOrganizationsModel!.data![index],
                            )),
                      );
                    },
                    itemCount: cubit.getOrganizationsModel!.data?.length??0,
                  ),
                ),
                SizedBox(height: getVerticalPadding(context) * 1),
              ],
            ),
          ),
        );
      },
    );
  }
}
