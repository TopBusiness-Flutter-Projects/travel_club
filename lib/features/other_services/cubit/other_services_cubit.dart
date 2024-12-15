import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_club/core/exports.dart';
import '../data/repo/other_services_repo_impl.dart';
import 'other_services_state.dart';

class OtherServicesScreenCubit extends Cubit<OtherServicesScreenState> {
  OtherServicesScreenCubit(this.api) : super(OtherServicesScreenInitial());
  OtherServicesScreenRepoImpl api;
  TextEditingController searchController = TextEditingController();
}
