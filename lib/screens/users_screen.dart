import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Твой дом',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'г. Омск, ул. Ленина, д. 24',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Color(0xFF0B50A0),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              print('Нажата кнопка настроек');
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  _buildCategoryButton('Комнаты'),
                  SizedBox(width: 8.0),
                  _buildCategoryButton('Устройства'),
                  SizedBox(width: 8.0),
                  _buildCategoryButton('Пользователь'),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                _buildUserButton('Сын'),
                SizedBox(height: 16.0),
                _buildUserButton('Дочь'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Нажата кнопка добавить');
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
        print('Выбрана категория: $label');
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

  Widget _buildUserButton(String userName) {
    return Container(
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xFF0B50A0), width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          print('Выбран пользователь: $userName');
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
          children: <Widget>[
            Icon(
              Icons.person,
              size: 100.0,
              color: Color(0xFF0B50A0),
            ),
            SizedBox(width: 16.0),
            Text(userName),
          ],
        ),
      ),
    );
  }
}
