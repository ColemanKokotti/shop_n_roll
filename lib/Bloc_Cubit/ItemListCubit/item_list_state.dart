class ItemListState {
  final Map<String, dynamic>? deletedItem;
  final String? deletedItemId;
  final Map<String, int> itemQuantities;
  final String? errorMessage;

  ItemListState({
    this.deletedItem,
    this.deletedItemId,
    this.itemQuantities = const {},
    this.errorMessage,
  });

  ItemListState copyWith({
    Map<String, dynamic>? deletedItem,
    String? deletedItemId,
    Map<String, int>? itemQuantities,
    String? errorMessage,
  }) {
    return ItemListState(
      deletedItem: deletedItem ?? this.deletedItem,
      deletedItemId: deletedItemId ?? this.deletedItemId,
      itemQuantities: itemQuantities ?? this.itemQuantities,
      errorMessage: errorMessage,
    );
  }

  ItemListState clearDeletedItem() {
    return copyWith(deletedItem: null, deletedItemId: null, errorMessage: null);
  }

  ItemListState updateQuantity(String itemId, int quantity) {
    return copyWith(
      itemQuantities: Map.from(itemQuantities)..[itemId] = quantity,
      errorMessage: null,
    );
  }

  ItemListState setError(String message) {
    return copyWith(errorMessage: message);
  }
}
