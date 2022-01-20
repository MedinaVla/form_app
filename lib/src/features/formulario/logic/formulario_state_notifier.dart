part of 'formulario_provider.dart';

/// Defines all the Formulario logic the app will use
class FormularioNotifier extends StateNotifier<FormularioState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  FormularioNotifier({required SaveClientUseCase useCase})
      : _useCase = useCase,
        super(const FormularioState.initial());

  final SaveClientUseCase _useCase;

  Future<void> save(ClientModel params) async {
    state = const FormularioState.loading();

    final result = await _useCase(params);
    result.fold((error) => state = const FormularioState.error(),
        (mesagge) => state = FormularioState.data(mesagge));
  }
}
