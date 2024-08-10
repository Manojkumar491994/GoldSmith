import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  List<GridClass> grid = [
    GridClass(
        productName: "Ring",
        productPrize: 10000,
        productWeight: 8.0,
        productImg:
        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTG5FXUFpRybS2rhjw6ADrv7KhiPgF0L0rp-WbzAU6jQGZf68_M9aELhEULtN4kD1lIGXPwOPIephhW4ek4FbwuQ0rfFM5mEHPGVWSUXregCJWFLYMdxyckig"),
    GridClass(
        productName: "Chain",
        productPrize: 20000,
        productWeight: 8.0,
        productImg:
        "https://rukminim2.flixcart.com/image/850/1000/kdxfc7k0/necklace-chain/b/x/4/ch103-gold-plated-plated-brass-chain-chain-arjun-navratn-original-imafupd7fnvswpdy.jpeg?q=90&crop=false"),
    GridClass(
        productName: "doller",
        productPrize: 10000,
        productWeight: 8.0,
        productImg:
        "https://m.media-amazon.com/images/I/71p1viC0ZRL._SY695_.jpg"),
    GridClass(
        productName: "doller",
        productPrize: 10000,
        productWeight: 8.0,
        productImg:
        "https://m.media-amazon.com/images/I/71p1viC0ZRL._SY695_.jpg"),
    GridClass(
        productName: "doller",
        productPrize: 10000,
        productWeight: 8.0,
        productImg:
        "https://m.media-amazon.com/images/I/71p1viC0ZRL._SY695_.jpg"),
    GridClass(
        productName: "doller",
        productPrize: 10000,
        productWeight: 8.0,
        productImg:
        "https://m.media-amazon.com/images/I/71p1viC0ZRL._SY695_.jpg"),
    GridClass(
        productName: "Ring",
        productPrize: 10000,
        productWeight: 8.0,
        productImg:
        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTG5FXUFpRybS2rhjw6ADrv7KhiPgF0L0rp-WbzAU6jQGZf68_M9aELhEULtN4kD1lIGXPwOPIephhW4ek4FbwuQ0rfFM5mEHPGVWSUXregCJWFLYMdxyckig"),
    GridClass(
        productName: "Chain",
        productPrize: 20000,
        productWeight: 8.0,
        productImg:
        "https://rukminim2.flixcart.com/image/850/1000/kdxfc7k0/necklace-chain/b/x/4/ch103-gold-plated-plated-brass-chain-chain-arjun-navratn-original-imafupd7fnvswpdy.jpeg?q=90&crop=false"),
    GridClass(
        productName: "doller",
        productPrize: 10000,
        productWeight: 8.0,
        productImg:
        "https://m.media-amazon.com/images/I/71p1viC0ZRL._SY695_.jpg"),
    GridClass(
        productName: "doller",
        productPrize: 10000,
        productWeight: 8.0,
        productImg:
        "https://m.media-amazon.com/images/I/71p1viC0ZRL._SY695_.jpg"),
    GridClass(
        productName: "doller",
        productPrize: 10000,
        productWeight: 8.0,
        productImg:
        "https://m.media-amazon.com/images/I/71p1viC0ZRL._SY695_.jpg"),

  ];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 52),
            child: GridView.builder(
                itemCount: grid.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                padding: EdgeInsets.all(8.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){

                    }
                    ,
                    child: Card(
                      elevation: 10,
                      child: Column(
                        children: [
                          Expanded(child: Image.network(grid[index].productImg!)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${grid[index].productName}"),
                              Text("${grid[index].productWeight}"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Rs. ${grid[index].productPrize}"),
                              GestureDetector(child: Icon(Icons.add_shopping_cart))
                            ],
                          )

                        ],
                      ),
                    ),
                  );
                }),
          ),
      ),
    );
  }
}
