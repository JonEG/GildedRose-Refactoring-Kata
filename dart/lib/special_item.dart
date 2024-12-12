import 'package:gilded_rose/item.dart';
import 'package:gilded_rose/item_interface.dart';

class SpecialItem extends Item implements ItemInterface {
  SpecialItem(String name, int sellIn, int quality)
      : super(name, sellIn, quality);

  @override
  update() {
    bool tenDaysOrLessForExpirationDate = sellIn <= 10;
    bool fiveDaysOrLessForExpirationDate = sellIn <= 5;
    bool isExpirationToday = sellIn == 0;
    if (_hasItemReachedItsMaximumValue()) {
      //backstage case
      if (name == "Backstage passes to a TAFKAL80ETC concert") {
        quality++;
        if (_hasItemReachedItsMaximumValue() &&
            tenDaysOrLessForExpirationDate) {
          quality++;
        }
        if (_hasItemReachedItsMaximumValue() &&
            fiveDaysOrLessForExpirationDate) {
          quality++;
        }
        if (isExpirationToday) {
          quality = 0;
        }
      }
      //default case
      else {
        //if product is overdate
        if (name == "Aged Brie" && sellIn < 0) {
          quality++;
        }
        quality++;
      }
    }
    sellIn--;
  }

  bool _hasItemReachedItsMaximumValue() {
    return quality < 50;
  }
}
