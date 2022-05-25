extension DurationExtension on Duration {
  String get formattedMinutes =>
      inMinutes.remainder(60).toString().padLeft(2, '0');

  String get formattedSecond =>
      inSeconds.remainder(60).toString().padLeft(2, '0');

  String get formattedMinutesAndSecond => '$formattedMinutes:$formattedSecond';
}
