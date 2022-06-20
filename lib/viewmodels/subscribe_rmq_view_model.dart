import 'package:flutter/cupertino.dart';
import 'package:flutter_with_iot/locator.dart';
import 'package:flutter_with_iot/services/rmq_service.dart';
import 'package:flutter_with_iot/viewmodels/base_model.dart';

class SubscribeRmqViewModel extends BaseModel{
  final RmqService _rmqService = locator<RmqService>();

  TextEditingController valueSoilController = TextEditingController();
  TextEditingController serialSoilController = TextEditingController();
  TextEditingController statusSoilController = TextEditingController();
  TextEditingController serialPompController = TextEditingController();
  TextEditingController statusPompController = TextEditingController();

  bool checkStatus = false;

  String pompSerial;
  String pompValue;
  String sensorNama;
  String sensorKode;
  String sensorHasil;



  void setValuePump(String message){
    List<String> list = message.split('#');
    int checkValuePump = int.parse(list[1]);
    setBusy(true);
    pompSerial = list[0];
    if (checkValuePump == 1) {
      pompValue = 'On';
    }else if(checkValuePump == 0){
      pompValue = 'Off';
    }
    serialPompController.text = list[0];
    statusPompController.text = pompValue;
    setBusy(false);
  }

  void setValueSensor(String message){
    List<String> list = message.split('#');
    int checkValueSensor = int.parse(list[1]);
    setBusy(true);
    sensorKode = list[1];
    sensorNama = list[0];
    if (checkValueSensor <= 700) {
      sensorHasil = 'Negatif';
    } else {
      sensorHasil = 'Positif';
    }
    valueSoilController.text = list[1];
    serialSoilController.text = list[0];
    statusSoilController.text = sensorHasil;
    setBusy(false);
  }

  void sensor(){
    _rmqService.dataDevice('Log', setValueSensor);
  }

  void actuator(){
    _rmqService.dataDevice('Aktuator', setValuePump);
  }

  void subscribeData(){
    _rmqService.subscribe(sensor, actuator);
    checkStatus = true;
  }

  void initState(){
    setBusy(true);
    subscribeData();
    setBusy(false);
  }
}