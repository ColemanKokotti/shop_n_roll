class IconSelectorState {
  final String currentIconName;
  final String? errorMessage;

  IconSelectorState({required this.currentIconName, this.errorMessage});

  IconSelectorState copyWith({String? currentIconName, String? errorMessage}) {
    return IconSelectorState(
      currentIconName: currentIconName ?? this.currentIconName,
      errorMessage: errorMessage,
    );
  }
}