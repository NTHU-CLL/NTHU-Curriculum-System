class FilterController {
  bool onSelected;
  String name;

  FilterController({
    required this.onSelected,
    required this.name,
  });
}

class SystemController {
  bool isMobile;
  bool isChinese;
  bool isDarkMode;
  double widthFactor;

  SystemController({
    required this.isMobile,
    required this.isChinese,
    required this.isDarkMode,
    required this.widthFactor,
  });
}
