import 'package:ecommerce_flutter/constatns/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../widgets/ads_banner_widget.dart';
import '../widgets/card_widget.dart';
import '../widgets/chip_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kSecondaryColor,
        title: SvgPicture.asset(
          "assets/general/store_brand_white.svg",
          color: kWhiteColor,
          width: 180,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.local_mall_outlined)),
          )
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              AdsBannerWidget(),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: const [
                    ChipWidget(
                      chipLabel: 'All',
                    ),
                    ChipWidget(
                      chipLabel: 'Computers',
                    ),
                    ChipWidget(
                      chipLabel: 'Headsets',
                    ),
                    ChipWidget(
                      chipLabel: 'Accessior',
                    ),
                    ChipWidget(
                      chipLabel: 'Printing',
                    ),
                    ChipWidget(
                      chipLabel: 'Cameras',
                    ),
                  ],
                ),
              ),
              const Gap(
                12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Hot Sales',
                    style: AppTheme.kHeadingOne,
                  ),
                  Text(
                    'See All',
                    style: AppTheme.kSellAllText,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(4),
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                  padding: const EdgeInsets.all(4),
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context,index) =>const ProductCardWidget(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Featured Products',
                    style: AppTheme.kHeadingOne,
                  ),
                  Text(
                    'See All',
                    style: AppTheme.kSellAllText,
                  ),
                ],
              ),

              MasonryGridView.builder(
                itemCount: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => const SizedBox(
                  height: 250,
                  child: ProductCardWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

