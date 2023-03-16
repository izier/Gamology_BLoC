import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/domain/entities/publisher.dart';

class PublisherModel extends Equatable{
  const PublisherModel({
    required this.id,
    required this.name,
  });
  final int id;
  final String name;

  factory PublisherModel.fromJson(Map<String, dynamic> json) => PublisherModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

  Publisher toEntity() {
    return Publisher(
      id: id,
      name: name,
    );
  }
    @override
  List<Object?> get props => [
    id,
    name
  ];
}
