import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProposerFormationPage extends StatefulWidget {
  @override
  _ProposerFormationPageState createState() => _ProposerFormationPageState();
}

class _ProposerFormationPageState extends State<ProposerFormationPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController lieuController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? selectedCategory;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final List<String> categories = [
    'Développement Web',
    'Mobile',
    'Marketing',
    'UI/UX Design',
    'Business',
    'Finance',
    'Autre',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 500;

          return Column(
            children: [
              const Divider(height: 1, thickness: 1, color: Colors.black12),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          isWide
                              ? Row(
                            children: [
                              Expanded(child: _buildField("Titre de la formation", titleController, "Entrez le titre", Icons.school_outlined)),
                              const SizedBox(width: 12),
                              Expanded(child: _buildField("Durée", durationController, "Durée en heures", Icons.timer_outlined, TextInputType.number)),
                            ],
                          )
                              : Column(
                            children: [
                              _buildField("Titre de la formation", titleController, "Entrez le titre", Icons.school_outlined),
                              const SizedBox(height: 12),
                              _buildField("Durée", durationController, "Durée en heures", Icons.timer_outlined, TextInputType.number),
                            ],
                          ),
                          const SizedBox(height: 12),

                          _buildField("Description", descriptionController, "Décrivez la formation", null, TextInputType.multiline, 5),
                          const SizedBox(height: 12),

                          _buildField("Lieu de la formation", lieuController, "Adresse ou lieu", Icons.location_on_outlined),
                          const SizedBox(height: 12),

                          _buildLabel("Catégorie"),
                          _buildCardContainer(
                            DropdownButtonFormField<String>(
                              value: selectedCategory,
                              decoration: _inputDecoration(icon: Icons.category_outlined),
                              hint: const Text("Sélectionnez une catégorie", style: TextStyle(fontSize: 13)),
                              items: categories.map((category) {
                                return DropdownMenuItem<String>(
                                  value: category,
                                  child: Text(category),
                                );
                              }).toList(),
                              onChanged: (value) => setState(() => selectedCategory = value),
                            ),
                          ),
                          const SizedBox(height: 12),

                          isWide
                              ? Row(
                            children: [
                              Expanded(child: _buildDatePicker(context)),
                              const SizedBox(width: 12),
                              Expanded(child: _buildTimePicker(context)),
                            ],
                          )
                              : Column(
                            children: [
                              _buildDatePicker(context),
                              const SizedBox(height: 12),
                              _buildTimePicker(context),
                            ],
                          ),
                          const SizedBox(height: 24),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: 140,
                              child: ElevatedButton.icon(
                                onPressed: _handleSubmit,
                                icon: const Icon(Icons.send_outlined, size: 18, color: Colors.white),
                                label: const Text("Envoyer", style: TextStyle(fontSize: 14, color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF882BD0),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  elevation: 2,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      title: const Text(
        "Proposer une formation",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      centerTitle: false,
      elevation: 0,
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black87),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller, String hint, IconData? icon,
      [TextInputType inputType = TextInputType.text, int maxLines = 1]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        _buildCardContainer(
          _buildInputField(
            controller: controller,
            hintText: hint,
            icon: icon,
            keyboardType: inputType,
            maxLines: maxLines,
          ),
        ),
      ],
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    IconData? icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: _inputDecoration(icon: icon).copyWith(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 13),
      ),
    );
  }

  Widget _buildCardContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: child,
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel("Date"),
        _buildCardContainer(
          GestureDetector(
            onTap: _pickDate,
            child: AbsorbPointer(
              child: TextFormField(
                decoration: _inputDecoration(icon: Icons.calendar_today_outlined).copyWith(
                  hintText: selectedDate != null
                      ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                      : "Choisir",
                  hintStyle: const TextStyle(fontSize: 13),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel("Heure"),
        _buildCardContainer(
          GestureDetector(
            onTap: _pickTime,
            child: AbsorbPointer(
              child: TextFormField(
                decoration: _inputDecoration(icon: Icons.access_time_outlined).copyWith(
                  hintText: selectedTime != null
                      ? selectedTime!.format(context)
                      : "Choisir",
                  hintStyle: const TextStyle(fontSize: 13),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration({IconData? icon}) {
    return InputDecoration(
      isDense: true,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      prefixIcon: icon != null
          ? Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Icon(icon, size: 18, color: Colors.grey[600]),
      )
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Color(0xFF882BD0)),
      ),
    );
  }

  void _handleSubmit() {
    if (titleController.text.isEmpty ||
        durationController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        lieuController.text.isEmpty ||
        selectedCategory == null ||
        selectedDate == null ||
        selectedTime == null) {
      Get.snackbar("Erreur", "Tous les champs sont requis", backgroundColor: Colors.red, colorText: Colors.white);
    } else {
      Get.snackbar("Succès", "Votre formation a été envoyée", backgroundColor: Colors.green, colorText: Colors.white);
      Get.back();
    }
  }

  Future<void> _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> _pickTime() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }
}





