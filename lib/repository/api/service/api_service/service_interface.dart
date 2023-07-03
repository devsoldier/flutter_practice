// ignore_for_file: body_might_complete_normally_nullable

abstract interface class ServiceInterface<T> {
  Future<T?> getCategories() async {}

  Future<T?> getCategoryDetails(String? categoryID) async {}

  Future<T?> getDetails(int? itemID) async {}
}
