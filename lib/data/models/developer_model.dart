import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/domain/entities/developer.dart';

class DeveloperModel extends Equatable{
  const DeveloperModel({
    required this.id,
    required this.name,
  });
  final int id;
  final String name;

  factory DeveloperModel.fromJson(Map<String, dynamic> json) => DeveloperModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

  Developer toEntity() {
    return Developer(
      id: id,
      name: name,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
  ];
}