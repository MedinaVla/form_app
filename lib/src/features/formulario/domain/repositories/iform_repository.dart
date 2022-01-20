import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';
import 'package:form_app/src/features/formulario/data/data.dart';

abstract class IFormRepository {
  Future<Either<Failure, String>> saveClient(ClientModel params);
}
