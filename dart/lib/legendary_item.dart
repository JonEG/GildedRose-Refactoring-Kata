import 'package:gilded_rose/item.dart';
import 'package:gilded_rose/item_interface.dart';

class LegendaryItem extends Item implements ItemInterface {
  LegendaryItem(String name, int sellIn, int quality)
      : super(name, sellIn, quality);

  @override
  update() {
    //do nothing
  }
}
