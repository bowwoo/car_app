import 'package:flutter/material.dart';
import 'car_model.dart';

class CarController with ChangeNotifier {
  List<Car> cars = [
    Car(
        name: 'Coupe Maserati',
        imgSrc: 'assets/images/1.jpg',
        details: 'Thông tin chi tiết về Coupe Maserati'),
    Car(
        name: 'Camaro SS 1LE',
        imgSrc: 'assets/images/2.jpg',
        details: 'Thông tin chi tiết về Camaro SS 1LE'),
    Car(
        name: 'Dodger Charger',
        imgSrc: 'assets/images/3.jpg',
        details: 'Thông tin chi tiết về Dodger Charger'),
    Car(
        name: 'Ford Mustang',
        imgSrc: 'assets/images/4.jpg',
        details: 'Thông tin chi tiết về Ford Mustang'),
  ];

  void toggleFavorite(Car car) {
    final index = cars.indexOf(car);
    cars[index].isFavorite = !cars[index].isFavorite;
    notifyListeners();
  }

  List<Car> get favoriteCars => cars.where((car) => car.isFavorite).toList();
}
