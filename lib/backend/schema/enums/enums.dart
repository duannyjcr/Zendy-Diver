import 'package:collection/collection.dart';

enum Role {
  customer,
  seller,
  rider,
  admin,
}

enum DeliveryStatus {
  draft,
  paid,
  pending,
  assigned,
  collected,
  completed,
  canceled,
}

enum DriverStatus {
  available,
  notAvailable,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Role):
      return Role.values.deserialize(value) as T?;
    case (DeliveryStatus):
      return DeliveryStatus.values.deserialize(value) as T?;
    case (DriverStatus):
      return DriverStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
