import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            SizedBox(width: 10),
            Text('Moodle'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, color: Colors.black),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Stack(
        children: [
          Row(
            children: [
              SidebarMenu(),
              Expanded(child: CourseGrid()),
              RightPanel(),
            ],
          ),
        ],
      ),
    );
  }
}


class _HoverableTile extends StatefulWidget {
  final IconData icon;
  final String text;

  const _HoverableTile({required this.icon, required this.text});

  @override
  State<_HoverableTile> createState() => _HoverableTileState();
}

class _HoverableTileState extends State<_HoverableTile> {
  bool isHovered = false; // Estado de hover

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Container(
        color: isHovered ? Colors.green[100] : null, // Cambia color al pasar mouse
        child: ListTile(
          leading: Icon(widget.icon, color: Colors.black54),
          title: Text(widget.text),
          onTap: () {},
        ),
      ),
    );
  }
}


class SidebarMenu extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.home, 'text': 'Home'},
    {'icon': Icons.dashboard, 'text': 'Dashboard'},
    {'icon': Icons.calendar_today, 'text': 'Calendar'},
    {'icon': Icons.folder, 'text': 'Private files'},
  ];

  final List<Map<String, String>> courses = [
    {'title': 'PROGRAMACIÓN MULTIPLATAFORMA'},
    {'title': 'BASE DE DATOS MULTIDIMENSIONAL'},
    {'title': 'CIRCUITOS LÓGICOS'},
    {'title': 'CONTABILIDAD'},
    {'title': 'REDES II'},
    {'title': 'DESARROLLO DE SOFTWARE'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.grey[200],
      child: ListView(
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(Icons.palette, color: Colors.white),
                SizedBox(width: 10),
                Text('Área personal',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          ...menuItems.map((item) => ListTile(
                leading: Icon(item['icon']),
                title: Text(item['text']),
                onTap: () {},
                hoverColor: Colors.green[200],
              )),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text('Mis cursos', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ...courses.map((course) => ListTile(
                title: Text(course['title']!),
                onTap: () {},
              )),
          ListTile(
            leading: Icon(Icons.perm_media_outlined),
            title: Text('Mis archivos'),
            onTap: () {},
          ),
           ListTile(
            leading: Icon(Icons.admin_panel_settings_outlined),
            title: Text('Site administration'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class CourseGrid extends StatelessWidget {
  final List<String> courseImages = [
    'assets/imagenes/course1.jpg',
    'assets/imagenes/course2.jpg',
    'assets/imagenes/course3.jpg',
    'assets/imagenes/course4.png',
    'assets/imagenes/course5.png',
    'assets/imagenes/course6.jpeg'
  ];

  final List<String> courseNames = [
    'PROGRAMACIÓN MULTIPLATAFORMA',
    'BASE DE DATOS MULTIDIMENSIONAL',
    'CIRCUITOS LÓGICOS',
    'CONTABILIDAD',
    'REDES II',
    'DESARROLLO DE SOFTWARE'
  ];

  final List<int> completionRates = [30, 50, 70, 20, 90, 60];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: courseNames.length,
        itemBuilder: (context, index) {
          return MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      courseImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.black.withOpacity(0.7),
                    child: Column(
                      children: [
                        Text(
                          'Periodo 2025-1',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Text(
                          courseNames[index],
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        LinearProgressIndicator(
                          value: completionRates[index] / 100,
                          backgroundColor: Colors.grey[600],
                          color: Colors.green,
                        ),
                        Text(
                          '${completionRates[index]}% completado',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class RightPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fila con iconos y botón en la parte superior
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    elevation: 0,
                  ),
                  child: Text('Personalizar esta página'),
                ),
              ],
            ),
          ),

          Divider(),

          // Sección de Archivos Privados
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.folder, color: Colors.black54),
                SizedBox(width: 10),
                Text('Archivos Privados',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Sin archivos disponibles'),
          ),

          Divider(),

          // Sección de Línea de Tiempo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.black54),
                SizedBox(width: 10),
                Text('Línea de tiempo',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.access_time, size: 13),
                      SizedBox(width: 3),
                      Icon(Icons.arrow_drop_down, size: 18),
                    ],
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('No hay próximas actividades pendientes'),
          ),
        ],
      ),
    );
  }
}



