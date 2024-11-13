import 'package:flutter/material.dart';

class NameContainer extends StatelessWidget {
  NameContainer({
    super.key,
    this.containerColor = Colors.white,
    required this.imageUrl,
    required this.nameOfStudent,
  });

  Color containerColor;
  String imageUrl;
  String nameOfStudent;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('I was Clicked')));
      },
      child: Card(
        margin: EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.all(8),
          width: size.width,
          height: size.height / 15,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(16),
            // border: Border.all(color: Colors.purple, width: 0.5),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: size.width / 10,
              ),
              Text(nameOfStudent)
            ],
          ),
        ),
      ),
    );
  }
}

class FoodTiles extends StatelessWidget {
  FoodTiles(
      {required this.imagePath,
      required this.nameOfSoup,
      required this.priceOfSoup,
      super.key});

  String imagePath;
  String nameOfSoup;
  String priceOfSoup;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Container(
        height: size.height / 9,
        width: size.width,
        child: Row(
          children: [
            Image(image: AssetImage(imagePath)),
            Expanded(
                child: Column(
              children: [
                Text(nameOfSoup),
                Text('Price: $priceOfSoup'),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
