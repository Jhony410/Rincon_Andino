import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _nameController = TextEditingController(text: 'María García');
  final _phoneController = TextEditingController(text: '+51 987 654 321');
  final _emailController = TextEditingController(text: 'maria.garcia@email.com');
  final _birthdayController = TextEditingController(text: '12/03/1994');
  int _genderIndex = 0; // 0: Femenino, 1: Masculino, 2: Prefiero no decir

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/profile');
            }
          },
        ),
        title: const Text('Editar perfil'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Avatar with Camera Badge
                Center(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 92,
                            height: 92,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppTheme.border, width: 3),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(20),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/maria.jpg',
                                fit: BoxFit.cover,
                                errorBuilder: (c, e, s) => const Icon(Icons.person, size: 50, color: AppTheme.primary),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppTheme.primary,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2.5),
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Toca para cambiar tu foto',
                        style: TextStyle(
                          fontSize: 11.5,
                          color: AppTheme.gray,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                
                // Form Fields
                _buildFieldLabel('Nombre completo'),
                const SizedBox(height: 6),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(hintText: 'Nombre completo'),
                ),
                const SizedBox(height: 16),

                _buildFieldLabel('Teléfono'),
                const SizedBox(height: 6),
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(hintText: 'Teléfono'),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),

                _buildFieldLabel('Correo electrónico'),
                const SizedBox(height: 6),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(hintText: 'Correo electrónico'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),

                _buildFieldLabel('Fecha de nacimiento'),
                const SizedBox(height: 6),
                TextField(
                  controller: _birthdayController,
                  decoration: const InputDecoration(hintText: 'DD/MM/AAAA'),
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 16),

                _buildFieldLabel('Género'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildGenderChip('Femenino', 0),
                    const SizedBox(width: 8),
                    _buildGenderChip('Masculino', 1),
                    const SizedBox(width: 8),
                    _buildGenderChip('Otro', 2),
                  ],
                ),
              ],
            ),
          ),
          // Save Button Bar
          Container(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 12 + MediaQuery.of(context).padding.bottom),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppTheme.border)),
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Save profile and pop back
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/profile');
                  }
                },
                child: const Text('Guardar cambios'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppTheme.gray,
      ),
    );
  }

  Widget _buildGenderChip(String label, int index) {
    final isSelected = _genderIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _genderIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : Colors.white,
          border: Border.all(color: isSelected ? AppTheme.primary : AppTheme.border, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppTheme.text,
          ),
        ),
      ),
    );
  }
}
