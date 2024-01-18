import 'dart:math';
import 'package:flutter/material.dart';
import 'package:smkdev/components/detail/history_app_bar_component.dart';
import 'package:smkdev/repositories/data/history_cart.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<HistoryCartData> historyCartDataList = [];

  @override
  initState() {
    super.initState();
    generateHistoryCartDataList(4);
  }

  Future<void> generateHistoryCartDataList(int numberOfItems) async {
    var _historyCartDataList = List.generate(numberOfItems, (index) {
      Random random = Random();
      return HistoryCartData(
        cover: "https://picsum.photos/100$index/100$index",
        title: "Nama Makanan",
        price: random.nextInt(50) + 10,
      );
    });
    setState(() {
      historyCartDataList = _historyCartDataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const HistoryAppBar(),
            SizedBox(
              height: 70,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(139, 158, 158, 158),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("Ongoing", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text("History", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 1.5,
              child: RefreshIndicator(
                onRefresh: () => generateHistoryCartDataList(4),
                child: ListView.builder(
                  itemCount: historyCartDataList.length,
                  itemBuilder: (context, index) {
                    HistoryCartData historyCartData = historyCartDataList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            padding: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(historyCartData.cover),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            // width: MediaQuery.sizeOf(context).width / 2.3,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  historyCartData.title,
                                  style: const TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "(1 menu) Economic Package",
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.withOpacity(0.4),
                                      ),
                                    ),
                                    Text(
                                      " \u2022 \$ ${historyCartData.price}",
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "August 21, 2021",
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.withOpacity(0.4),
                                      ),
                                    ),
                                    Text(
                                      " \u2022 Done",
                                      style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
