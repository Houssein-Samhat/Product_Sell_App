import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider.dart';

import 'package:loading_indicator/loading_indicator.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final prov = Provider.of<DataHolder>(context, listen: false);
    if (prov.products.isEmpty) {
      prov.fill_products();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataHolder>(builder: (context, prov, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Dashboard'),
            centerTitle: true,
            backgroundColor: Colors.black,
            elevation: 0.0,
          ),
          body: prov.loading
              ? const Center(
                  child: LoadingIndicator(
                    indicatorType: Indicator.pacman,
                    colors: [Colors.red],
                  ),
                )
              : Center(
                  child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: ListView.builder(
                    itemCount: prov.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                          elevation: 4.0,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  prov.products[index].title!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(prov.products[index].category!),
                              ),
                              Container(
                                height: 200.0,
                                child: Image.network(
                                  prov.products[index].image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  prov.products[index].description!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 28.0, bottom: 12),
                                child: Row(
                                  children: [
                                    Text('Price :' +
                                        ' ' +
                                        prov.products[index].price!.toString() +
                                        '\$'),
                                    SizedBox(
                                      width: 80,
                                    ),
                                    Row(
                                      children: List.generate(5, (i) {
                                        if (i <
                                            (prov.products[index].rate!)
                                                .floor()) {
                                          // Full star for ratings >= index
                                          return const Icon(Icons.star,
                                              color: Colors.yellow);
                                        } else if (i ==
                                                (prov.products[index].rate!)
                                                    .floor() &&
                                            (prov.products[index].rate!) % 1 !=
                                                0) {
                                          // Half star for ratings between index and index+1
                                          return const Icon(Icons.star_half,
                                              color: Colors.yellow);
                                        } else {
                                          // Empty star for ratings < index
                                          return const Icon(Icons.star_border,
                                              color: Colors.yellow);
                                        }
                                      }),
                                    ),
                                    const SizedBox(width: 5),
                                    Text('(${prov.products[index].count})')
                                  ],
                                ),
                              )
                            ],
                          ));
                    },
                  ),
                )));
    });
  }
}
