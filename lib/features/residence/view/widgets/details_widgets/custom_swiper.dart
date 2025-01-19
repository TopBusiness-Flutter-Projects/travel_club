// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:card_swiper/card_swiper.dart';
// import 'package:travel_club/features/residence/cubit/residence_cubit.dart';

// import '../../../../../core/exports.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/residence/cubit/residence_cubit.dart';

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
                return GestureDetector(
                 onTap: () {
              // Navigate to the full-screen image viewer
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FullScreenImageViewer(
                    initialIndex: index,
                    images: images ?? [],
                  ),
                ),
              );
            },
                  child: CachedNetworkImage(
                    imageUrl:
                        cubit.lodgesDetailsModel.data?.media?[index].image ??
                            "",
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
                  ),
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

class FullScreenImageViewer extends StatelessWidget {
  final int initialIndex;
  final List<String> images;

  const FullScreenImageViewer({
    super.key,
    required this.initialIndex,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: PhotoViewGallery.builder(
        itemCount: images.length,
        pageController: PageController(initialPage: initialIndex),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: CachedNetworkImageProvider(images[index]),
            heroAttributes: PhotoViewHeroAttributes(tag: images[index]),
          );
        },
        scrollPhysics: const BouncingScrollPhysics(),
        backgroundDecoration: const BoxDecoration(color: Colors.black),
        loadingBuilder: (context, progress) {
          return Center(
            child: CircularProgressIndicator(
              value: progress == null || progress.expectedTotalBytes == null
                  ? null
                  : progress.cumulativeBytesLoaded /
                      progress.expectedTotalBytes!,
            ),
          );
        },
      ),
    );
  }
}