# My notes

## Cool fact

I managed to get my dependencies while on the airplane by using

```example
flutter pub get --offline
```

 When "flutter pub get" is run by the create command,
                             this indicates whether to run it in offline mode or
                             not. In offline mode, it will need to have all
                             dependencies already available in the pub cache to
                             succeed.

## Initial requirements

- Once the sell by date has passed, `Quality` degrades twice as fast
- The `Quality` of an item is never negative
- __"Aged Brie"__ actually increases in `Quality` the older it gets
- The `Quality` of an item is never more than `50`
- __"Sulfuras"__, being a legendary item, never has to be sold or decreases in `Quality`
- __"Backstage passes"__, like aged brie, increases in `Quality` as its `SellIn` value approaches;
  - `Quality` increases by `2` when there are `10` days or less and by `3` when there are `5` days or less but
  - `Quality` drops to `0` after the concert
