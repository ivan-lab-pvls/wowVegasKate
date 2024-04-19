import 'package:bloc/bloc.dart';
import 'package:vegas/app/main.dart';
import 'package:vegas/features/home/models/place/place.dart';

class NewPlaceCubit extends Cubit<Place> {
  NewPlaceCubit() : super(Place.empty());

  void set(Place place) => emit(place);
  void nullify() => emit(Place.empty());
}
