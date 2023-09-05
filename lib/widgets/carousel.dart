import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';

class Carousel extends StatefulWidget {
  const Carousel(
      {Key? key,
      required this.culinary,
      required this.pictureId,
      required this.second})
      : super(key: key);

  final List culinary;
  final String pictureId;
  final int second;

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 110.0,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: widget.second),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: List.generate(widget.culinary.length, (index) {
        var culinaryName = widget.culinary[index];
        String variant = culinaryName.name;
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(widget.pictureId),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Text(
                    variant,
                    style: const TextStyle(
                      color: secondaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
