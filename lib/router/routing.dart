import 'package:flutter/material.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/ui/home_page.dart';
import 'package:restaurant_app/ui/restaurant_details.dart';
import 'package:restaurant_app/data/model/local_restaurant.dart';

// routing class
class Routing extends StatelessWidget {
  const Routing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Widget',
      // mengubah tema dengan mengambil nilai warna dari variabel di styles.dart
      theme: ThemeData(
        // menambahkan variabel myTextTheme yang merupakan list
        textTheme: myTextTheme,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // tema untuk appbar, menambahkan elevation(bayangan)
        appBarTheme: const AppBarTheme(elevation: 0),
        // tema button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            // variabel secondaryColor untuk tema tombol
            backgroundColor: secondaryColor,
            foregroundColor: Colors.white,
            // hanya mengubah shape tombol
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as Restaurant,
            ),
      },
    );
  }
}
