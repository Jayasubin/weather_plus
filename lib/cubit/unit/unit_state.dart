part of 'unit_cubit.dart';

@immutable
abstract class UnitState {
  final bool isFahrenheit;

  const UnitState(this.isFahrenheit);
}

class UnitInitial extends UnitState {
  const UnitInitial() : super(false);
}

class UnitChanged extends UnitState {
  const UnitChanged(bool isFahrenheit) : super(isFahrenheit);
}
