import 'package:gilded_rose/basic_item.dart';
import 'package:gilded_rose/conjured_item.dart';
import 'package:gilded_rose/item.dart';
import 'package:gilded_rose/special_item.dart';

class GildedRose {
  List<Item> items;
  List<String> _specialItems = [
    "Aged Brie",
    "Backstage passes to a TAFKAL80ETC concert"
  ];
  List<String> _legendaryItems = ["Sulfuras, Hand of Ragnaros"];
  List<String> _conjuredItems = ["Conjured Mana Cake"];

  GildedRose(this.items);

  void updateQuality() {
    for (int i = 0; i < items.length; i++) {
      Item item = items[i];
      bool isSpecialItem = _specialItems.contains(item.name);
      bool isLegendaryItem = _legendaryItems.contains(item.name);
      bool isConjuredItem = _conjuredItems.contains(item.name);
      bool isNormalItem = !isSpecialItem && !isLegendaryItem && !isConjuredItem;

      if (isSpecialItem) {
        if (item is SpecialItem) {
          item.update();
        } else {
          _updateSpecialProduct(item);
        }
      }

      if (isNormalItem) {
        if (item is BasicItem) {
          item.update();
        } else {
          _updateNormalProduct(item);
        }
      }

      if (item is ConjuredItem) {
        item.update();
      }
    }
  }

  void _updateSpecialProduct(Item item) {
    bool tenDaysOrLessForExpirationDate = item.sellIn <= 10;
    bool fiveDaysOrLessForExpirationDate = item.sellIn <= 5;
    bool isExpirationToday = item.sellIn == 0;
    if (_hasItemReachedItsMaximumValue(item)) {
      //backstage case
      if (item.name == "Backstage passes to a TAFKAL80ETC concert") {
        item.quality++;
        if (_hasItemReachedItsMaximumValue(item) &&
            tenDaysOrLessForExpirationDate) {
          item.quality++;
        }
        if (_hasItemReachedItsMaximumValue(item) &&
            fiveDaysOrLessForExpirationDate) {
          item.quality++;
        }
        if (isExpirationToday) {
          item.quality = 0;
        }
      }
      //default case
      else {
        //if product is overdate
        if (item.name == "Aged Brie" && item.sellIn < 0) {
          item.quality++;
        }
        item.quality++;
      }
    }
    item.sellIn--;
  }

  bool _hasItemReachedItsMaximumValue(Item item) {
    return item.quality < 50;
  }

  void _updateNormalProduct(Item item) {
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
