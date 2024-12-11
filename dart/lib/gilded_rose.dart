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
            items[i].quality++;
            if (item.sellIn <= 10) items[i].quality++;
            if (item.sellIn <= 5) items[i].quality++;
            if (item.sellIn == 0) items[i].quality = 0;
          }
          //default case
          else {
            items[i].quality++;
          }
        }
        items[i].sellIn--;
      }

      //calculate normal item
      if (isNormalItem) {
        items[i].sellIn--;

        if (item.quality > 0) {
          items[i].quality--;
          //if is overdate
          if (item.sellIn < 0) {
            items[i].quality--;
          }
        }
      }

      //if product is overdate
      if (item.sellIn < 0) {
        //calculate quality for overdate Brie
        if (item.name == "Aged Brie" && item.quality < 50) {
          items[i].quality++;
        }
      }
    }
  }
}
