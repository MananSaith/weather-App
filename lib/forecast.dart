import 'package:flutter/material.dart';


class SmallCard extends StatelessWidget{
  final String time;
  final String temp;
  final IconData icon;
  const SmallCard({super.key,
  required this.time,
  required this.temp,
  required this.icon
  });
  @override
  Widget build(BuildContext context) {
   return Card(
                                elevation: 6,
                                child: Container(
                                  width: 100,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.circular(16)
                                  ),
                                  child:  Column(
                                    children: [
                                      Text(time,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                                      maxLines: 1,overflow: TextOverflow.ellipsis,),
                                      const SizedBox(height:10),
                                      Icon(icon),
                                      const SizedBox(height:10),
                                      Text(temp)

                                    ],
                                  ),
                                ),
                        );
  }
}