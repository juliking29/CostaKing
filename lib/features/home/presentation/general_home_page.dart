import 'package:flutter/material.dart';

class GeneralHomePage extends StatefulWidget {
  const GeneralHomePage({super.key});

  @override
  State<GeneralHomePage> createState() => _GeneralHomePageState();
}

class _GeneralHomePageState extends State<GeneralHomePage> {
  final List<Map<String, String>> _appointments = [];

  // Método para abrir formulario (crear/editar)
  void _openAppointmentForm({Map<String, String>? cita, int? index}) {
    final pacienteController =
        TextEditingController(text: cita != null ? cita["paciente"] : "");
    final fechaController =
        TextEditingController(text: cita != null ? cita["fecha"] : "");
    final horaController =
        TextEditingController(text: cita != null ? cita["hora"] : "");
    final doctorController =
        TextEditingController(text: cita != null ? cita["doctor"] : "");

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF76F2B2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            cita == null ? "Nueva Cita" : "Editar Cita",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildTextField("Paciente", pacienteController),
                const SizedBox(height: 10),
                _buildTextField("Fecha (DD/MM/YYYY)", fechaController),
                const SizedBox(height: 10),
                _buildTextField("Hora (HH:MM)", horaController),
                const SizedBox(height: 10),
                _buildTextField("Doctor", doctorController),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar",
                  style: TextStyle(color: Colors.black87)),
            ),
            ElevatedButton(
              onPressed: () {
                final nuevaCita = {
                  "paciente": pacienteController.text,
                  "fecha": fechaController.text,
                  "hora": horaController.text,
                  "doctor": doctorController.text,
                };

                setState(() {
                  if (cita == null) {
                    _appointments.add(nuevaCita);
                  } else {
                    _appointments[index!] = nuevaCita;
                  }
                });

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.8),
                foregroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(cita == null ? "Guardar" : "Actualizar"),
            ),
          ],
        );
      },
    );
  }

  // Eliminar cita
  void _deleteAppointment(int index) {
    setState(() {
      _appointments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76F2B2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF76F2B2),
        elevation: 0,
        title: const Text(
          "Centro de Salud - Costa King",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.black87),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Gestión de Citas Médicas",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // Lista de citas
            Expanded(
              child: _appointments.isEmpty
                  ? const Center(
                      child: Text(
                        "No hay citas registradas",
                        style: TextStyle(color: Colors.black54),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _appointments.length,
                      itemBuilder: (context, index) {
                        final cita = _appointments[index];
                        return Card(
                          color: Colors.white.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(cita["paciente"]!),
                            subtitle: Text(
                                "Fecha: ${cita["fecha"]} - Hora: ${cita["hora"]}\nDoctor: ${cita["doctor"]}"),
                            isThreeLine: true,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blue),
                                  onPressed: () => _openAppointmentForm(
                                      cita: cita, index: index),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () => _deleteAppointment(index),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 10),

            // Botón para agregar cita
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _openAppointmentForm(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.7),
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Agregar Cita",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Campo de texto con estilo
  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
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
}
