import 'dart:developer' as d;

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tasu/client/client.dart';

extension Log on Object {
  void log() => d.log(toString());
}

var logger = Logger();
