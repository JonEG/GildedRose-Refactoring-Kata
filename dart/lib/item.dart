class Item {
  String name;
  int sellIn;
  int quality;

  Item(this.name, this.sellIn, this.quality);

  @override
  operator ==(other) =>
      other is Item &&
      other.name == name &&
      other.quality == quality &&
      other.sellIn == sellIn;

  @override
  int get hashCode => name.hashCode * sellIn.hashCode * quality.hashCode;

  String toString() => '$name, $sellIn, $quality';
}
