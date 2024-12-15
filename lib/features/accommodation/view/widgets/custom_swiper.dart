import 'package:card_swiper/card_swiper.dart';

import '../../../../core/exports.dart';

class CustomSwiper extends StatelessWidget {
  const CustomSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'https://via.placeholder.com/600x400', // Replace with your image URLs
      'https://via.placeholder.com/600x400',
      'https://via.placeholder.com/600x400',
    ];
    return   Positioned(
      child: SizedBox(
        height: getHeightSize(context) * 0.65,
        width: getWidthSize(context),
        child: Swiper(
          itemCount: imageUrls.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
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
  }
}
