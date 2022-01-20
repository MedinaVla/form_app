class ClientModel {
  String name;
  String spell;
  String movile;
  int document;
  String genero;
  int idClient;
  int documentType;
  int rut;
  ClientModel({
    required this.name,
    required this.spell,
    required this.movile,
    required this.document,
    required this.genero,
    required this.idClient,
    required this.documentType,
    required this.rut,
  });

  @override
  String toString() {
    return 'Name: $name Spell: $spell';
  }
}
