import 'package:flutter/material.dart';
import '../trip/stopwatch.dart';
import 'bike_model.dart';

class BikeDetail extends StatelessWidget {
  final BikeModel model;

  const BikeDetail({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(model.name)),
        floatingActionButton: ElevatedButton(
          child: Icon(Icons.timer),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => StopWatch()));
          },
        ),
        body: Center(
          child: Column(
            children: [
              Text('Name: ${model.name}'),
              Text('Current Odo: ${model.currentOdo}'),
              Text('Number of Trip: ${model.numberOfTrip}'),
              Text('Next maintenence Odo: ${model.nextMaintenenceOdo}'),
            ],
          ),
        ));
  }
}
