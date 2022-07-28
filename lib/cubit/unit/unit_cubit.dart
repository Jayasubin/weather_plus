import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_plus/model/service/storage.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  UnitCubit() : super(const UnitInitial());

  Future<void> getUnit() async {
    bool isFahrenheit = await StorageService().readUnit();
    emit(UnitChanged(isFahrenheit));
  }

  Future<void> changeUnit(bool isFahrenheit) async {
    await StorageService().writeUnit(isFahrenheit);
    emit(UnitChanged(isFahrenheit));
  }
}
