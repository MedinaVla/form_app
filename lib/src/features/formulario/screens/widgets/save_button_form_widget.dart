import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_app/src/features/formulario/data/data.dart';
import 'package:form_app/src/features/formulario/logic/formulario_provider.dart';

class SaveButtonForm extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController spellController;
  final TextEditingController movileController;
  final TextEditingController documentController;
  final TextEditingController clientIDController;

  const SaveButtonForm(
      {Key? key,
      this.backgroundColor,
      required this.formKey,
      required this.nameController,
      required this.spellController,
      required this.movileController,
      required this.documentController,
      required this.clientIDController})
      : super(key: key);
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generoSelectedState = ref.watch(selectedGeneroProvider.state);
    return FloatingActionButton(
      backgroundColor: backgroundColor,
      child: const Icon(Icons.save),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          ClientModel newClient = ClientModel(
              name: nameController.text,
              spell: spellController.text,
              movile: movileController.text,
              document: int.parse(documentController.text),
              genero: generoSelectedState.state,
              idClient: int.parse(documentController.text),
              documentType: 1,
              rut: 0);
          ref.read(formularioNotifierProvider.notifier).save(newClient);
          clearForm();
        }
      },
    );
  }

  void clearForm() {
    nameController.clear();
    spellController.clear();
    movileController.clear();
    documentController.clear();
  }
}
