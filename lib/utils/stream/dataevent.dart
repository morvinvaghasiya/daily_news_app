import 'package:flutter/material.dart';

abstract class DataEvent {
  DataEvent();
}

class GetDataEvent extends DataEvent {
  final String type;
  final BuildContext context;
  GetDataEvent({
    required this.type,
    required this.context,
  });
}
