import 'dart:convert' show json;

class ResultDto<T> {
  final bool success;
  final T data;

  ResultDto({
    this.success = true,
    this.data,
  });

  factory ResultDto.fromJson(jsonRes) => jsonRes == null
      ? null
      : ResultDto(
          success: jsonRes['success'] ?? true,
          data: jsonRes['data'],
        );
  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data,
      };

  @override
  String toString() {
    return json.encode(this);
  }
}
