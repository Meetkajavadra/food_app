import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/produts.dart';
import 'providers/product_provider.dart';

List<Product> products = [
  Product(
    id: 1,
    name: "donute",
    price: 20.0,
    image: "assets/images/donute.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 20.0,
  ),
  Product(
    id: 2,
    name: "Burger",
    price: 25.0,
    image: "assets/images/burger.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 25.0,
  ),
  Product(
    id: 3,
    name: "Cake",
    price: 19.0,
    image: "assets/images/cake.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 19.0,
  ),
  Product(
    id: 4,
    name: "Pancake",
    price: 15.0,
    image: "assets/images/pancake.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 15.0,
  ),
  Product(
    id: 5,
    name: "Pizza",
    price: 50.0,
    image: "assets/images/pizza.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 50.0,
  ),
  Product(
    id: 6,
    name: "Pasta",
    price: 10.0,
    image: "assets/images/pasta.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 10.0,
  ),
  Product(
    id: 7,
    name: "Salad",
    price: 5.0,
    image: "assets/images/salad.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 5.0,
  ),
  Product(
    id: 8,
    name: "Sandwich",
    price: 30.0,
    image: "assets/images/sandwich.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 30.0,
  ),
  Product(
    id: 9,
    name: "Veg Soup",
    price: 10.0,
    image: "assets/images/soup.png",
    quantity: 1,
    isLike: "false",
    dummyPrice: 10.0,
  ),
];

Widget productContainer(
    {required BuildContext context,
      required String image,
      required int id,
      required String name,
      required double price,
      required Function()? onTap,
      required Function()? plusButtonPressed}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Stack(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          height: height * 0.33,
          width: width * 0.44,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  offset: const Offset(0, 0),
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: (height * 0.26) / 1.5,
                width: width * 0.42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      image,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: -10,
                      right: -10,
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () async {
                          Provider.of<ProductController>(context, listen: false)
                              .likeProduct(product: products[id]);
                          log(products[id].isLike, name: "Is Like");
                          log(id.toString(), name: "Index");
                        },
                        icon: (products[id].isLike == "true")
                            ? Icon(
                          Icons.favorite,
                          size: 25,
                          color: Colors.red,
                        )
                            : Icon(
                          Icons.favorite_border,
                          size: 25,
                          color: Color(0XFFBAC2CD),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(
                  color: Color(0XFF1E2126),
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "20min",
                    style: TextStyle(
                      color: Color(0XFFBAC2CD),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Color(0XFFffc107),
                      ),
                      Text(
                        "2.5",
                        style: TextStyle(
                          color: Color(0XFFBAC2CD),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\$$price",
                    style: TextStyle(
                      color: Color(0XFF1E2126),
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      Positioned(
        bottom: -60,
        right: -60,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green,
          ),
          child: Align(
            alignment: Alignment(-1.1, -1.1),
            child: IconButton(
              onPressed: plusButtonPressed,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 27,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}