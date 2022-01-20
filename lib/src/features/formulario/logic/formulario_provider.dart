import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_app/src/features/formulario/data/models/client_model.dart';
import 'package:form_app/src/features/formulario/data/repositories/form_repository.dart';
import 'package:form_app/src/features/formulario/domain/repositories/iform_repository.dart';
import 'package:form_app/src/features/formulario/domain/usecases/save_client.dart';

import 'formulario_state.dart';

part 'formulario_state_notifier.dart';

final formularioNotifierProvider =
    StateNotifierProvider<FormularioNotifier, FormularioState>(
  (ref) => FormularioNotifier(useCase: ref.watch(_saveClientProvider)),
);

/// Repositories Providers
final _formRepository = Provider<IFormRepository>((ref) => FormRepository());

/// Use Cases Providers
final _saveClientProvider = Provider(
    (ref) => SaveClientUseCase(repository: ref.watch(_formRepository)));

///Selected Provider
final selectedGeneroProvider = StateProvider<String>((ref) => '');
