extension StringExtension on String {
  String toCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

    //Example: To capitalize
  }

  String toCamelCase() {
    List<String> words = split(RegExp(r'\s+|_+|-+')); // Split by spaces, underscores, or hyphens
    String result = words[0].toLowerCase(); // Convert the first word to lowercase

    for (int i = 1; i < words.length; i++) {
      result += words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
    }

    return result;

    //Example: camelCaseString
  }

  String toTitleCase() {
    List<String> words = split(RegExp(r'\s+|_+|-+')); // Split by spaces, underscores, or hyphens
    String result = '';

    for (int i = 0; i < words.length; i++) {
      result += words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
      if (i < words.length - 1) {
        result += ' ';
      }
    }

    return result;

    //Example: Title Case String
  }

  String toPascalCase() {
    List<String> words = split(RegExp(r'\s+|_+|-+')); // Split by spaces, underscores, or hyphens
    String result = '';

    for (int i = 0; i < words.length; i++) {
      result += words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
    }

    return result;

    //Example: PascalCaseString
  }

  String toSnakeCase() {
    List<String> words = split(RegExp(r'\s+|_+|-+')); // Split by spaces, underscores, or hyphens
    String result = '';

    for (int i = 0; i < words.length; i++) {
      result += words[i].toLowerCase();
      if (i < words.length - 1) {
        result += '_';
      }
    }

    return result;

    //Example: snake_case_string
  }

  String toKebabCase() {
    List<String> words = split(RegExp(r'\s+|_+|-+')); // Split by spaces, underscores, or hyphens
    String result = '';

    for (int i = 0; i < words.length; i++) {
      result += words[i].toLowerCase();
      if (i < words.length - 1) {
        result += '-';
      }
    }

    return result;

    //Example: kebab-case-string
  }
}
