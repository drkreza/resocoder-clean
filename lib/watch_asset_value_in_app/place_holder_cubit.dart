import 'package:bloc/bloc.dart';

class PlaceHolderCubit extends Cubit<String?> {
  PlaceHolderCubit() : super(null);

  void saveObject(String data) => emit(data);

  void clearObject() => emit(null);
}
