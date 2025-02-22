import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/core/widgets/network_image.dart';
import 'package:travel_club/features/residence/cubit/residence_cubit.dart';

class SwiperWithAutoplay extends StatefulWidget {
  final double? height;
  final List<String> images;
  const SwiperWithAutoplay({
    super.key,
    this.height,
    required this.images,
  });
//
  @override
  _SwiperWithAutoplayState createState() => _SwiperWithAutoplayState();
}

class _SwiperWithAutoplayState extends State<SwiperWithAutoplay> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ResidenceCubit>();
    return Positioned(
      child: SizedBox(
        height: widget.height ?? getHeightSize(context) * 0.6,
        width: getWidthSize(context),
        child: Swiper(
          controller: cubit.swiperController,
          onIndexChanged: (index) {
          //  cubit.changeIndex(index);
          },
          itemCount: widget.images.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenImageViewer(
                      initialIndex: index,
                      images: widget.images,
                    ),
                  ),
                );
              },
              child: CustomNetworkImage(image: widget.images[index]),
            );
          },
          layout: SwiperLayout.DEFAULT,
          loop: true,
          autoplayDelay: 6000,
          autoplay: true,

          pagination: SwiperPagination(
            margin: EdgeInsets.only(bottom: getHeightSize(context) * 0.32) ,
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
