import 'package:flutter/material.dart';

class Cart_Products extends StatefulWidget {
  @override
  _Cart_ProductsState createState() => _Cart_ProductsState();
}

class _Cart_ProductsState extends State<Cart_Products> {
  var Products_on_carts = [
    {
      "name": "Head Band",
      "picture": "UtilityImages/black-black-1024x1024.jpg",
      "price": 40,
      "size": "M",
      "color": "Black",
      "Quantity": 1
    },
    {
      "name":"Refree",
      "picture":"UtilityImages/Refree-Kits.png",
      "price":40,
      "size": "L",
      "color": "White",
      "Quantity": 3
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: Products_on_carts.length,
      itemBuilder:(context, index){
        return Single_Cart_Product(
          cart_product_name: Products_on_carts[index]["name"],
          cart_prod_color: Products_on_carts[index]["color"],
          cart_prod_qty: Products_on_carts[index]["Quantity"],
          cart_prod_pict: Products_on_carts[index]["picture"],
          cart_prod_price: Products_on_carts[index]["price"],
          cart_product_size: Products_on_carts[index]["size"],
        );
      },);
  }
}
class Single_Cart_Product extends StatelessWidget {
  final cart_product_name;
  final cart_prod_pict;
  final cart_prod_price;
  final cart_product_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_Cart_Product({
    this.cart_product_name,
    this.cart_prod_pict,
    this.cart_prod_price,
    this.cart_product_size,
    this.cart_prod_color,
    this.cart_prod_qty
});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
// LEADING SECTION
          leading: new Image.asset(cart_prod_pict),
// TITLE SECTION
          title: new Text(
            cart_product_name
          ),
// SUBTITLE ACTION
          subtitle: new Column(
            children: [
              //Row In The Column
              Row(
                children: [
 //SIZE OF PRODUCTS
                 Padding(
                   padding: const EdgeInsets.all(0.0),
                   child: new Text("Size:"),
                 ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: new Text(cart_product_size, style: TextStyle(color: Colors.black),),
                  ),
//COLOR OF PRODUCT
                  new Padding(padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                      child: new Text("Color:"),),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: new Text(cart_prod_color, style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
// PRODUCT PRICE
            new Container(
              alignment: Alignment.topLeft,
              child: new Text("\$$cart_prod_price",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),),
            ),
            ],
          ),
          trailing: SingleChildScrollView(
            child: new Column(
                  children: [
                    new IconButton(icon: Icon(Icons.arrow_drop_up), splashRadius:18,onPressed:(){}),
                    Text('$cart_prod_qty'),
                    new IconButton(icon: Icon(Icons.arrow_drop_down),  splashRadius:15, onPressed:(){}),
                  ],
                ),
          ),
          ),
      ),
    );
  }
}

