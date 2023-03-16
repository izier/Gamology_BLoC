import 'package:equatable/equatable.dart';
import 'package:gamology_bloc/domain/entities/requirements.dart';

class RequirementsModel extends Equatable{
  const RequirementsModel({
    this.minimum,
    this.recommended,
  });
  final String? minimum;
  final String? recommended;

  factory RequirementsModel.fromJson(Map<String, dynamic> json) => RequirementsModel(
    minimum: json["minimum"],
    recommended: json["recommended"],
  );

  Map<String, dynamic> toJson() => {
    "minimum": minimum,
    "recommended": recommended,
  };

  Requirements toEntity() {
    return Requirements(
      minimum: minimum,
      recommended: recommended,
    );
  }
  @override
  List<Object?> get props => [
    minimum,
    recommended
  ];
}
