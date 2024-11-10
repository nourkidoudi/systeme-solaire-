import 'package:flutter/material.dart';
import 'data.dart';
import 'planet.dart';

void main() {
  runApp(SolarSystemApp());
}

class SolarSystemApp extends StatelessWidget {
  const SolarSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'النّظام الشمسي',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white, 
            fontFamily: 'Roboto', 
            height: 1.6, 
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey, 
          centerTitle: true, 
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white, 
          ),
        ),
        cardTheme: CardTheme(
          elevation: 8, 
          margin: const EdgeInsets.symmetric(
              vertical: 10, horizontal: 12), 
          color: Colors.orange[50], 
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(15), 
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
                'assets/images/solar-system.jpg'), 
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6),
                BlendMode.darken),
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlanetListScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.grey, 
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            child: Text(
              'أهلاً بك في تطبيق النظام الشمسي',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

class PlanetListScreen extends StatelessWidget {
  const PlanetListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('النّظام الشمسي'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8), 
        itemCount: planets.length,
        itemBuilder: (context, index) {
          final planet = planets[index];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(16), 
              leading: Image.asset(
                planet.imagePath,
                width: 120, 
                height: 120,
                fit: BoxFit.cover,
              ),
              title: Text(
                planet.name,
                style: const TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0), 
                ),
              ),
              subtitle: Text(
                planet.description,
                style: const TextStyle(
                  fontSize: 16, 
                  color: Color.fromARGB(255, 1, 0, 3), 
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PlanetDetailScreen(planet: planet),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PlanetDetailScreen extends StatelessWidget {
  final Planet planet;

  const PlanetDetailScreen({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planet.name),
        backgroundColor:
            Colors.black, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                planet.imagePath,
                height: 350, 
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 24),
              Text(
                planet.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(186, 0, 0, 0), 
                ),
              ),
              const SizedBox(height: 16),
              Text(
                planet.description,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 7, 2, 0), 
                  height: 1.6, 
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 112, 104, 102), 
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Learn More',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
