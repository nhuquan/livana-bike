import 'package:flutter/material.dart';
import 'bike_detail.dart';
import 'bike_model.dart';

const bikes = [
  BikeModel('Yamaha Nouvo 3', 1000, 12, 5000),
  BikeModel('Suzuki Hayate', 2000, 30, 10000),
];

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livana'),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: bikes.map((bike) => BikeCard(model: bike)).toList(),
      ),
    );
  }
}

class BikeCard extends StatelessWidget {
  final BikeModel model;

  const BikeCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${model.name}'),
            Text('Current Odo: ${model.currentOdo}'),
            Text('Number of Trip: ${model.numberOfTrip}'),
            Text('Next maintenence Odo: ${model.nextMaintenenceOdo}'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  print('details');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BikeDetail(model: model)));
                },
                child: Text('Details')),
          ],
        )
      ]),
    );
  }
}
