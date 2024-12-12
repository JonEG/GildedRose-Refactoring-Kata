import 'package:gilded_rose/interfaces/item.dart';

class GildedRose {
  List<Item> items;

  GildedRose(this.items);

  void updateQuality() {
    for (Item item in items) {
      item.update();
    }
  }
}
