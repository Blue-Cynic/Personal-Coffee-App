String calculateStrengthLabel(double ratio) {
  if (ratio <= 14) {
    return 'Strong';
  } else if (ratio <= 17) {
    return 'Balanced';
  } else {
    return 'Mild';
  }
}