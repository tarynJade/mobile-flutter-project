  
  class TextUtils {
  static List<String> cleanInstructions(String? rawInstructions) {
    if (rawInstructions == null || rawInstructions.isEmpty) return [];

    return rawInstructions
        .replaceAll(RegExp(r'<\/?ol>|<\/?li>|Instructions'), '')
        .split('.')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }
}