import 'package:gilded_rose/item.dart';
import 'package:gilded_rose/item_interface.dart';

class ConjuredItem extends Item implements ItemInterface {
  ConjuredItem(String name, int sellIn, int quality)
      : super(name, sellIn, quality);

  @override
  update() {
    //reduce days
    sellIn--;
    if (quality > 0) {
      //reduce quality
      quality -= 2;
    }
    //if expired then reduce quality again
    if (quality > 0 && sellIn < 0) {
      quality -= 2;
    }
  }
}
