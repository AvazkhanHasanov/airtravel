// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 Status get popularStatus; Status get packagesStatus; String? get popularError; String? get packagesError; List<PopularModel> get popularPlace; List<PackageListModel> get packages;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.popularStatus, popularStatus) || other.popularStatus == popularStatus)&&(identical(other.packagesStatus, packagesStatus) || other.packagesStatus == packagesStatus)&&(identical(other.popularError, popularError) || other.popularError == popularError)&&(identical(other.packagesError, packagesError) || other.packagesError == packagesError)&&const DeepCollectionEquality().equals(other.popularPlace, popularPlace)&&const DeepCollectionEquality().equals(other.packages, packages));
}


@override
int get hashCode => Object.hash(runtimeType,popularStatus,packagesStatus,popularError,packagesError,const DeepCollectionEquality().hash(popularPlace),const DeepCollectionEquality().hash(packages));

@override
String toString() {
  return 'HomeState(popularStatus: $popularStatus, packagesStatus: $packagesStatus, popularError: $popularError, packagesError: $packagesError, popularPlace: $popularPlace, packages: $packages)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 Status popularStatus, Status packagesStatus, String? popularError, String? packagesError, List<PopularModel> popularPlace, List<PackageListModel> packages
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? popularStatus = null,Object? packagesStatus = null,Object? popularError = freezed,Object? packagesError = freezed,Object? popularPlace = null,Object? packages = null,}) {
  return _then(_self.copyWith(
popularStatus: null == popularStatus ? _self.popularStatus : popularStatus // ignore: cast_nullable_to_non_nullable
as Status,packagesStatus: null == packagesStatus ? _self.packagesStatus : packagesStatus // ignore: cast_nullable_to_non_nullable
as Status,popularError: freezed == popularError ? _self.popularError : popularError // ignore: cast_nullable_to_non_nullable
as String?,packagesError: freezed == packagesError ? _self.packagesError : packagesError // ignore: cast_nullable_to_non_nullable
as String?,popularPlace: null == popularPlace ? _self.popularPlace : popularPlace // ignore: cast_nullable_to_non_nullable
as List<PopularModel>,packages: null == packages ? _self.packages : packages // ignore: cast_nullable_to_non_nullable
as List<PackageListModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Status popularStatus,  Status packagesStatus,  String? popularError,  String? packagesError,  List<PopularModel> popularPlace,  List<PackageListModel> packages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.popularStatus,_that.packagesStatus,_that.popularError,_that.packagesError,_that.popularPlace,_that.packages);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Status popularStatus,  Status packagesStatus,  String? popularError,  String? packagesError,  List<PopularModel> popularPlace,  List<PackageListModel> packages)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.popularStatus,_that.packagesStatus,_that.popularError,_that.packagesError,_that.popularPlace,_that.packages);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Status popularStatus,  Status packagesStatus,  String? popularError,  String? packagesError,  List<PopularModel> popularPlace,  List<PackageListModel> packages)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.popularStatus,_that.packagesStatus,_that.popularError,_that.packagesError,_that.popularPlace,_that.packages);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({required this.popularStatus, required this.packagesStatus, required this.popularError, required this.packagesError, required final  List<PopularModel> popularPlace, required final  List<PackageListModel> packages}): _popularPlace = popularPlace,_packages = packages;
  

@override final  Status popularStatus;
@override final  Status packagesStatus;
@override final  String? popularError;
@override final  String? packagesError;
 final  List<PopularModel> _popularPlace;
@override List<PopularModel> get popularPlace {
  if (_popularPlace is EqualUnmodifiableListView) return _popularPlace;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_popularPlace);
}

 final  List<PackageListModel> _packages;
@override List<PackageListModel> get packages {
  if (_packages is EqualUnmodifiableListView) return _packages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packages);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.popularStatus, popularStatus) || other.popularStatus == popularStatus)&&(identical(other.packagesStatus, packagesStatus) || other.packagesStatus == packagesStatus)&&(identical(other.popularError, popularError) || other.popularError == popularError)&&(identical(other.packagesError, packagesError) || other.packagesError == packagesError)&&const DeepCollectionEquality().equals(other._popularPlace, _popularPlace)&&const DeepCollectionEquality().equals(other._packages, _packages));
}


@override
int get hashCode => Object.hash(runtimeType,popularStatus,packagesStatus,popularError,packagesError,const DeepCollectionEquality().hash(_popularPlace),const DeepCollectionEquality().hash(_packages));

@override
String toString() {
  return 'HomeState(popularStatus: $popularStatus, packagesStatus: $packagesStatus, popularError: $popularError, packagesError: $packagesError, popularPlace: $popularPlace, packages: $packages)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 Status popularStatus, Status packagesStatus, String? popularError, String? packagesError, List<PopularModel> popularPlace, List<PackageListModel> packages
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? popularStatus = null,Object? packagesStatus = null,Object? popularError = freezed,Object? packagesError = freezed,Object? popularPlace = null,Object? packages = null,}) {
  return _then(_HomeState(
popularStatus: null == popularStatus ? _self.popularStatus : popularStatus // ignore: cast_nullable_to_non_nullable
as Status,packagesStatus: null == packagesStatus ? _self.packagesStatus : packagesStatus // ignore: cast_nullable_to_non_nullable
as Status,popularError: freezed == popularError ? _self.popularError : popularError // ignore: cast_nullable_to_non_nullable
as String?,packagesError: freezed == packagesError ? _self.packagesError : packagesError // ignore: cast_nullable_to_non_nullable
as String?,popularPlace: null == popularPlace ? _self._popularPlace : popularPlace // ignore: cast_nullable_to_non_nullable
as List<PopularModel>,packages: null == packages ? _self._packages : packages // ignore: cast_nullable_to_non_nullable
as List<PackageListModel>,
  ));
}


}

// dart format on
