import 'package:flutter/painting.dart';

abstract class AppRadius {
  AppRadius._();

  static const _radius2 = Radius.circular(2);
  static const _radius4 = Radius.circular(4);
  static const _radius6 = Radius.circular(6);
  static const _radius8 = Radius.circular(8);
  static const _radius12 = Radius.circular(12);
  static const _radius16 = Radius.circular(16);
  static const _radius20 = Radius.circular(20);
  static const _radius24 = Radius.circular(24);
  static const _radius28 = Radius.circular(28);
  static const _radius36 = Radius.circular(36);
  static const _radius42 = Radius.circular(42);
  static const _radius48 = Radius.circular(48);
  static const _radius60 = Radius.circular(60);

  static const all2 = BorderRadius.all(_radius2);
  static const all4 = BorderRadius.all(_radius4);
  static const all6 = BorderRadius.all(_radius6);
  static const all8 = BorderRadius.all(_radius8);
  static const all12 = BorderRadius.all(_radius12);
  static const all16 = BorderRadius.all(_radius16);
  static const all20 = BorderRadius.all(_radius20);
  static const all24 = BorderRadius.all(_radius24);
  static const all28 = BorderRadius.all(_radius28);
  static const all36 = BorderRadius.all(_radius36);
  static const all42 = BorderRadius.all(_radius42);
  static const all48 = BorderRadius.all(_radius48);
  static const all60 = BorderRadius.all(_radius60);

  static const top16 = BorderRadius.vertical(top: _radius16);
  static const top28 = BorderRadius.vertical(top: _radius28);
}

extension RadiusExtension on Radius {
  static Radius get circular2 => AppRadius._radius2;

  static Radius get circular4 => AppRadius._radius4;

  static Radius get circular8 => AppRadius._radius8;

  static Radius get circular12 => AppRadius._radius12;

  static Radius get circular16 => AppRadius._radius16;

  static Radius get circular20 => AppRadius._radius20;

  static Radius get circular24 => AppRadius._radius24;

  static Radius get circular28 => AppRadius._radius28;

  static Radius get circular36 => AppRadius._radius36;

  static Radius get circular42 => AppRadius._radius42;

  static Radius get circular48 => AppRadius._radius48;

  static Radius get circular60 => AppRadius._radius60;
}

extension BarderRadiusExtension on BorderRadius {
  static BorderRadius get all2 => AppRadius.all2;

  static BorderRadius get all4 => AppRadius.all4;

  static BorderRadius get all8 => AppRadius.all8;

  static BorderRadius get all12 => AppRadius.all12;

  static BorderRadius get all16 => AppRadius.all16;

  static BorderRadius get all20 => AppRadius.all20;

  static BorderRadius get all24 => AppRadius.all24;

  static BorderRadius get all28 => AppRadius.all28;

  static BorderRadius get all36 => AppRadius.all36;

  static BorderRadius get all42 => AppRadius.all42;

  static BorderRadius get all48 => AppRadius.all48;

  static BorderRadius get all60 => AppRadius.all60;

  static BorderRadius get top16 => AppRadius.top16;

  static BorderRadius get top28 => AppRadius.top28;
}
