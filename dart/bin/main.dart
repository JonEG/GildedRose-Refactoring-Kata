import 'package:gilded_rose/basic_item.dart';
import 'package:gilded_rose/gilded_rose.dart';
import 'package:gilded_rose/item.dart';
import 'package:gilded_rose/legendary_item.dart';
import 'package:gilded_rose/special_item.dart';

main(List<String> args) {
  List<Item> items = [
    new BasicItem("+5 Dexterity Vest", 10, 20),
    new SpecialItem("Aged Brie", 2, 0),
    new SpecialItem("Aged Brie", -2, 0),
    new BasicItem("Elixir of the Mongoose", 5, 7),
    new LegendaryItem("Sulfuras, Hand of Ragnaros", 0, 80),
    new LegendaryItem("Sulfuras, Hand of Ragnaros", -1, 80),
    new SpecialItem("Backstage passes to a TAFKAL80ETC concert", 15, 20),
    new SpecialItem("Backstage passes to a TAFKAL80ETC concert", 10, 49),
    new SpecialItem("Backstage passes to a TAFKAL80ETC concert", 5, 49),
    // this conjured item does not work properly yet
    new Item("Conjured Mana Cake", 3, 6)
  ];

  GildedRose app = new GildedRose(items);

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
