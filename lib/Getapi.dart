import 'dart:convert';

import 'package:e_gold/cart_page.dart';
import 'package:e_gold/controller/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'Model/product2.dart';
import 'controller/CounterModel.dart';

class GetProducts extends StatefulWidget {
  const GetProducts({super.key});

  @override
  State<GetProducts> createState() => _GetProductsState();
}

class _GetProductsState extends State<GetProducts> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductsProvider>(context, listen: false).getProductsApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* body: FutureBuilder<List<Products>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Container(
                color: Colors.red,
                child: const Text("Error loading products"),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No products found"));
          } else {
            return
          }
        },
      ),*/
      body: SafeArea(
        child: Consumer2<ProductsProvider, CounterModel>(
          builder: (BuildContext context, ProductsProvider value,
              CounterModel value2, Widget? child) {
            return value.isApiError
                ? Center(child: Text("somthing Went Wrong ${value2.count}"))
                : value.isLoading
                    ? Center(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.shade200,
                          child: GridView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      height: 50,
                                      width: 50,
                                    )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Price: "),
                                        Text("Rating: "),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        ),
                      )
                    : Stack(
                        children: [
                          GridView.builder(
                            itemCount: value.futureProducts.length,
                            itemBuilder: (context, index) {
                              final product = value.futureProducts[index];
                              return Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: CachedNetworkImage(
                                        fit: BoxFit.contain,
                                        imageUrl: product.image,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Price: ${product.price}"),
                                        Text("Rating: ${product.rating?.rate}"),
                                        GestureDetector(
                                            onTap: () {
                                              Provider.of<CounterModel>(context,
                                                      listen: false)
                                                  .addToCart(Cart(
                                                id: product.id,
                                                title: product.title,
                                                price: product.price,
                                                Image: product.image,
                                              ));
                                            },
                                            child:
                                                Icon(Icons.add_shopping_cart))
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        product.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 1.5,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartPage()));
                              },
                              child: Card(
                                color: Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    size: 50,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
          },
        ),
      ),
    );
  }
}
