class Utils {
  static String toRoman(int number) {
    if (number < 1 || number > 3999) return 'Invalid';

    const numerals = {
      1000: 'M',
      900: 'CM',
      500: 'D',
      400: 'CD',
      100: 'C',
      90: 'XC',
      50: 'L',
      40: 'XL',
      10: 'X',
      9: 'IX',
      5: 'V',
      4: 'IV',
      1: 'I',
    };

    var result = '';

    numerals.forEach((value, numeral) {
      while (number >= value) {
        result += numeral;
        number -= value;
      }
    });

    return result;
  }
}
