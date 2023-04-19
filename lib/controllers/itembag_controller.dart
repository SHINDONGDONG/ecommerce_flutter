
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


List<ProductModel> itemBag = [];

class ItemBagNotifier extends StateNotifier<List<ProductModel>>{
  ItemBagNotifier(): super(itemBag);

  //add new item

  void addNewItemBag(ProductModel productModel) {
    state = [...state, productModel];
  }

  void removeItem(int pid){
    state = [
      for(final product in state)
        if(product.pid != pid) product,
    ];
  }
}

final itemBagProvider = StateNotifierProvider<ItemBagNotifier, List<ProductModel>>((ref) {
  return ItemBagNotifier();
});