import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_iot/ui/widgets/field_data_widget.dart';
import 'package:flutter_with_iot/viewmodels/subscribe_rmq_view_model.dart';
import 'package:stacked/stacked.dart';

class SubscribeRmqView extends StatefulWidget {
  const SubscribeRmqView({Key key}) : super(key: key);

  @override
  _SubscribeRmqViewState createState() => _SubscribeRmqViewState();
}

class _SubscribeRmqViewState extends State<SubscribeRmqView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SubscribeRmqViewModel>.reactive(
        viewModelBuilder: () => SubscribeRmqViewModel(),
        onModelReady: (model) => model.initState(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Subscribe data from RMQ',
                  style: TextStyle(
                  fontWeight: FontWeight.bold
             ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 100,),
                  const Padding(
                    padding: EdgeInsets.only(top: 60, bottom: 15, left: 10, right: 10),
                    child: Text(
                        'Cek Hasil Tes Pemeriksaan COVID 19',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                        ),
                    ),
                  ),
                  FieldDataWidget(
                      controller: model.serialSoilController,
                      label: 'Nama Lengkap',
                      hint: 'Nama Lengkap',
                  ),
                  FieldDataWidget(
                      controller: model.valueSoilController,
                      label: 'Kode Tes',
                      hint: 'Kode Tes',
                  ),
                  FieldDataWidget(
                      controller: model.statusSoilController,
                      label: 'Hasil Pemeriksaan',
                      hint: 'Hasil Pemeriksaan',
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}