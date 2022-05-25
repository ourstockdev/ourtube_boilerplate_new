import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ourtube_boilerplate/data/remote/network/common/exception/api_exception.dart';

typedef WidgetCallback = Widget Function();
typedef VoidCallback = void Function();
typedef TypeAdapterCallback = TypeAdapter Function();

typedef StreamSubscriptionFunction = void Function(
  StreamSubscription subscription,
);

typedef IntFunction = void Function(int value);

typedef NetworkExceptionCallback = NetworkException Function();
