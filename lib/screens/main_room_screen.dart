import 'package:flutter/material.dart';

class MainRoomScreen extends StatefulWidget {
  @override
  _MainRoomScreenState createState() => _MainRoomScreenState();
}

class _MainRoomScreenState extends State<MainRoomScreen> {
  final Map<String, String> _roomImages = {
    'Гостиная': 'assets/living_room_type_image.png',
    'Кухня': 'assets/kitchen_type_image.png',
    'Ванная': 'assets/bathroom_type_image.png',
    'Кабинет': 'assets/cabinet_type_image.png',
    'Спальня': 'assets/bedroom_type_image.png',
    'Зал': 'assets/hall_type_image.png',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: _roomImages.keys.map((roomName) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: _buildRoomButton(roomName),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_room');
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xFF0B50A0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildCategoryButton(String label) {
    return ElevatedButton(
      onPressed: () {
        if (label == 'Комнаты') {
          // Ничего не делаем, так как мы уже на этом экране
        } else if (label == 'Устройства') {
          Navigator.pushNamed(context, '/devices');
        } else if (label == 'Пользователь') {
          Navigator.pushNamed(context, '/users');
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF0B50A0),
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(label),
    );
  }

  Widget _buildRoomButton(String roomName) {
    return Container(
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF0B50A0), width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          print('Выбрана комната: $roomName');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF0B50A0),
          textStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          padding: EdgeInsets.all(16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Color(0xFF0B50A0),
                BlendMode.srcIn,
              ),
              child: Image.asset(
                _roomImages[roomName]!,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8.0),
            Text(roomName),
          ],
        ),
      ),
    );
  }
}