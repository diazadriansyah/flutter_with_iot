import 'package:flutter_with_iot/locator.dart';
import 'package:flutter_with_iot/services/navigator_service.dart';
import 'package:flutter_with_iot/viewmodels/base_model.dart';

class DashboardViewModel extends BaseModel{
  final NavigationService _navigationService = locator<NavigationService>();

  void navigationToVoid(routeName){
    _navigationService.navigateTo(routeName);
  }
}