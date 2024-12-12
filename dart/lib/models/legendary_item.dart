import 'package:gilded_rose/interfaces/item.dart';

class LegendaryItem extends Item {
  LegendaryItem(String name, int sellIn, int quality)
      : super(name, sellIn, quality);

  @override
  update() {
    //do nothing
  }
}
