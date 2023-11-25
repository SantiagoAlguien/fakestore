import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child:SizedBox(
      width: screenWidth*0.3,
      height: screenWidth*0.3,
      child: LoadingIndicator(
        indicatorType: Indicator.ballSpinFadeLoader,
        colors: [Colors.black],
      )
    ));
  }
}