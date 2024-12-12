import 'package:gilded_rose/item.dart';
import 'package:gilded_rose/item_interface.dart';

class BasicItem extends Item implements ItemInterface {
  BasicItem(String name, int sellIn, int quality)
      : super(name, sellIn, quality);

  void update() {
    //reduce days
    sellIn--;
    if (quality > 0) {
      //reduce quality
      quality--;
      //if expired then reduce quality again
      if (sellIn < 0) {
        quality--;
      }
    }
  }
}
