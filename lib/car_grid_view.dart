import 'package:flutter/material.dart';
import 'car_controller.dart';
import 'car_item.dart';
import 'car_model.dart';

class CarGridView extends StatefulWidget {
  final CarController controller;
  final VoidCallback toggleTheme;

  CarGridView({required this.controller, required this.toggleTheme});

  @override
  _CarGridViewState createState() => _CarGridViewState();
}

class _CarGridViewState extends State<CarGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car List App'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: widget.toggleTheme,
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              _showFavorites(context);
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: widget.controller.cars.length,
        itemBuilder: (context, index) {
          final car = widget.controller.cars[index];
          return CarItem(
            car: car,
            onFavorite: () {
              setState(() {
                widget.controller.toggleFavorite(car);
              });
            },
            onLongPress: () {
              _showCarDetails(context, car);
            },
          );
        },
      ),
    );
  }

  void _showFavorites(BuildContext context) {
    final favorites = widget.controller.favoriteCars;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: favorites.map((car) {
            return ListTile(
              leading: Image.asset(car.imgSrc, width: 50),
              title: Text(car.name),
              trailing: Icon(Icons.favorite, color: Colors.red),
            );
          }).toList(),
        );
      },
    );
  }

  void _showCarDetails(BuildContext context, Car car) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(car.name),
          content: Text(car.details),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
