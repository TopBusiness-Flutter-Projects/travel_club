import 'package:card_swiper/card_swiper.dart';

import '../../../../../core/exports.dart';
import '../../../cubit/residence_cubit.dart';

class CustomSwiper extends StatelessWidget {
  const CustomSwiper({super.key, this.height, this.images});
  final double? height;
  final List<String>? images;
  @override


  Widget build(BuildContext context) {
    return BlocBuilder<ResidenceCubit, ResidenceState>(
      builder: (BuildContext context, state) {
        var cubit = context.read<ResidenceCubit>();
        return Positioned(
          child: SizedBox(
            height: height ?? getHeightSize(context) * 0.65,
            width: getWidthSize(context),
            child: Swiper(
              onIndexChanged: (index) {
                cubit.changeIndex(index);
              },
              itemCount: cubit.lodgesDetailsModel.data?.media?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  cubit.lodgesDetailsModel.data?.media?[index].image ?? "",
                  fit: BoxFit.cover,
                );

                //  CustomNetworkImage(
                //   isDetails: true,
                //   image:
                //       cubit.lodgesDetailsModel.data?.media?[index].image ?? "",
                // );
              },
              layout: SwiperLayout.DEFAULT,
              autoplay: true,
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.white,
                  color: Colors.white.withOpacity(.4),
                ),
              ),
              itemWidth: MediaQuery.of(context).size.width * 0.8,
              itemHeight: 200.0,
            ),
          ),
        );
      },
    );
  }
}
