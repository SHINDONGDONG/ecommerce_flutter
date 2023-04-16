
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


List<ProductModel> itemBag = [];

class ItemBagNotifier extends StateNotifier<List<ProductModel>>{
  ItemBagNotifier(): super(itemBag);
}

final itemBagProvider = StateNotifierProvider<ItemBagNotifier, List<ProductModel>>((ref) {
  return ItemBagNotifier();
});