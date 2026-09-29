class _StrengthRange {
  final double strongMax;
  final double weakMin;

  const _StrengthRange({required this.strongMax, required this.weakMin});
}

const Map<String, _StrengthRange> _strengthRanges = {
  'Moka Pot': _StrengthRange(strongMax: 7, weakMin: 12),
  'French Press': _StrengthRange(strongMax: 12, weakMin: 18),
  'Cold Brew': _StrengthRange(strongMax: 8, weakMin: 15),
};

String calculateStrengthLabel(String brewMethod, double ratio) {
  final range = _strengthRanges[brewMethod] ??
      const _StrengthRange(strongMax: 12, weakMin: 18);

  if (ratio <= range.strongMax) {
    return 'Strong';
  } else if (ratio >= range.weakMin) {
    return 'Mild';
  } else {
    return 'Balanced';
  }
}