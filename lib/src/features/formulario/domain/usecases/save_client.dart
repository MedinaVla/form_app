import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:form_app/src/core/utils/usecase.dart';
import 'package:form_app/src/features/formulario/data/data.dart';
import 'package:form_app/src/features/formulario/domain/repositories/iform_repository.dart';

class SaveClientUseCase extends UseCase<String, ClientModel> {
  SaveClientUseCase({required this.repository});

  final IFormRepository repository;
  @override
  Future<Either<Failure, String>> call(ClientModel params) async {
    return repository.saveClient(params);
  }
}
