// ignore: non_constant_identifier_names
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:utilityapp/Components/horizontal_listview.dart';
import 'package:utilityapp/Components/Products.dart';
import 'package:utilityapp/pages/Cart.dart';
import 'package:utilityapp/pages/Login.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget Image_carousel = new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('UtilityImages/2019-1-1024x1024.jpg'),
          AssetImage('UtilityImages/buff-1024x1024.jpg'),
          AssetImage('UtilityImages/christmas-baglamali-yesil-beyaz-1024x1024.jpg'),
          AssetImage('UtilityImages/ekru-1024x1024.jpg'),
          AssetImage('UtilityImages/maske-1-1024x1024.jpg'),
          AssetImage('UtilityImages/white-yellow-1024x1024.jpg'),
        ],
        autoplay: true,
        dotSize: 4,
        indicatorBgPadding: 6.0,
        dotBgColor: Colors.transparent,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
    return Scaffold(

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
        title: Text('Utility Appearel', style: TextStyle(color: Colors.white)),
        actions: [
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: ()
          { Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart()));})
        ],
      ),
      drawer: new Drawer(
          child: ListView(
            children: [
              new UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.green),
                accountName: Text('Ahmet Said Olgun'),
                accountEmail: Text('aolgun98@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person),
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Home Page'),
                  leading: Icon(Icons.home, color: Colors.black),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('My Account'),
                  leading: Icon(Icons.person, color: Colors.black),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Store'),
                  leading: Icon(Icons.home, color: Colors.black),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('References'),
                  leading: Icon(Icons.room_preferences, color: Colors.black),
                ),
              ),

              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('My Orders'),
                  leading: Icon(Icons.shopping_basket_rounded, color: Colors.black),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart()));
                },
                child: ListTile(
                  title: Text('Shopping Cart'),
                  leading: Icon(Icons.add_shopping_cart, color: Colors.black),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Favorites'),
                  leading: Icon(Icons.favorite, color: Colors.black),
                ),
              ),
              Divider(thickness: 3, color: Colors.blueGrey,),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Contact'),
                  leading: Icon(Icons.phone, color: Colors.black),
                ),
              ),
              InkWell(
                onTap: (){},
                child: ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings, color: Colors.black),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>new Login()));
                },
                child: ListTile(
                  title: Text('Sign Out'),
                  leading: Icon(Icons.exit_to_app, color: Colors.black),
                ),
              ),
            ],
          )
      ),
      body: ListView(
        children: [
          Image_carousel,
          new Padding(padding: const EdgeInsets.all(3.0),
            child: Text('Categories', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Colors.black38)),),

          HorizontalList(),
          new Padding(padding: const EdgeInsets.only(top:0),
            child: Text('RecentProducts', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20, color: Colors.black38)),),

          Container(
            height: 320.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}

