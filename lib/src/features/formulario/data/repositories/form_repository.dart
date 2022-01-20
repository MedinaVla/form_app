import 'package:errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:form_app/src/features/formulario/data/data.dart';
import 'package:form_app/src/features/formulario/domain/repositories/iform_repository.dart';

class FormRepository implements IFormRepository {
  @override
  Future<Either<Failure, String>> saveClient(ClientModel params) async {
    try {
      ///Fake Save Implementation
      await Future.delayed(const Duration(seconds: 2));
      return const Right('Datos salvados');
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
