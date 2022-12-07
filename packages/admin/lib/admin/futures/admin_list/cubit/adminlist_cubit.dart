import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'adminlist_state.dart';

class AdminlistCubit extends Cubit<AdminlistState> {
  AdminlistCubit() : super(AdminlistInitial());
}
