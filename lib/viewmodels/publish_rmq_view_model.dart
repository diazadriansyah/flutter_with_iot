import 'package:flutter/cupertino.dart';
import 'package:flutter_with_iot/locator.dart';
import 'package:flutter_with_iot/services/rmq_service.dart';
import 'package:flutter_with_iot/viewmodels/base_model.dart';

class PublishViewModel extends BaseModel {
  TextEditingController guidController = TextEditingController();

  final RmqService _rmqService = locator<RmqService>();

  bool index = false;

  void publishRmq(bool index) {
    String guid = guidController.text;

      _rmqService.publish('$guid#0');
      print('[Berhasil] $guid');
    }
}