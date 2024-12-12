import 'package:gilded_rose/item.dart';

class GildedRose {
  List<Item> items;
  List<String> specialItems = [
    "Aged Brie",
    "Backstage passes to a TAFKAL80ETC concert"
  ];
  List<String> legendaryItems = ["Sulfuras, Hand of Ragnaros"];

  GildedRose(this.items);

  void updateQuality() {
    for (int i = 0; i < items.length; i++) {
      Item item = items[i];
      bool isSpecialItem = specialItems.contains(item.name);
      bool isLegendaryItem = legendaryItems.contains(item.name);
      bool isNormalItem = !isSpecialItem && !isLegendaryItem;

      //calculate special item
      if (isSpecialItem) {
        if (item.quality < 50) {
          //backstage case
          if (item.name == "Backstage passes to a TAFKAL80ETC concert") {
            item.quality++;
            if (item.quality < 50 && item.sellIn <= 10) item.quality++;
            if (item.quality < 50 && item.sellIn <= 5) item.quality++;
            if (item.sellIn == 0) item.quality = 0;
          }
          //default case
          else {
            //if product is overdate
            if (item.quality < 50 &&
                item.sellIn < 0 &&
                item.name == "Aged Brie") item.quality++;
            if (item.quality < 50) item.quality++;
          }
        }
        item.sellIn--;
      }

      //calculate normal item
      if (isNormalItem) {
        item.sellIn--;

        if (item.quality > 0) {
          item.quality--;
          //if is overdate
          if (item.sellIn < 0) {
            item.quality--;
          }
        }
      }
    }
  }
}
