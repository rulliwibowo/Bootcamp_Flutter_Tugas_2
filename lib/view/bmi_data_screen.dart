
import 'package:flutter/material.dart';
import 'package:tugas_2_bmi/constants/constant.dart';
import 'package:tugas_2_bmi/view/bmi_result_screen.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({ Key? key }) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {

  int height = 100;
  int weight = 60;
  int age = 20;
  String? gender;

  double calculateBmi(){
    double heightInMeter = height / 100;
    final h = (heightInMeter*heightInMeter);
    final bmi = weight / h;

    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(child: Row(children: [
            Expanded(child: 
              GestureDetector(
                onTap: () {
                  gender = "male";
                  setState(() {
                    
                  });
                },
                child: BmiCard(
                  borderColor: (gender=="male") ? Colors.white : primaryColor,
                  child: const GenderIconText(icon: Icons.male, title: 'Male',),
                ),
              )
            ),
            Expanded(child: 
              GestureDetector(
                onTap: () {
                  gender = "female";
                  setState(() {
                    
                  });
                },
                child: BmiCard(
                  borderColor: (gender=="female") ? Colors.white : primaryColor,
                  child: const GenderIconText(title: "Female", icon: Icons.female)
                ),
              )
            )
          ],)),
          Expanded(child: BmiCard(child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                  style: labelTextStyle.copyWith(
                    fontSize: 20
                  ),
                ),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(height.toString(), 
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    Text("cm", style: labelTextStyle,)
                  ],
                ),
                Slider(                    
                  value: height.toDouble(),
                  min: 80,
                  max: 200,
                  activeColor: Colors.white,
                  thumbColor: const Color(0xFFEB1555), 
                  inactiveColor: const Color(0xFF8D8E98),
                  onChanged: (double newValue) {                      
                    setState(() {
                      height = newValue.round();
                    });
                  }
                )
              ],
            )
          ,)),
          Expanded(child: Row(
            children: [
              Expanded(child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT", style: labelTextStyle),
                    Text("$weight", style: numberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () { 
                            weight --;
                            setState(() {});
                          },
                          elevation: 0,
                          child: const Icon(Icons.remove, color: Colors.white,),
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff212747),
                          constraints: const BoxConstraints.tightFor(
                            width: 56,
                            height: 56
                          ),                                                    
                        ),
                        const SizedBox(width: 5,),
                        RawMaterialButton(
                          onPressed: () { 
                            weight ++; 
                            setState(() {});
                          },
                          elevation: 0,
                          child: const Icon(Icons.add, color: Colors.white,),
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff212747),
                          constraints: const BoxConstraints.tightFor(
                            width: 56,
                            height: 56
                          ),                                                    
                        ),
                      ],
                    )
                  ],
                ),
              ),),
              Expanded(child: BmiCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("AGE", style: labelTextStyle),
                    Text("$age", style: numberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () { 
                            age --;
                            setState(() {});
                          },
                          elevation: 0,
                          child: const Icon(Icons.remove, color: Colors.white,),
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff212747),
                          constraints: const BoxConstraints.tightFor(
                            width: 56,
                            height: 56
                          ),                                                    
                        ),
                        const SizedBox(width: 5,),
                        RawMaterialButton(
                          onPressed: () {
                            age ++;
                            setState(() {});
                          },
                          elevation: 0,
                          child: const Icon(Icons.add, color: Colors.white,),
                          shape: const CircleBorder(),
                          fillColor: const Color(0xff212747),
                          constraints: const BoxConstraints.tightFor(
                            width: 56,
                            height: 56
                          ),                                                    
                        ),
                      ],
                    )
                  ],
                ),
              ))
            ],
          )),
          GestureDetector(
            onTap: (() {
              // print(calculateBmi());
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (
                    (context) {
                      return BmiResultScreen(
                        bmi: calculateBmi(),
                      );
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
        ]
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key, this.child, this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff272a4e),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor!)
      ),
      margin: const EdgeInsets.all(10),
      child: child
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key, 
    required this.title, 
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 15,),
        Text(title,
          style: labelTextStyle
        )
      ],
    );
  }
}