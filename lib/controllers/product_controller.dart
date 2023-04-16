
import 'package:ecommerce_flutter/data/product_list.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends StateNotifier<List<ProductModel>>{
  ProductNotifier() : super(productItems);

  void incrementQty(int pid){
    state = [
      for(final product in state)
        if(product.pid == pid)
          product.copyWith(qty: product.qty += 1)
          else
          product,
    ];
   }
   void decreaseQty(int pid){
    state = [
      for(final product in state)
        if(product.pid == pid)
          product.copyWith(qty: product.qty -= 1)
      else
        product,
    ];
   }
  }


final productNotifierProvider =
  StateNotifierProvider<ProductNotifier,List<ProductModel>>((ref) {
  return ProductNotifier();
});