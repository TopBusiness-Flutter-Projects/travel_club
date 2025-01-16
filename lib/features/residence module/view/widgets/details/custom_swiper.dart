import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:travel_club/core/widgets/network_image.dart';

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
                return CachedNetworkImage(
                  imageUrl:
                      cubit.lodgesDetailsModel.data?.media?[index].image ?? "",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => SizedBox(
                    height: 50.h,
                    width: 50.h,
                    child: Column(
                      children: [
                        SizedBox(
                          height: getHeightSize(context) * 0.18,
                        ),
                        Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                );
              },
              layout: SwiperLayout.DEFAULT,
              loop: true,
              autoplayDelay: 8000,
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
