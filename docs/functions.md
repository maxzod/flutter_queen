# Queen

## Queen functions

1. remove the **#** hash form the url [on web only]

## 1. remove the **#** **hash** form the url

```dart
// import the package
import 'package:flutter_queen/flutter_queen.dart';

void main(){
   // remove the # from path when running on the web
   Queen.removeTheHash();
   // run your app as usual
   runApp(KingdomApp());
}
```
