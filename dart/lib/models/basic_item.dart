import 'package:gilded_rose/interfaces/item.dart';

class BasicItem extends Item {
  BasicItem(String name, int sellIn, int quality)
      : super(name, sellIn, quality);

  @override
  update() {
    //reduce days
    sellIn--;
    if (quality > 0) {
      //reduce quality
      quality--;
    }
    //if expired then reduce quality again
    if (quality > 0 && sellIn < 0) {
      quality--;
    }
  }
}
