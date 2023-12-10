import 'package:flutter/material.dart';
import 'car_model.dart';

class CarItem extends StatelessWidget {
  final Car car;
  final VoidCallback onFavorite;
  final VoidCallback onLongPress;

  const CarItem({
    Key? key,
    required this.car,
    required this.onFavorite,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Card(
        clipBehavior: Clip.antiAlias, // Để hình ảnh không vượt ra ngoài card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                car.imgSrc,
                width: double.infinity, // Chiếm toàn bộ chiều ngang của card
                fit: BoxFit.cover, // Bao phủ toàn bộ không gian khả dụng
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8), // Thêm padding cho text và icon
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          car.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: car.isFavorite ? Colors.red : null,
                        ),
                        onPressed: onFavorite,
                      ),
                      Text(car.isFavorite
                          ? '1'
                          : '0'), // Đây chỉ là ví dụ, bạn cần một biến để theo dõi số lượng 'thích'
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
