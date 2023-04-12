import 'package:ecommerce_flutter/data/product_list.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constatns/themes.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(4),
      // height: 300,
      // width: double.infinity,
      child: //ListView.builder(
        // padding: const EdgeInsets.all(8),
        // itemCount: 3,
        // scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        //itemBuilder: (context, index) =>
        Container(
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: Offset(0,6),
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          margin: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width * .5,

          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(12),
                  color: kLightBackground,
                  child: Image.asset('assets/products/airpods.jpg'),
                ),
              ),
              const Gap(4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Product name Sample one size",
                      style: AppTheme.kCardTitle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text("Short Description Product",
                      style: AppTheme.kBodyText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('\$854',
                          style: AppTheme.kCardTitle,),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_circle,size: 30,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    //);
  }
}
