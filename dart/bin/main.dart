import 'package:gilded_rose/models/basic_item.dart';
import 'package:gilded_rose/gilded_rose.dart';
import 'package:gilded_rose/interfaces/item.dart';
import 'package:gilded_rose/models/conjured_item.dart';
import 'package:gilded_rose/models/legendary_item.dart';
import 'package:gilded_rose/models/special_item.dart';

main(List<String> args) {
  List<Item> items = [
    BasicItem("+5 Dexterity Vest", 10, 20),
    SpecialItem("Aged Brie", 2, 0),
    SpecialItem("Aged Brie", -2, 0),
    BasicItem("Elixir of the Mongoose", 5, 7),
    LegendaryItem("Sulfuras, Hand of Ragnaros", 0, 80),
    LegendaryItem("Sulfuras, Hand of Ragnaros", -1, 80),
    SpecialItem("Backstage passes to a TAFKAL80ETC concert", 15, 20),
    SpecialItem("Backstage passes to a TAFKAL80ETC concert", 10, 49),
    SpecialItem("Backstage passes to a TAFKAL80ETC concert", 5, 49),
    ConjuredItem("Conjured Mana Cake", 3, 6)
  ];

  GildedRose app = GildedRose(items);

  int days = 2;
  if (args.length > 0) {
    days = int.parse(args[0]) + 1;
  }

  for (int i = 0; i < days; i++) {
    print("-------- day $i --------");
    print("name, sellIn, quality");
    for (var item in items) {
      print(item);
    }
    print('');
    app.updateQuality();
  }
}
