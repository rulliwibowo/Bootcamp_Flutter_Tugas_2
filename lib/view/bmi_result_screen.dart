
import 'package:flutter/material.dart';
import 'package:tugas_2_bmi/view/bmi_data_screen.dart';

import '../constants/constant.dart';

class BmiResultScreen extends StatelessWidget {
  const BmiResultScreen({ Key? key, required this.bmi }) : super(key: key);
  final double bmi;

  determineBmiCategory(double bmiValue){
    String categori = "";
    if (bmiValue < 16.0){
      categori = underweightSevere;
    } else if (bmiValue < 17){
      categori = underweightModerate;
    } else if (bmiValue < 18.5){
      categori = underweightMild;
    } else if (bmiValue < 25){
      categori = normal;
    } else if (bmiValue < 30){
      categori = overWeight;
    } else if (bmiValue < 35){
      categori = obeseI;
    } else if (bmiValue < 40){
      categori = obeseII;
    } else if (bmiValue >= 40){
      categori = obeseIII;
    }
    return categori;
  }


  String getHealRiskDescription(String categoryName){
    String description = "";

    switch (categoryName) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        description = "Possible nutritional deficiency and osteoporosis.";
        break;
      case normal:
        description = "Low Risk (healthy range)";
        break;
      case overWeight:
      case obeseI:
      case obeseII:
      case obeseIII:
        description = "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      default:
    }
    return description;
  }

  @override
  Widget build(BuildContext context) {
    final bmiCategory = determineBmiCategory(bmi);
    // print(bmiCategory);
    final bmiDesc = getHealRiskDescription(bmiCategory);
    // print(bmiDesc);

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("Hasil BMI"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Expanded(
            child: Text(
              "Hasil Perhitungan",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BmiCard(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("$bmiCategory", 
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(bmi.toStringAsFixed(1), 
                        style: const TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      Text(bmiDesc, 
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ),
          GestureDetector(
            onTap: (() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (
                    (context) {
                      return const BmiDataScreen();
                    }
                  )
                )
              );
            }),
            child: Container(
              height: 60,
              color: const Color(0xFFEB1555),
              child: const Center(child: Text(
                "Hitung BMI",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color:Colors.white
                )
              )),
            ),
          )
        ],
      ),
    );
  }
}