
class CurrentResponse {
  final DateTime time;
  final int interval;
  final double temperature2m;
  final bool isDay;
  final double rain;
  final double pressureMsl;
  final double surfacePressure;

  CurrentResponse({
    required this.time,
    required this.interval,
    required this.temperature2m,
    required this.isDay,
    required this.rain,
    required this.pressureMsl,
    required this.surfacePressure,
  });

  // Factory constructor to parse from JSON
  factory CurrentResponse.fromJson(Map<String, dynamic> json) {
    return CurrentResponse(
      time: DateTime.parse(json['time']),
      interval: json['interval'],
      temperature2m: json['temperature_2m'],
      isDay: json['is_day'] == 1,
      rain: json['rain'],
      pressureMsl: json['pressure_msl'],
      surfacePressure: json['surface_pressure'],
    );
  }

  // Method to convert object to JSON format
  Map<String, dynamic> toJson() {
    return {
      'time': time.toIso8601String(),
      'interval': interval,
      'temperature_2m': temperature2m,
      'is_day': isDay ? 1 : 0,
      'rain': rain,
      'pressure_msl': pressureMsl,
      'surface_pressure': surfacePressure,
    };
  }
}
