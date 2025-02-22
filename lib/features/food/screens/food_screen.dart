import 'package:easy_localization/easy_localization.dart';
import 'package:travel_club/core/widgets/no_data_widget.dart';

import '../../../core/exports.dart';
import '../cubit/food_cubit.dart';
import '../widgets/big_container_food.dart';
class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<FoodCubit>().getCatogeryData();
    context.read<FoodCubit>().getResturant(context.read<FoodCubit>().catogreyModel.data?[0].id.toString()??"");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var cubit= context.read<FoodCubit>();
  return BlocBuilder<FoodCubit,FoodState>(builder: (BuildContext context, state) {
    return
      CustomScreen(appbarTitle: AppTranslations.food,body:
    RefreshIndicator(
      onRefresh: () {
        print("refresh"+" "+cubit.catogreyId.toString());
        return cubit.getResturant(cubit.catogreyId??cubit.catogreyModel.data?[0].id.toString()??"");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height:getVerticalPadding(context)*1,),
          HomeScreen(),

            SizedBox(height: 20.h,),
            Expanded(
              child:
              state is LoadingGetFood?Center(child: CustomLoadingIndicator(),):

              cubit.resturantModel?.data!.isEmpty??true?Center(child: NoDataWidget(title: "no_data".tr()),):
              ListView.separated(
                shrinkWrap: true,
                itemCount: cubit.resturantModel?.data?.length??0, itemBuilder: (BuildContext context, int index) { return
                BigContainerFood(
                  isFavouriteScreen: cubit.resturantModel?.data?[index].isFav??false,
                  logo: cubit.resturantModel?.data?[index].logo??"",
                  name: cubit.resturantModel?.data?[index].name??"" ,
                  rate: cubit.resturantModel?.data?[index].rate.toString()??"",
                  users: cubit.resturantModel?.data?[index].users.toString()??"",
                ); }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 13.h,); },),
            ),
            SizedBox(height: 10.h,)

        ],
          ),
      ),
    ) ,);
    },);
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var cubit= context.read<FoodCubit>();
   return BlocBuilder<FoodCubit,FoodState>(builder: (BuildContext context, state) {
     return
       SizedBox(
       height: 50.h,
       child:
       // state is LoadingGetFood?Center(child: CustomLoadingIndicator(),):
       ListView.builder(
         itemCount: cubit.catogreyModel.data?.length??0,
         scrollDirection: Axis.horizontal,
         physics: BouncingScrollPhysics(),
           itemBuilder: (context, index) {
       return Padding(
           padding: const EdgeInsets.all(2.0),
           child: MenuButton(
           title:cubit.catogreyModel.data?[index].name?.toString()??"",
           isSelected: cubit.selectedIndex == 0,
           onTap: (){
             print("nono id");
             cubit.catogreyId=cubit.catogreyModel.data?[index].id.toString()??"";
             print(cubit.catogreyModel.data?[index].id.toString()??"" );
             cubit.getResturant(cubit.catogreyModel.data?[index].id.toString()??"");
            // cubit.catogreyModel.data?[index].id
            //  cubit.changeIndex(0);
           },
                ),
         );
       }),
     ); },);
  }
}

class MenuButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  MenuButton({required this.title, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
 return BlocBuilder<FoodCubit,FoodState>(builder: (BuildContext context, state) {
   return GestureDetector(
   onTap: onTap,
   child: Container(
     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
     decoration: BoxDecoration(
       color: isSelected ? Colors.blue : Colors.white,
       borderRadius: BorderRadius.circular(20),
         boxShadow:
          [
         BoxShadow(
           color: Colors.grey.withOpacity(0.1),
           spreadRadius: 5,
           blurRadius: 7,
           offset: const Offset(0, 3), // Shadow position
         ),
         ]
    //   border: Border.all(color: Colors.blue),
     ),
     child: Text(
       title,
       style: TextStyle(
         color: isSelected ? Colors.white : Colors.blue,
         fontSize: 16,
       ),
     ),
   ),
 );
   },);
  }
}
