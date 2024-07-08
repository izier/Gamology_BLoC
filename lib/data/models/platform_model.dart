import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/data/models/requirements_model.dart';
import 'package:gamology_bloc/domain/entities/platform.dart';

class PlatformModel extends Equatable{
  const PlatformModel({
    required this.id,
    required this.name,
    this.requirements,
  });
  final int id;
  final String name;
  final RequirementsModel? requirements;

  factory PlatformModel.fromJson(Map<String, dynamic> json) => PlatformModel(
    id: json["platform"]["id"],
    name: json["platform"]["name"],
    requirements: json["requirements"] == null ? null : RequirementsModel.fromJson(json["requirements"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };

  Platform toEntity() {
    return Platform(
      id: id,
      name: name,
      requirements: requirements?.toEntity(),
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    requirements,
  ];
}