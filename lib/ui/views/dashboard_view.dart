import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_iot/constants/route_name.dart';
import 'package:flutter_with_iot/ui/shared/ui_helper.dart';
import 'package:flutter_with_iot/viewmodels/dashboard_view_model.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ViewModelBuilder<DashboardViewModel>.reactive(
        viewModelBuilder: () => DashboardViewModel(),
        builder: (context, model, child) => Scaffold(
          body: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  verticalSpaceMedium,
                  Image.asset(
                    'assets/logo1.png',
                    width: size.width*0.6,
                    height: size.height*0.4,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                          'Rabbit MQ',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Robot_Font"
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 170,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'SELECT HERE',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Super-Mario"
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  verticalSpaceMedium,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 43,
                        width: 157,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(0.0)
                        ),
                        child: InkWell(
                          onTap: (){
                            model.navigationToVoid(publishRmqViewRoute);
                          },
                          child: const Center(
                            child: Text(
                              'PUBLISH',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                fontFamily: "Super-Mario"
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        height: 43,
                        width: 157,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(0.0)
                        ),
                        child: InkWell(
                          onTap: (){
                            model.navigationToVoid(subscribeRmqViewRoute);
                          },
                          child: const Center(
                            child: Text(
                              'SUBSCRIBE',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Super-Mario"
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
