import '../../../../core/exports.dart';

class CustomContainerMyAccount extends StatelessWidget {
  const CustomContainerMyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return      Padding(
      padding: const EdgeInsets.all(1.0),
      child: CustomContainerWithShadow(
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                    backgroundColor:AppColors.grey.withOpacity(.2),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.asset(ImageAssets.profile,color: AppColors.grey,),
                    )),
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("احمد مختار"),
                    Text("01027639683"),
                  ],),
              )

            ],
          ),
        ),
      ),
    );
  }
}
