import 'package:class2024/components/name_container.dart';
import 'package:class2024/generated/assets.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String? selectedSoup;
  String? selectedSwallow;
  List<String> soups = [
    'Afang Soup',
    'Edikan-ikong soup',
    'Okra soup',
    'Atama Soup'
  ];
  List<String> swallows = ['Fufu', 'Garri', 'Yam Pondo', 'Semovita'];
  
  List soupList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    soupList = [
      Foods(imgPath: Assets.imagesAfang, namOfSoup: "Afang", prcOfSoup: "15,000"),
      Foods(imgPath: Assets.imagesAtama, namOfSoup: "Atama", prcOfSoup: "5,000"),
      Foods(imgPath: Assets.imagesMelon, namOfSoup: "Melon", prcOfSoup: "5,000"),
      Foods(imgPath: Assets.imagesOkro, namOfSoup: "Okro", prcOfSoup: "10,000"),
      Foods(imgPath: Assets.imagesVegetable, namOfSoup: "Vegetable", prcOfSoup: "20,000"),
      Foods(imgPath: Assets.imagesBeans, namOfSoup: "Beans", prcOfSoup: "25,000"),

    ];



  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.teal,
                  ),
                  width: size.width,
                  child: DropdownButton(
                      dropdownColor: Colors.white,
                      value: selectedSoup,
                      hint: Text('Select Soup'),
                      items: soups.map((String item) {
                        return DropdownMenuItem(value: item, child: Text(item));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedSoup = newValue;
                        });
                      }),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.teal,
                  ),
                  width: size.width,
                  child: DropdownButton(
                      dropdownColor: Colors.white,
                      value: selectedSwallow,
                      hint: Text('Select Swallow'),
                      items: swallows.map((String item) {
                        return DropdownMenuItem(value: item, child: Text(item));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedSwallow = newValue;
                        });
                      }),
                ),
            
                Text("Or choose from the list Below"),
            
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: soupList.length,
                    itemBuilder: (context, index) {
                      final list = soupList;
                      return FoodTiles(
                          imagePath: list[index].imgPath,
                          nameOfSoup: list[index].namOfSoup,
                          priceOfSoup: list[index].prcOfSoup
                      );
                    }),
                MaterialButton(
                  color: Colors.purple,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(' $selectedSoup , $selectedSwallow ')));
                  },
                  child: Text('Checkout', style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: size.height / 40,)
              ],
            ),
          ),
        ));
  }
}

class Foods {
  String imgPath;
  String namOfSoup;
  String prcOfSoup;

  Foods(
      {
        required this.imgPath,
        required this.namOfSoup,
        required this.prcOfSoup});
}
