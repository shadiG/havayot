// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_cubit.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NavigationModel> _$navigationModelSerializer =
    new _$NavigationModelSerializer();

class _$NavigationModelSerializer
    implements StructuredSerializer<NavigationModel> {
  @override
  final Iterable<Type> types = const [NavigationModel, _$NavigationModel];
  @override
  final String wireName = 'NavigationModel';

  @override
  Iterable<Object?> serialize(Serializers serializers, NavigationModel object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  NavigationModel deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new NavigationModelBuilder().build();
  }
}

class _$NavigationModel extends NavigationModel {
  factory _$NavigationModel([void Function(NavigationModelBuilder)? updates]) =>
      (new NavigationModelBuilder()..update(updates))._build();

  _$NavigationModel._() : super._();

  @override
  NavigationModel rebuild(void Function(NavigationModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavigationModelBuilder toBuilder() =>
      new NavigationModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavigationModel;
  }

  @override
  int get hashCode {
    return 722969273;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'NavigationModel').toString();
  }
}

class NavigationModelBuilder
    implements Builder<NavigationModel, NavigationModelBuilder> {
  _$NavigationModel? _$v;

  NavigationModelBuilder();

  @override
  void replace(NavigationModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NavigationModel;
  }

  @override
  void update(void Function(NavigationModelBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NavigationModel build() => _build();

  _$NavigationModel _build() {
    final _$result = _$v ?? new _$NavigationModel._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
