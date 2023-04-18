import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:medico/constants.dart';

class Prediction extends StatelessWidget {
  Prediction(
      {super.key,
      required this.disease1,
      required this.disease2,
      required this.disease3});
  String disease1;
  String disease2;
  String disease3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kColorPrimary,
        title: Text(
          "Results",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Based on your symptoms predicted diseases are",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Icon(Icons.arrow_forward_rounded),
                SizedBox(
                  width: 10,
                ),
                Text(disease1)
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(Icons.arrow_forward_rounded),
                SizedBox(
                  width: 10,
                ),
                Text(disease2)
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(Icons.arrow_forward_rounded),
                SizedBox(
                  width: 10,
                ),
                Text(disease3)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Diseases are predicted based on the trained models.Its always safe to consult doctor if symptoms are severe",
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Hosipitals Nearby to cure this disease",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 1),
                          blurRadius: 2)
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Mayuri Hosipitals",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 17),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_pin),
                                  Text("Tirupathi"),
                                ],
                              )
                            ],
                          ),
                          Icon(Icons.call)
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: kColorPrimary,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "Get Directions",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
