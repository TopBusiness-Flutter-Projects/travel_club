// ignore_for_file: deprecated_member_use

import 'package:travel_club/core/exports.dart';

import '../cubit/favourites_cubit.dart';
import '../cubit/favourites_state.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});
  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    FavouritesCubit cubit = context.read<FavouritesCubit>();
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        return Center(
          child: Text('Favourites Screen'),
        );
      },
    );
  }
}