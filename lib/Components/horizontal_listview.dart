// ignore: non_constant_identifier_names
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            Image_location: 'Categories/atki.png',
            Image_caption: 'Scarf',
          ),
          Category(
            Image_location: 'Categories/corap.png',
            Image_caption: 'Socks',
          ),
          Category(
            Image_location: 'Categories/jersey.png',
            Image_caption: 'Jersey',
          ),
          Category(
            Image_location: 'Categories/Maske.png',
            Image_caption: 'Mask',
          ),
          Category(
            Image_location: 'Categories/short.png',
            Image_caption: 'Short',
          ),
          Category(
            Image_location: 'Categories/sportsbra.png',
            Image_caption: 'SportsBra',
          ),
        ],
      ),
    );
  }
}
class Category extends StatelessWidget {
  final String Image_location;
  final String Image_caption;
  Category({
    this.Image_location,
    this.Image_caption
});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
      child: InkWell(onTap: (){},
      child: Container(
        width: 100,
        height: 50.0,
        child: ListTile(
          title: Image.asset(Image_location , height: 50.0,),
          subtitle: Container(
            alignment: Alignment.topCenter,
              child: Text(Image_caption)
          ),
        ),
      ),
      ),
    );

  }
}
