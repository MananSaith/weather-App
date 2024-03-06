//for backdropfilter
import 'dart:ui';
import 'package:flutter/material.dart';
//for data format
import 'package:intl/intl.dart';

import 'package:weather_app/forecast.dart';
import 'package:weather_app/hide.dart';
import 'package:weather_app/weatherbackend.dart';
import 'package:weather_app/additionalinfo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => __HomePageState();
}

class __HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {




@override
Widget build(BuildContext context) {
    return Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                   actions: [
                    IconButton(
                      onPressed: (){
                                setState(() {
                                  
                                });

                      }, 
                      icon: const Icon(Icons.refresh_sharp)
                      )
                   ],
                  title: const Text("Weather App",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  
                ),
                body: FutureBuilder(
                  future:getcurrentweather (),
                  builder:(context,snapshot) {
                       
                       if(snapshot.connectionState==ConnectionState.waiting){
                        return const Center(child: CircularProgressIndicator.adaptive());
                       }

                       if(snapshot.hasError){
                        return  Center(child: Text(snapshot.error.toString()));
                       }

                       final data=snapshot.data!;
                       final weatherData=data['list'][0];
                       final temp=weatherData['main']['temp'];
                       final weathersky=weatherData['weather'][0]['main'];
                       final humidity=weatherData['main']['humidity'];
                       final pressure=weatherData['main']['pressure'];
                       final windSpeed=weatherData['wind']['speed'];
                       final seaLevel=weatherData['weather'][0]['sea_level'];
                       final groundLevel=weatherData['weather'][0]['grnd_level'];
                       final maxTemp=weatherData['weather'][0]['temp_max'];
                      
                    return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(

                         
                          height: 50,
                          child:Row(
                            children: [
                              Card(
                              elevation: 6,
                                child: Container(
                                                            
                            padding: const  EdgeInsets.all(8.0),
                            decoration:  BoxDecoration(
                             borderRadius: BorderRadius.circular(16)
                             ),
                             child:  Row(
                             children: [
                            const Icon(Icons.wb_sunny_rounded
                              ),
                             const SizedBox(width: 5,),
                               Text(city,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                             
                             ],
                            ),
                             ),
                             ),
                            ]
                          ),
                        ),
                      SizedBox(
                        width:double.infinity,
                        child: Card(
                                 elevation: 10,
                                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                 child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                   child: BackdropFilter(
                                    filter:ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                                     child:  Padding(
                                       padding:const EdgeInsets.all(16.0),
                                       child: Column(
                                              children: [
                                       
                                                Text("$temp K",
                                                style: const TextStyle(
                                                  fontSize: 43,fontWeight: FontWeight.bold),),
                                                 Icon(
                                                  (weathersky=='Clouds' || weathersky=='Rain' )?
                                                  Icons.cloud : Icons.sunny 
                                                ,size: 70,),
                                                const  SizedBox(height: 17,),
                                                 Text(weathersky,style: const TextStyle(fontSize: 25),)
                                              ],
                                       
                                       ),
                                     ),
                                   ),
                                 ),
                  
                        ),
                      ),
                      const SizedBox(height: 16,),
                     //2nd 
                     const Text("Weather Forecast",
                     style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                     ),
                     
                   SizedBox(
                    height:120,
                    child: ListView.builder(
                     itemCount: 15,
                     scrollDirection: Axis.horizontal, 
                      itemBuilder:(context,index){
                        final iconForForecast=data['list'][index+1]['weather'][0]['main'];
                        final time=DateTime.parse(data['list'][index+1]['dt_txt']);
                        
                        return SmallCard(
                          
                              time:DateFormat.j().format(time),
                              temp:data['list'][index+1]['main']['temp'].toString(),
                              icon: (iconForForecast=='Clouds' || iconForForecast=='Rain' )?
                                                  Icons.cloud : Icons.sunny);
 
                      }
                    
                    ),

                   ),
                   const SizedBox(height: 13),
                   const Text("Additional Information",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  
                    const SizedBox(height: 10),
                     SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                       child: Row(
                           children: [
                                    
                                  AdditionalInfoCards(icon:Icons.water_drop,lable:"Humidity",value:humidity.toString()),
                                  AdditionalInfoCards(icon:Icons.air,lable:"Wind Speed",value:windSpeed.toString()),
                                  AdditionalInfoCards(icon:Icons.beach_access,lable:"Pressure",value: pressure.toString()),
                                   AdditionalInfoCards(icon:Icons.water,lable:"Sea Level",value:seaLevel.toString()),
                                  AdditionalInfoCards(icon:Icons.group_rounded,lable:"Grnd Level",value:groundLevel.toString()),
                                  AdditionalInfoCards(icon:Icons.hot_tub,lable:"MAX temp",value: maxTemp.toString()),
                                   
                                   
                           ],
                                           ),
                     )
                    ]
                    ),
                  );
                  },
                ),

    );
  }
}
