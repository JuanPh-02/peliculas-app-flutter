import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF5086B2),
      appBar: AppBar(
        actions: [],
        leading: Icon(
          Icons.nightlight_outlined,
          color: Colors.grey[200],
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue[400],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              // padding: const EdgeInsets.all(30),
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Texto Inicial
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    // color: Colors.red,
                    width: 250,
                    child: Text(
                      'Hello, what do you want to watch ?',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // Barra de búsqueda
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    decoration: BoxDecoration(
                      color: const Color(0x33FFFFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // height: 30,
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey[200],
                        ),
                        Text(
                          'Search',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),

            // Contenedor de Películas
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(30),
                  topEnd: Radius.circular(30),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  color: Color(0xFF232F3D),
                  child: Column(
                    children: [
                      Row(
                        
                        children: [
                          Text('RECOMMENDED FOR YOU'),
                          Spacer(),
                          TextButton(onPressed: () {}, child: Text('See all', style: TextStyle(color: Colors.grey),))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
