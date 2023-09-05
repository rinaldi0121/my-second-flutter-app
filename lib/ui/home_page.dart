import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/local_restaurant.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/ui/restaurant_details.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/homePage';

  Future<List<Restaurant>> _loadData(BuildContext context) async {
    final jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/local_restaurant.json');

    final welcome = welcomeFromJson(jsonString);

    return welcome.restaurants;
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder<List<Restaurant>>(
      future: _loadData(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No data available');
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final restaurant = snapshot.data![index];
              return _buildRestaurantItem(context, restaurant);
            },
          );
        }
      },
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 10, bottom: 19, right: 10),
        dense: true,
        visualDensity: const VisualDensity(vertical: 4),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Hero(
            tag: restaurant,
            child: Image.network(
              restaurant.pictureId,
              width: 100,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (ctx, error, _) => const Center(
                child: Icon(Icons.error_outline),
              ),
            ),
          ),
        ),
        title: Text(
          restaurant.name,
          style: myTextTheme.titleLarge,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_pin,
                  size: 16,
                  color: Colors.red,
                ),
                Text(
                  restaurant.city,
                  style: myTextTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 11),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.star,
                  size: 17,
                  color: Colors.amber,
                ),
                Text(
                  '${restaurant.rating}',
                  style: myTextTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailPage.routeName,
              arguments: restaurant);
        },
      ),
    );
  }

  NestedScrollView _buildAllContent(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, isScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 150,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Restaurant',
                      style: myTextTheme.displayMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Recommendation restaurant for you!',
                      style: myTextTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
              title: LayoutBuilder(
                builder: (context, costraints) {
                  return Text(
                    costraints.maxHeight > 79 ? '' : 'Restaurant',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  );
                },
              ),
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
            ),
          ),
        ];
      },
      body: _buildList(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildAllContent(context),
    );
  }
}
