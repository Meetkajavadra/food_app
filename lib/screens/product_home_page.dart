import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:provider/provider.dart';
import '../../../providers/product_provider.dart';
import '../../global.dart';
import '../helpers/product_db_helper.dart';
import '../models/produts.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({Key? key}) : super(key: key);

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  String search = "";

  bool act1 = true;
  bool act2 = false;
  bool act3 = false;
  bool act4 = false;
  late Future<RxList<Product>> productDataList;
  late Future<List<Product>> productList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productList = ProductDBHelper.productDBHelper.fetchAllData();
    log(productList.toString(), name: "Product List Data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.decrease_indent,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      CupertinoIcons.location_solid,
                      color: Colors.green,
                      size: 25,
                    ),
                    Text(
                      "Surat",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  child: Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Hi Meet..!",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Find your food",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 30),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green.shade100,
                border: InputBorder.none,
                hintText: "Search Food",
                hintStyle: TextStyle(fontSize: 18),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.green,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                suffixIcon: Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                      setState(() {
                        act1 = true;
                        act2 = false;
                        act3 = false;
                        act4 = false;
                      });
                    },
                    child: Text(
                      "Food",
                      style: TextStyle(
                        color: (act1) ? Colors.green : Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        act1 = false;
                        act2 = true;
                        act3 = false;
                        act4 = false;
                      });
                    },
                    child: Text(
                      "Vegetable",
                      style: TextStyle(
                        color: (act2) ? Colors.green : Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        act1 = false;
                        act2 = false;
                        act3 = true;
                        act4 = false;
                      });
                    },
                    child: Text(
                      "Deserts",
                      style: TextStyle(
                        color: (act3) ? Colors.green : Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        act1 = false;
                        act2 = false;
                        act3 = false;
                        act4 = true;
                      });
                    },
                    child: Text(
                      "Fast Food",
                      style: TextStyle(
                        color: (act4) ? Colors.green : Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 328,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (act1) ...[
                      Row(
                        children: [
                          productContainer(
                            id: 1,
                            context: context,
                            image: "assets/images/pasta.png",
                            name: "Pasta",
                            price: 15,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page",
                                  arguments: products[0]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context,
                                      listen: false)
                                  .addProduct(product: products[0]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          productContainer(
                            id: 2,
                            context: context,
                            image: "assets/images/pizza.png",
                            name: "Pizza",
                            price: 10,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page",
                                  arguments: products[1]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context,
                                      listen: false)
                                  .addProduct(product: products[1]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          productContainer(
                            id: 3,
                            context: context,
                            image: "assets/images/burger.png",
                            name: "Burger",
                            price: 25,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page",
                                  arguments: products[2]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context,
                                      listen: false)
                                  .addProduct(product: products[2]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ] else if (act2) ...[
                      Row(
                        children: [
                          productContainer(
                            id: 7,
                            context: context,
                            image: "assets/images/salad.png",
                            name: "Salad",
                            price: 23,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page",
                                  arguments: products[6]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context,
                                      listen: false)
                                  .addProduct(product: products[6]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                        ],
                      ),
                    ] else if (act4) ...[
                      Row(
                        children: [
                          productContainer(
                            id: 5,
                            context: context,
                            image: "assets/images/cake.png",
                            name: "Cake",
                            price: 100,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page",
                                  arguments: products[9]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context,
                                      listen: false)
                                  .addProduct(product: products[9]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Row(
                        children: [
                          productContainer(
                            id: 6,
                            context: context,
                            image: "assets/images/pancake.png",
                            name: "Pan Cake",
                            price: 150,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page",
                                  arguments: products[11]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context,
                                      listen: false)
                                  .addProduct(product: products[11]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          productContainer(
                            id: 7,
                            context: context,
                            image: "assets/images/donute.png",
                            name: "Donute",
                            price: 220,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page",
                                  arguments: products[12]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context,
                                      listen: false)
                                  .addProduct(product: products[12]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ] else ...[
                      Row(
                        children: [
                          productContainer(
                            id: 8,
                            context: context,
                            image: "assets/images/soup.png",
                            name: "Soup",
                            price: 420,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page",
                                  arguments: products[13]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context,
                                      listen: false)
                                  .addProduct(product: products[13]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          productContainer(
                            id: 9,
                            context: context,
                            image: "assets/images/sandwich.png",
                            name: "Sandwich",
                            price: 580,
                            onTap: () {
                              Navigator.pushNamed(context, "product_page",
                                  arguments: products[14]);
                            },
                            plusButtonPressed: () {
                              Provider.of<ProductController>(context,
                                      listen: false)
                                  .addProduct(product: products[14]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Product Added To cart"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
