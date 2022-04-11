class Temperature {
  final double _celsius;

  Temperature(this._celsius);

  String get _celsiusStr => _celsius.toStringAsFixed(1);
  String get _fahrenheitStr => ((_celsius * 1.8) + 32.0).toStringAsFixed(1);

  String getStr(bool isFahrenheit) =>
      isFahrenheit ? _fahrenheitStr : _celsiusStr;
}
