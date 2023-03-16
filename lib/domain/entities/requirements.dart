import 'package:equatable/equatable.dart';

class Requirements extends Equatable{
  const Requirements({
    this.minimum,
    this.recommended,
  });
  final String? minimum;
  final String? recommended;

  @override
  List<Object?> get props => [
    minimum,
    recommended
  ];
}
