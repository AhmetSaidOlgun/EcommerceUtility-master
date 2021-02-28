import 'package:flutter/material.dart';
import 'package:utilityapp/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var prduct_list = [
    {
      "name":"Head Band",
      "picture":"UtilityImages/black-black-1024x1024.jpg",
      "old_price":120,
      "price":40,
    },
    {
      "name":"T-shirt",
      "picture":"UtilityImages/beyaz-secret-heart-t-shirt-1024x1024.jpg",
      "old_price":120,
      "price":40,
    },
    {
      "name":"Blue Buff",
      "picture":"UtilityImages/buff-1024x1024.jpg",
      "old_price":120,
      "price":40,
    },
    {
      "name":"Zipper",
      "picture":"UtilityImages/hoodie-zipper.png",
      "old_price":120,
      "price":40,
    },
    {
      "name":"Snitch Jersey",
      "picture":"UtilityImages/new-1024x1024.jpg",
      "old_price":120,
      "price":40,
    },
    {
      "name":"Refree",
      "picture":"UtilityImages/Refree-Kits.png",
      "old_price":120,
      "price":40,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: prduct_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder:(BuildContext context, int index){
        return Single_prod(
          product_name: prduct_list[index]['name'],
          prod_pict: prduct_list[index]['picture'],
          prod_oldprice: prduct_list[index]['old_price'],
          prod_price: prduct_list[index]['price'],
        );
      } );
  }
}
class Single_prod extends StatelessWidget {
  final product_name;
  final prod_pict;
  final prod_oldprice;
  final prod_price;

  Single_prod(
  {this.product_name,
    this.prod_pict,
    this.prod_oldprice,
    this.prod_price}
      );
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(tag: product_name,
        child: Material(
          child: InkWell(
            onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                //passing values from product to product details
                builder: (context)=> ProductDetails(
              product_detail_name: product_name,
              product_detail_new_price: prod_price,
              product_detail_old_price: prod_oldprice,
              product_detail_picture: prod_pict,
            ))),

            child: GridTile(
                footer: Container(
                color: Colors.white,
                    child: ListTile(leading: Text(product_name, style: TextStyle(fontWeight: FontWeight.bold),),
                      title:  Text('\$$prod_price', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text('\$$prod_oldprice', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800,decoration: TextDecoration.lineThrough),),
                ),
                ),
                child: Image.asset(prod_pict, fit: BoxFit.cover,)),
          ),),),
    );
  }
}

