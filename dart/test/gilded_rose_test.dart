import 'dart:io';

import 'package:gilded_rose/item.dart';
import 'package:test/test.dart';
import 'package:gilded_rose/gilded_rose.dart';

main() {
  test("When comparing generated outputs then they are equal", () async {
    // Step 1: Run the command and capture its output
    var result = await Process.run('dart', ['run', 'bin/main.dart']);

    // The output of the command
    String output = result.stdout;

    // Step 2: Read the content of the original output file
    String originalOutput = await File('golden_master.txt').readAsString();

    // Step 3: Compare the outputs

    expect(output == originalOutput, true);
  });
  test("When Item updates then quality decreases", () {
    //Arrange
    var item = new Item("foo", 0, 1);
    int initialQuality = item.quality;
    var items = <Item>[item];
    GildedRose app = new GildedRose(items);
    //Act
    app.updateQuality();
    //Assert
    expect(initialQuality > app.items[0].quality, true);
  });
  test("When Item updates then days to sell decreases", () {
    //Arrange
    var item = new Item("foo", 0, 0);
    int initialDays = item.sellIn;
    var items = <Item>[item];
    GildedRose app = new GildedRose(items);
    //Act
    app.updateQuality();
    //Assert
    expect(initialDays > app.items[0].sellIn, true);
  });
  test("When Item date is passed then its quality decreases twice as fast", () {
    //Arrange
    var item = new Item("foo", 1, 10);
    int initialQuality = item.quality;
    var items = <Item>[item];
    GildedRose app = new GildedRose(items);
    //Act
    app.updateQuality();
    int firstQualityUpdate = app.items[0].quality;
    int firstQualityDecrease = initialQuality - firstQualityUpdate;
    app.updateQuality();
    int secondQualityUpdate = app.items[0].quality;
    int secondQualityDecrease = firstQualityUpdate - secondQualityUpdate;
    //Assert
    expect(firstQualityDecrease * 2 == secondQualityDecrease, true);
  });
  test('When Item updates its quality is never negative', () {
    //Arrange
    var item = new Item('foo', 0, 0);
    var items = <Item>[item];
    GildedRose app = new GildedRose(items);
    //Act
    app.updateQuality();
    //Assert
    expect(app.items[0].quality >= 0, true);
  });
  test("When updated Item is Aged Brie then quality increases", () {
    //Arrange
    var item = new Item("Aged Brie", 0, 0);
    int initialQuality = item.quality;
    var items = <Item>[item];
    GildedRose app = new GildedRose(items);
    //Act
    app.updateQuality();
    //Assert
    expect(initialQuality < app.items[0].quality, true);
  });
  test("When updated Item is Backstage passes then quality increases", () {
    //Arrange
    var item = new Item("Backstage passes to a TAFKAL80ETC concert", 1, 0);
    int initialQuality = item.quality;
    var items = <Item>[item];
    GildedRose app = new GildedRose(items);
    //Act
    app.updateQuality();
    //Assert
    expect(initialQuality < app.items[0].quality, true);
  });
  test(
      "When updated Item is Backstage and 10 days or less till concert then quality increases 2",
      () {
    const hotDaysLeft = [10, 6];
    for (var daysForTheConcert in hotDaysLeft) {
      //Arrange
      var item = new Item(
        "Backstage passes to a TAFKAL80ETC concert",
        daysForTheConcert,
        1,
      );
      var items = <Item>[item];
      GildedRose app = new GildedRose(items);
      //Act
      app.updateQuality();
      //assert
      expect(app.items[0].quality, 1 + 2);
    }
  });
  test(
      "When updated Item is Backstage and 5 days or less till concert then quality increases 3",
      () {
    const hotDaysLeft = [5, 1];
    for (var daysForTheConcert in hotDaysLeft) {
      //Arrange
      var item = new Item(
        "Backstage passes to a TAFKAL80ETC concert",
        daysForTheConcert,
        1,
      );
      var items = <Item>[item];
      GildedRose app = new GildedRose(items);
      //Act
      app.updateQuality();
      //assert
      expect(app.items[0].quality, 1 + 3);
    }
  });
  test(
      "When updated Item is Backstage passes and is concert day then quality falls to 0",
      () {
    //Arrange
    var item = new Item("Backstage passes to a TAFKAL80ETC concert", 0, 10);
    var items = <Item>[item];
    GildedRose app = new GildedRose(items);
    //Act
    app.updateQuality();
    //Assert
    expect(app.items[0].quality, 0);
  });
  test("When Item increases quality its maximum is 50", () {
    //Arrange
    var item = new Item("Backstage passes to a TAFKAL80ETC concert", 3, 50);
    var items = <Item>[item];
    GildedRose app = new GildedRose(items);
    //Act
    app.updateQuality();
    //Assert
    expect(app.items[0].quality, 50);
  });
  test("When Sulfuras updates it does not vary", () {
    //Arrange
    var item = new Item("Sulfuras, Hand of Ragnaros", 1, 1);
    var items = <Item>[item];
    GildedRose app = new GildedRose(items);
    //Act
    app.updateQuality();
    //Assert
    expect(app.items[0].quality, 1);
    expect(app.items[0].sellIn, 1);
  });
}
