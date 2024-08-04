import 'package:bmi_calculator/constants/app_colors.dart';
import 'package:bmi_calculator/result_screen.dart';
import 'package:bmi_calculator/widgets/custom_app_bar.dart';
import 'package:bmi_calculator/widgets/custom_button.dart';
import 'package:bmi_calculator/widgets/custom_icon_button.dart';
import 'package:bmi_calculator/widgets/weight_and_age_widget.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  int chosen = 0;
  //chosen=0=> gender not chosen
  //chosen=1=> male
  //chosen=2=> female

  Gender gender = Gender.neytral;
  double height = 160;
  int salmak = 50;
  int jash = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: const CustomAppBar(title: 'BMI CALCULATOR'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                CustomIconButton(
                  text: 'Male',
                  icon: Icons.male,
                  onTap: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  bgColor: gender == Gender.male
                      ? AppColors.greyBlueDarker
                      : AppColors.greyBlueDark,
                ),
                const SizedBox(
                  width: 16,
                ),
                CustomIconButton(
                  text: 'Female',
                  icon: Icons.female,
                  onTap: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  bgColor: gender == Gender.female
                      ? AppColors.greyBlueDarker
                      : AppColors.greyBlueDark,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.greyBlueDarker),
              child: Column(
                children: [
                  const SizedBox(
                    height: 46,
                  ),
                  Text(
                    'height'.toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toInt().toString(),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        'cm',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Slider(
                    min: 50,
                    max: 210,
                    value: height,
                    thumbColor: AppColors.pinkDark,
                    activeColor: AppColors.pinkDark,
                    onChanged: (double ozgorgonSan) {
                      print('ozgorgonSan $ozgorgonSan');
                      height = ozgorgonSan;
                      print('slidersNumber $height');
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    child: WeightAndAgeWidget(
                  koboytTag: salmak.toString(),
                  azaytTag: 'salmak',
                  san: salmak.toString(),
                  aty: 'Weight',
                  koboyt: () {
                    setState(() {
                      salmak++;
                    });
                  },
                  azayt: () {
                    setState(() {
                      salmak--;
                    });
                  },
                )),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: WeightAndAgeWidget(
                  koboytTag: jash.toString(),
                  azaytTag: 'jash',
                  san: jash.toString(),
                  aty: 'Age',
                  koboyt: () {
                    setState(() {
                      jash++;
                    });
                  },
                  azayt: () {
                    setState(() {
                      jash--;
                    });
                  },
                )),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ResultScreen(
              salmak: salmak,
              height: height,
              jash: jash.toString(),
              gender: gender.name,
            );
          }));
        },
        text: 'calculate'.toUpperCase(),
      ),
    );
  }
}

enum Gender { male, female, neytral }
