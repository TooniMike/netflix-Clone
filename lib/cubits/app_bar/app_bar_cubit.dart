import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarCubit extends Cubit<double> {
  AppBarCubit() : super(0);

  void setOffset(double offset) => emit(offset);
}
