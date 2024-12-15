import 'package:travel_club/core/exports.dart';
import '../data/repo/transportation_repo_impl.dart';
import 'transportation_state.dart';

class TransportationCubit extends Cubit<TransportationState> {
  TransportationCubit(this.api) : super(TransportationInitial());
  TransportationRepoImpl api;
  TextEditingController searchController = TextEditingController();
}
