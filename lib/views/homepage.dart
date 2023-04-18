import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:medico/constants.dart';
import 'package:medico/controllers/firebasecontoller.dart';
import 'package:medico/views/login.dart';
import 'package:medico/views/prediction.view.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Map<String, String> symptoms = {
    "s1": "",
    "s2": "",
    "s3": "",
    "s4": "",
    "s5": ""
  };

  List<String> l1 = [
    "back_pain",
    "constipation",
    "abdominal_pain",
    "diarrhoea",
    "mild_fever",
    "yellow_urine",
    "yellowing_of_eyes",
    "acute_liver_failure",
    "fluid_overload",
    "swelling_of_stomach",
    "swelled_lymph_nodes",
    "malaise",
    "blurred_and_distorted_vision",
    "phlegm",
    "throat_irritation",
    "redness_of_eyes",
    "sinus_pressure",
    "runny_nose",
    "congestion",
    "chest_pain",
    "weakness_in_limbs",
    "fast_heart_rate",
    "pain_during_bowel_movements",
    "pain_in_anal_region",
    "bloody_stool",
    "irritation_in_anus",
    "neck_pain",
    "dizziness",
    "cramps",
    "bruising",
    "obesity",
    "swollen_legs",
    "swollen_blood_vessels",
    "puffy_face_and_eyes",
    "enlarged_thyroid",
    "brittle_nails",
    "swollen_extremeties",
    "excessive_hunger",
    "extra_marital_contacts",
    "drying_and_tingling_lips",
    "slurred_speech",
    "knee_pain",
    "hip_joint_pain",
    "muscle_weakness",
    "stiff_neck",
    "swelling_joints",
    "movement_stiffness",
    "spinning_movements",
    "loss_of_balance",
    "unsteadiness",
    "weakness_of_one_body_side",
    "loss_of_smell",
    "bladder_discomfort",
    "foul_smell_of urine",
    "continuous_feel_of_urine",
    "passage_of_gases",
    "internal_itching",
    "toxic_look_(typhos)",
    "depression",
    "irritability",
    "muscle_pain",
    "altered_sensorium",
    "red_spots_over_body",
    "belly_pain",
    "abnormal_menstruation",
    "dischromic _patches",
    "watering_from_eyes",
    "increased_appetite",
    "polyuria",
    "family_history",
    "mucoid_sputum",
    "rusty_sputum",
    "lack_of_concentration",
    "visual_disturbances",
    "receiving_blood_transfusion",
    "receiving_unsterile_injections",
    "coma",
    "stomach_bleeding",
    "distention_of_abdomen",
    "history_of_alcohol_consumption",
    "fluid_overload",
    "blood_in_sputum",
    "prominent_veins_on_calf",
    "palpitations",
    "painful_walking",
    "pus_filled_pimples",
    "blackheads",
    "scurring",
    "skin_peeling",
    "silver_like_dusting",
    "small_dents_in_nails",
    "inflammatory_nails",
    "blister",
    "red_sore_around_nose",
    "yellow_crust_ooze",
  ];
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Medico",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Get.offAll(LoginPage());
              },
              child: Icon(Icons.logout))
        ],
        elevation: 0,
        backgroundColor: kColorPrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Enter the user name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    focusColor: kColorPrimary,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Enter the age",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: age,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: "eg.20",
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    focusColor: kColorPrimary,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            customDropdown(l1, "eg. Diabetis", "Select Symptom 1", "s1"),
            customDropdown(
                l1, "eg. Urinal Infection", "Select Symptom 2", "s2"),
            customDropdown(l1, "eg. Heartpain", "Select Symptom 3", "s4"),
            customDropdown(
                l1, "eg. Urinal Infection", "Select Symptom 4", "s5"),
            customDropdown(l1, "eg. Heartpain", "Select Symptom 5", "s6"),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async {
                EasyLoading.show(status: "loading...");
                dio.Dio diopack = dio.Dio();
                dio.Response res = await diopack.get("http://65.0.35.187/",
                    queryParameters: symptoms);
                print(res.data);
                String uid = FirebaseAuth.instance.currentUser!.uid;
                res.data["name"] = name.text;
                res.data["age"] = age.text;
                await FirebaseContorller().setDoc(
                    collectionPath: "medicodiseases",
                    document: uid,
                    data: {
                      "data${DateTime.now()}": res.data,
                      "uid": FirebaseAuth.instance.currentUser?.uid
                    });
                Get.to(Prediction(
                  disease1: res.data["result"][0],
                  disease2: res.data["result"][1],
                  disease3: res.data["result"][2],
                ));
                EasyLoading.dismiss();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kColorPrimary,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      "Predict the disease",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget customDropdown(
      List<String> items, String label, String heading, String key) {
    items = items.toSet().toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "$heading",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Color.fromARGB(255, 189, 189, 189),
                width: 1,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: DropdownButtonFormField(
                decoration: InputDecoration.collapsed(
                  hintText: label,
                ),
                items: items.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  symptoms[key] = newValue.toString();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
