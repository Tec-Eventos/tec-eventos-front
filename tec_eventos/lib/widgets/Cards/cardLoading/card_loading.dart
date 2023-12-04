
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardLoading extends StatelessWidget {
  const CardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
      child: SizedBox(
        height: 131,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Card(
            margin: const EdgeInsets.only(top: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
            elevation: 6,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 15,
                        child: Container(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 80,
                        height: 15,
                        child: Container(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 60,
                        height: 10,
                        child: Container(color: Colors.white),
                      ),
                      SizedBox(
                        width: 60,
                        height: 10,
                        child: Container(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                    
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 160,
                      height: 131,
                      color: Colors.grey[300],
                    ),
                    Container(
                      width: 160,
                      height: 30,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 9,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                      child: SizedBox(
                        width: 30,
                        height: 10,
                        child: Container(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
