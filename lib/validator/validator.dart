class NoteValidator {
  static String? isTitleValid(String? text) {
    if (text != null && text.contains(RegExp(r"[a-z]{3}"))) {
      return null;
    } else {
      return "PLease enter a Title for your note";
    }
  }

  static String? isSubtitleValid(String? text) {
    if (text != null &&
        text.contains(RegExp(
            r"[a-z]{3}")) /*&& text.contains("@") && text.contains(".")*/) {
      return null;
    } else {
      return "PLease enter a description for your note";
    }
  }

  // static String? isPasswordValid(String? text) {
  //   if (text != null && text.length >= 8) {
  //     return null;
  //   } else {
  //     return "Password is not valid (the password need to be up 8)";
  //   }
  // }
}
