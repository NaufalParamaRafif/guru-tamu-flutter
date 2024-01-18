import 'dart:math';

import 'package:smkdev/repositories/data/history_cart.dart';

List<HistoryCartData> generateHistoryCartDataList(int numberOfItems) {
  List<String> covers = [
    'cover1.jpg',
    'cover2.jpg',
    'cover3.jpg',
    // Add more cover image names as needed
  ];

  List<String> titles = [
    'Item A',
    'Item B',
    'Item C',
    // Add more item titles as needed
  ];

  Random random = Random();

  List<HistoryCartData> historyCartDataList = List.generate(numberOfItems, (index) {
    return HistoryCartData(
      cover: covers[random.nextInt(covers.length)],
      title: titles[random.nextInt(titles.length)],
      price: random.nextInt(50) + 10, // Random price between 10 and 60
    );
  });

  return historyCartDataList;
}