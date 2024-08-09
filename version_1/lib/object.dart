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

class Curriculum {
  String id;
  String name;
  String department;
  String teacher;
  String credit;
  String time;
  String location;
  String prerequisite;
  String note;
  String description;
  String language;
  String type;
  String category;
  String year;
  String semester;
  String url;

  Curriculum({
    required this.id,
    required this.name,
    required this.department,
    required this.teacher,
    required this.credit,
    required this.time,
    required this.location,
    required this.prerequisite,
    required this.note,
    required this.description,
    required this.language,
    required this.type,
    required this.category,
    required this.year,
    required this.semester,
    required this.url,
  });
}
