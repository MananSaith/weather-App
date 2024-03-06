import 'package:flutter/material.dart';
class AdditionalInfoCards extends StatelessWidget {

  final IconData icon;
    final String lable;
    final String value;

  const AdditionalInfoCards({
    super.key,
    required this.icon,
    required this.lable,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 110,
      padding:const  EdgeInsets.all(6),
      
      child:  Column(
        children: [
          Icon(icon,size: 36,),
          const SizedBox(height:10),
          Text(lable,style:const TextStyle(fontSize: 17)),
          const SizedBox(height:10),
          Text(value,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
        ],
      ),
    );
  }
}