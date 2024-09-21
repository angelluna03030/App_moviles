import 'dart:convert';

ModelPages welcomeFromJson(String str) => ModelPages.fromJson(json.decode(str));

String welcomeToJson(ModelPages data) => json.encode(data.toJson());

class ModelPages {
  String id;
  String titulo;
  double valor;
  bool disponible;
  String fotoUrl;

  ModelPages({
     required this.id,
     this.titulo = '',
     this.valor = 0.0,
     this.disponible = true,
    required this.fotoUrl,
  });

  factory ModelPages.fromJson(Map<String, dynamic> json) => ModelPages(
        id:        json['id'],
        titulo:    json['titulo'],
        valor:     json['valor'],
        disponible:json['disponible'],
        fotoUrl:   json['fotoUrl'],
      );

  Map<String, dynamic> toJson() => {
   "id"        :id,
   "titulo"    :titulo,
   "valor"     :valor,
   "disponible":disponible,
   "fotoUrl"   :fotoUrl
  };
}
