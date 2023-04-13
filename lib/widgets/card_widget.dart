import 'package:ecommerce_flutter/controllers/product_controller.dart';
import 'package:ecommerce_flutter/data/product_list.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../constatns/themes.dart';

class ProductCardWidget extends ConsumerWidget {
  const ProductCardWidget({
    super.key,
    required this.productIndex,
  });

  final int productIndex;


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final product = ref.watch(productNotifierProvider);
    return Container(
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
          margin: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width * .5,

          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(12),
                  color: kLightBackground,
                  child: Image.asset(product[productIndex].imgUrl),
                ),
              ),
              const Gap(4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product[productIndex].title,
                      style: AppTheme.kCardTitle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      product[productIndex].shortDescription,
                      style: AppTheme.kBodyText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${product[productIndex].price}',
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
      );
    //);
  }
}
