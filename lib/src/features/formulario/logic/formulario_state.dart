import 'package:freezed_annotation/freezed_annotation.dart';

part 'formulario_state.freezed.dart';

@freezed
abstract class FormularioState with _$FormularioState {
  /// Data is present state
  const factory FormularioState.data(mesagge) = Data;

  /// Initial/default state
  const factory FormularioState.initial() = Initial;

  /// Data is loading state
  const factory FormularioState.loading() = Loading;

  /// Error when loading data state
  const factory FormularioState.error([String? message]) = Error;
}
