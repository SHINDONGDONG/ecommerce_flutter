import 'package:ecommerce_flutter/constatns/themes.dart';
import 'package:ecommerce_flutter/controllers/product_controller.dart';
import 'package:ecommerce_flutter/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';


class DetailsPage extends ConsumerWidget {
  DetailsPage({Key? key, required this.getIndex}) : super(key: key);

  int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final product = ref.watch(productNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: const Text('Details Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.local_mall_outlined)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: kLightBackground,
              child: Image.asset(product[getIndex].imgUrl),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product[getIndex].title,style: AppTheme.kBigTitle.copyWith(color: kPrimaryColor),),
              Row(
                children: [
                  RatingBar.builder(
                    itemSize: 15,
                    initialRating:product[getIndex].rating,
                    minRating: 0.5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                    },
                  ),
                  const Gap(12),
                  Text('${product[getIndex].reviews} reviews'),
                ],
              ),
                  const Gap(8),
                  Text(product[getIndex].longDescription),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${product[getIndex].price * product[getIndex].qty}',style: AppTheme.kHeadingOne,),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              ref.read(productNotifierProvider.notifier)
                                  .decreaseQty(product[getIndex].pid);
                            },
                            icon: const Icon(Icons.do_not_disturb_on_outlined,size: 30,),
                          ),
                          Text(product[getIndex].qty.toString(),style: AppTheme.kCardTitle.copyWith(fontSize: 24),),
                          IconButton(
                            onPressed: () {
                              ref.read(productNotifierProvider.notifier)
                                  .incrementQty(product[getIndex].pid);
                            },
                            icon: const Icon(Icons.add_circle_outline,size: 30,),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      minimumSize: const Size(double.infinity,50),
                    ),
                    onPressed: () {},
                    child: const Text('Add item to bag'),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kSecondaryColor,
          currentIndex: currentIndex,
          onTap: (value) => ref.read(currentIndexProvider.notifier).update((state) => value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              activeIcon: Icon(Icons.home_filled),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'Favorite',
              activeIcon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: 'Location',
              activeIcon: Icon(Icons.location_on),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: 'Notification',
              activeIcon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
              activeIcon: Icon(Icons.person),
            ),
          ],
        ),
    );
  }
}
