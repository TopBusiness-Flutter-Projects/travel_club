import '../../../../core/exports.dart';
import '../../cubit/entertainment_cubit.dart';
import '../../data/model/get_ways_model.dart';

class EntertainmentWidget extends StatelessWidget {
   EntertainmentWidget({super.key,required this.waysData});
  WaysData waysData;
  @override
  Widget build(BuildContext context) {
  return BlocBuilder<EntertainmentCubit, EntertainmentState>(builder: (BuildContext context, state) {
    return Padding(
    padding: const EdgeInsets.all(5.0),
    child: GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Routes.compainiesEntertainment,arguments: waysData.id.toString());
      },
      child: Container(
        height: 178.h,
        //  width: 165.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          image: DecorationImage(
              image: NetworkImage(waysData.image.toString()), fit: BoxFit.cover
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(1, 3), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.8),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(waysData.name.toString(),style: getSemiBoldStyle(fontSize: 14.sp,color: AppColors.white),),
                Image.asset(ImageAssets.container,width: 62.w,height: 18.h,color: AppColors.primary,),
                SizedBox(height: 10.h,)
              ],),
          ),
        ),

      ),
    ),
  );
    },);
  }
}
