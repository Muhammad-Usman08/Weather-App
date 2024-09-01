import 'package:flutter/material.dart';
import 'package:weather_app/components/air_conditions.dart';
import 'package:weather_app/components/custom_text.dart';
import 'package:weather_app/service/home_service.dart';
import 'package:weather_app/model/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController cityController = TextEditingController();
  String weatherIcon = 'assets/images/sunny.png';
  Future<List<WeatherModel>>? weatherFuture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0b131e),
      appBar: AppBar(
        backgroundColor: const Color(0xff0b131e),
        title: TextField(
          controller: cityController,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: 'Enter City Name',
            hintStyle: const TextStyle(
              color: Color(0xff9298a1),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            fillColor: const Color(0xff202b3b),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xff202b3b),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: FutureBuilder<List<WeatherModel>>(
                future: weatherFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData) {
                    String weather = snapshot.data![0].weather;
                    cityController.clear();

                    if (weather == 'Clouds') {
                      weatherIcon = 'assets/images/cloudy.png';
                    } else if (weather == 'Clear') {
                      weatherIcon = 'assets/images/sunny.png';
                    } else if (weather == 'Rain') {
                      weatherIcon = 'assets/images/rainy.png';
                    } else if (weather == 'Mist') {
                      weatherIcon = 'assets/images/mist.png';
                    } else {
                      weatherIcon = 'assets/images/sunny.png';
                    }

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: snapshot.data![0].name,
                          textcolor: Colors.white,
                          weight: FontWeight.w600,
                          fontSize: 40,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 30),
                          child: Image.asset(
                            weatherIcon,
                            width: 200,
                          ),
                        ),
                        CustomText(
                          text: '${snapshot.data![0].temp}°',
                          textcolor: Colors.white,
                          weight: FontWeight.w600,
                          fontSize: 45,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 40),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color(0xff202b3b),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: 'AIR CONDITION',
                                  textcolor: Colors.grey,
                                  fontSize: 13,
                                  weight: FontWeight.w600,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AirConditions(
                                      imageUrl: 'assets/images/temperature.png',
                                      text: 'Feels Likes',
                                      value: '${snapshot.data![0].feelsLike}°',
                                    ),
                                    AirConditions(
                                      imageUrl: 'assets/images/windy.png',
                                      text: 'Wind',
                                      value:
                                          '${snapshot.data![0].windSpeed} km/h',
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AirConditions(
                                      imageUrl: 'assets/images/sea-level.png',
                                      text: 'Sea level',
                                      value:
                                          '${snapshot.data![0].pressure} hPa',
                                    ),
                                    AirConditions(
                                      imageUrl: 'assets/images/temperature.png',
                                      text: 'Humidity',
                                      value: '${snapshot.data![0].humidity}%',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CustomText(
                        text: 'Please Search The City',
                        textcolor: Colors.white,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            weatherFuture = getData(cityController.text); // Update the future
          });
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
