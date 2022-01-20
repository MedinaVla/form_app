import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_app/src/features/formulario/logic/formulario_provider.dart';

import 'core/utils/validator.dart';
import 'features/formulario/screens/widgets/save_button_form_widget.dart';
import 'features/formulario/screens/widgets/select_widget.dart';
import 'features/formulario/screens/widgets/text_form_widget.dart';

class FormScreen extends ConsumerWidget {
  FormScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final spellController = TextEditingController();
  final movileController = TextEditingController();
  final documentController = TextEditingController();
  final clientIDController = TextEditingController();
  final List<String> optionsSelect = const ['Masculino', 'Femenino'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generoSelectedState = ref.watch(selectedGeneroProvider.state);
    final saveState = ref.watch(formularioNotifierProvider);

    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormWidget(
              validator: validateName(),
              controller: nameController,
              labelText: 'Nombre',
              iconValue: Icons.perm_identity,
              maxLength: 30,
            ),
            TextFormWidget(
              validator: validateSpell(),
              controller: spellController,
              labelText: 'Apellidos',
              iconValue: Icons.perm_identity,
              maxLength: 30,
            ),
            TextFormWidget(
              validator: validateNumber(),
              controller: movileController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              labelText: '# Celular',
              iconValue: Icons.perm_identity,
              maxLength: 30,
            ),
            TextFormWidget(
              controller: documentController,
              labelText: 'Documento',
              validator: validateNumber(),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              iconValue: Icons.perm_identity,
              maxLength: 30,
            ),
            const SizedBox(
              height: 10,
            ),
            AppDropdownInput(
              colorSelected: const Color(0xFF222420),
              getLabel: (value) => value.toString(),
              icon: const Icon(Icons.person),
              onChanged: (value) {
                generoSelectedState.state = value.toString();
              },
              value: generoSelectedState.state.isEmpty
                  ? optionsSelect.first
                  : generoSelectedState.state,
              options: optionsSelect,
            ),
            const SizedBox(
              height: 20.0,
            ),
            saveState.when(
                initial: () => SaveButtonForm(
                      formKey: _formKey,
                      nameController: nameController,
                      spellController: spellController,
                      movileController: movileController,
                      documentController: documentController,
                      clientIDController: clientIDController,
                    ),
                loading: () => const CircularProgressIndicator(),
                data: (message) {
                  return SaveButtonForm(
                    backgroundColor: const Color(0xFF1CAA17),
                    formKey: _formKey,
                    nameController: nameController,
                    spellController: spellController,
                    movileController: movileController,
                    documentController: documentController,
                    clientIDController: clientIDController,
                  );
                },
                error: (_) {
                  return SaveButtonForm(
                    backgroundColor: const Color(0xFFC71010),
                    formKey: _formKey,
                    nameController: nameController,
                    spellController: spellController,
                    movileController: movileController,
                    documentController: documentController,
                    clientIDController: clientIDController,
                  );
                })
          ],
        ));
  }
}
