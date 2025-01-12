import 'package:cached_network_image/cached_network_image.dart';
import 'package:travel_club/core/exports.dart';

// Amer
class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    required this.image,
    this.isUser = false,
    this.height,
    this.width,
  });

  final String image;
  final bool isUser;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.network(
        // "https://www.programaenlinea.net/wp-content/uploads/2019/04/testing-1.jpg",
        image,
        fit: BoxFit.cover,
        height: height,
        width: width,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CustomLoadingIndicator(),
          );
        },
        errorBuilder: (context, error, stackTrace) => Image.asset(
              isUser ? ImageAssets.profile : ImageAssets.logoImage,
              height: height,
              width: width,
              fit: BoxFit.cover,
            ));
  }
}
