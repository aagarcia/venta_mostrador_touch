// To parse this JSON data, do
//
//     final carritoModel = carritoModelFromJson(jsonString);

import 'dart:convert';

class CarritoModel {
    CarritoModel({
        this.id,
        this.cantidad,
        this.valorUnitario,
        this.valorTotal,
    });

    String? id;
    int? cantidad;
    double? valorUnitario;
    double? valorTotal;

    factory CarritoModel.fromRawJson(String str) => CarritoModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CarritoModel.fromJson(Map<String, dynamic> json) => CarritoModel(
        id: json["id"],
        cantidad: json["cantidad"],
        valorUnitario: json["valorUnitario"]?.toDouble(),
        valorTotal: json["valorTotal"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cantidad": cantidad,
        "valorUnitario": valorUnitario,
        "valorTotal": valorTotal,
    };
}
