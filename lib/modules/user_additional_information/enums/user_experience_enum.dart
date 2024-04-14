enum UserExperience {
  BEGINNER,
  INTERMEDIATE,
  ADVANCED,
}

extension UserExperienceExtension on UserExperience {
  String get value {
    switch (this) {
      case UserExperience.BEGINNER:
        return 'beginner';
      case UserExperience.INTERMEDIATE:
        return 'intermediate';
      case UserExperience.ADVANCED:
        return 'advanced';
    }
  }
}