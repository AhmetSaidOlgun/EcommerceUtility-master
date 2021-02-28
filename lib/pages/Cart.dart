import 'package:flutter/material.dart';
import 'package:utilityapp/Components/cart_prodducts.dart';
import 'package:utilityapp/main.dart';
import 'package:utilityapp/pages/Home.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('UtilityImages/iconofutılıty.png'),
                  fit: BoxFit.contain
              )
          ),
        ),
        title: InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));},
            child: Text('Utility Appearel', style: TextStyle(color: Colors.white) )),
        actions: [
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){})
        ],
      ),

      body: new Cart_Products(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(child: new ListTile(
              title: new Text('Total:'),
              subtitle: new Text('\$230'),
            ),
            ),
            Expanded(child: new MaterialButton(onPressed: (){},
            child: new Text('Check Out',style: TextStyle(color: Colors.white),),
              color: Colors.red,
            )
            )
          ],
        ),
      ),
    );
  }
}
