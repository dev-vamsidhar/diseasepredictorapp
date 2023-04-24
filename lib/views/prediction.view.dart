import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:medico/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Prediction extends StatefulWidget {
  Prediction(
      {super.key,
      required this.disease1,
      required this.disease2,
      required this.disease3,
      required this.hospital,
      required this.location});
  String disease1;
  String disease2;
  String disease3;
  String location;
  String hospital;

  @override
  State<Prediction> createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  String finalDiseaseName = "";
  @override
  void initState() {
    super.initState();
    getRepeatedElement();
  }

  getRepeatedElement() {
    List duplicate = [];
    List originals = [widget.disease1, widget.disease2, widget.disease3];
    for (var element in originals) {
      if (duplicate.contains(element)) {
        setState(() {
          finalDiseaseName = element;
        });
        break;
      } else {
        duplicate.add(element);
      }
    }
  }

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
            finalDiseaseName.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        finalDiseaseName,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "No disease found please input the correct symptoms",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Diseases are predicted based on the trained models.Its always safe to consult doctor if symptoms are severe",
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),
            const SizedBox(
              height: 20,
            ),
            finalDiseaseName.isNotEmpty
                ? const Text(
                    "Hosipitals Nearby to cure this disease",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  )
                : Container(),
            const SizedBox(
              height: 20,
            ),
            finalDiseaseName.isNotEmpty
                ? Padding(
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
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: Get.width - 100,
                                      child: Text(
                                        widget.hospital.toString(),
                                        maxLines: 10,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.location_pin),
                                        Text(widget.location.toString()),
                                      ],
                                    )
                                  ],
                                ),
                                InkWell(
                                    onTap: () {
                                      String phone =
                                          widget.hospital.split("-").last;

                                      launchUrl(Uri.parse("tel://$phone"));
                                    },
                                    child: Icon(Icons.call))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                String url =
                                    "https://www.google.com/maps/search/${widget.hospital.split("-").first},${widget.location}/";
                                launchUrl(Uri.parse(url));
                              },
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
                : Container()
          ],
        ),
      ),
    );
  }
}
