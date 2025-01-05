
import 'package:travel_club/core/exports.dart';
import 'package:travel_club/features/search/cubit/search_cubit.dart';
import 'package:travel_club/features/search/screens/search_body.dart';




class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    SearchCubit cubit = context.read<SearchCubit>();
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return  Scaffold(body: SizedBox(
          height: getHeightSize(context),
          width: getWidthSize(context),
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  child: Image.asset(
                    ImageAssets.mask,
                    fit: BoxFit.cover,
                    height: getHeightSize(context) * 0.3,
                    width: getWidthSize(context),
                  )),
              SizedBox(
                  height: getHeightSize(context),
                  width: getWidthSize(context),
                  child: const Searchbody())
            ],
          ),
        ),);
      },
    );
  }
}
