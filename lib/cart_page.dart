import 'package:e_gold/controller/CounterModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer<CounterModel>(
          builder: (BuildContext context, CounterModel value, Widget? child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.carts.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 10,
                              child: Card(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 100,
                                        height: 100,
                                        child: Image.network(
                                          value.carts[index].Image,
                                        )),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                    width : MediaQuery.of(context).size.width/1.5,
                                            child: Text(
                                          value.carts[index].title,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                        Text(value.carts[index].price
                                            .toString()),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Provider.of<CounterModel>(context, listen: false)
                              .carts
                              .clear();
                        },
                        child: Text("Clear")),
                    ElevatedButton(onPressed: () {}, child: Text("Checkout "))
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
