import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/local_restaurant.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/widgets/carousel.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({Key? key, required this.restaurant})
      : super(key: key);

  static const routeName = '/restaurantDetailPage';

  final Restaurant restaurant;

  SliverAppBar _sliverHeader(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: const CircleAvatar(
          maxRadius: 20,
          backgroundColor: secondaryColor,
          child: Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      expandedHeight: 280,
      pinned: false,
      floating: true,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          return FlexibleSpaceBar(
            title: constraints.maxHeight < 107
                ? Text(
                    restaurant.name,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                : Container(),
            titlePadding: const EdgeInsets.only(left: 60, bottom: 17),
            background: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: restaurant.pictureId,
                child: Image.network(
                  restaurant.pictureId,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  SliverFillRemaining _details(BuildContext context) {
    return SliverFillRemaining(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              style: myTextTheme.headlineMedium,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                ),
                const SizedBox(width: 5),
                Text(
                  restaurant.city,
                  style: myTextTheme.bodyLarge,
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const SizedBox(width: 5),
                Text(
                  '${restaurant.rating}',
                  style: myTextTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Deskripsi',
              style: myTextTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              restaurant.description,
              textAlign: TextAlign.justify,
              style: myTextTheme.bodyMedium,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              'Menu',
              style: myTextTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Carousel(
              pictureId: restaurant.pictureId,
              culinary: restaurant.menus.foods,
              second: 3,
            ),
            const SizedBox(height: 8),
            Carousel(
              pictureId: restaurant.pictureId,
              culinary: restaurant.menus.drinks,
              second: 5,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _sliverHeader(context),
          _details(context),
        ],
      ),
    );
  }
}
