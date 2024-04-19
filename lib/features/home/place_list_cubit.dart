import 'package:bloc/bloc.dart';
import 'package:vegas/app/main.dart';
import 'package:vegas/features/home/models/place/place.dart';

class PlaceListCubit extends Cubit<List<Place>> {
  PlaceListCubit() : super([]) {
    read();
  }

  void create(Place place) {
    placesBox.add(place).whenComplete(() {
      emit([...state, place]);
    });
  }

  void read() {
    List<Place> placeList = [];
    if (placesBox.isNotEmpty) {
      for (var i = 0; i < placesBox.length; i++) {
        final place = placesBox.getAt(i);
        placeList.add(place!);
      }
      emit(placeList);
    } else {
      emit([]);
    }
  }

  void update(int index, Place place) {
    placesBox.putAt(index, place).whenComplete(() {
      final List<Place> updatedList = List.from(state);
      updatedList[index] = place;
      emit(updatedList);
    });
  }

  void delete(int index) {
    placesBox.deleteAt(index).whenComplete(() {
      final List<Place> updatedList = List.from(state);
      updatedList.removeAt(index);
      emit(updatedList);
    });
  }
}
