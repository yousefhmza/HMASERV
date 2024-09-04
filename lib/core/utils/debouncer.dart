import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hmaserv/core/resources/resources.dart';

class DeBouncer {
  Timer? _timer;
  Duration delay;

  DeBouncer({this.delay = Time.t700ms});

  void debounce(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Time.t700ms, action);
  }
}
