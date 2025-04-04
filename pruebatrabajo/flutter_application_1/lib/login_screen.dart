import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_userController.text == 'admin' && _passwordController.text == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario o contraseña incorrectos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Barra azul en la parte superior
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('assets/imagenes/NewLogo.png', height: 60),
              ),
            ),
          ),
          // Espacio central
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/imagenes/NewLogo.png', height: 100),
                    const SizedBox(height: 20),
                    // Campos de usuario y contraseña
                    Container(
                      width: 300, // Ajusta el tamaño de los campos
                      child: Column(
                        children: [
                          TextField(
                            controller: _userController,
                            decoration: InputDecoration(
                              labelText: 'Usuario',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Botón de ingreso
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: _login,
                            child: const Text('INGRESAR',
                                style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(height: 10),
                          // Enlace de recuperación de contraseña
                          TextButton(
                            onPressed: () {},
                            child: const Text('¿Olvidé mi contraseña?',
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Pie de página con copyright
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Universidad Católica de Honduras © 2025',
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}



