import 'package:equatable/equatable.dart';

abstract class Question extends Equatable{
  final int _id;
  final String _title;
  final String? _description;
  final String? _imageUrl;
  final bool _isMandatory;

  const Question({required id, required title, required description, required imageUrl, required isMandatory}) :
      _id = id, _title = title, _description = description, _imageUrl = imageUrl, _isMandatory = isMandatory;

  @override
  String toString() {
    return 'Question{_id: $_id, _title: $_title, _description: $_description, _imageUrl: $_imageUrl, _isMandatory: $_isMandatory}';
  }

  int get id => _id;

  bool get isMandatory => _isMandatory;

  String? get imageUrl => _imageUrl;

  String? get description => _description;

  String get title => _title;
}