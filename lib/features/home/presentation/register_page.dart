import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76F2B2), // Fondo verde
      appBar: AppBar(
        backgroundColor: const Color(0xFF76F2B2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Nueva Cuenta",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nombre Completo"),
            const SizedBox(height: 5),
            _buildTextField("Escribe tu nombre completo"),

            const SizedBox(height: 15),
            const Text("Contraseña"),
            const SizedBox(height: 5),
            TextField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.6),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 15),
            const Text("Email"),
            const SizedBox(height: 5),
            _buildTextField("example@example.com"),

            const SizedBox(height: 15),
            const Text("Número de teléfono"),
            const SizedBox(height: 5),
            _buildTextField("+57 300 000 0000"),

            const SizedBox(height: 15),
            const Text("Fecha De Nacimiento"),
            const SizedBox(height: 5),
            _buildTextField("DD / MM / YYYY"),

            const SizedBox(height: 20),

            // Texto legal
            Center(
              child: Text(
                "Al continuar aceptas nuestros\nTérminos de Uso y Políticas de Privacidad",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Botón principal
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Acción: registrar usuario
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.7),
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Registrarse",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Opciones de login social
            Center(
              child: Column(
                children: [
                  const Text("o inicia sesión con"),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildCircleButton(Icons.g_mobiledata),
                      const SizedBox(width: 15),
                      _buildCircleButton(Icons.facebook),
                      const SizedBox(width: 15),
                      _buildCircleButton(Icons.fingerprint),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Enlace a iniciar sesión
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // volver a login
                },
                child: const Text(
                  "¿Ya tienes una cuenta? Inicia sesión",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withOpacity(0.6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.white.withOpacity(0.6),
      child: Icon(icon, color: Colors.black87, size: 28),
    );
  }
}
