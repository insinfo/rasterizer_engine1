enum cover_scale_e {
  cover_shift(8), //----cover_shift
  cover_size(1 << 8), //----cover_size
  cover_mask((1 << 8) - 1), //----cover_mask
  cover_none(0), //----cover_none
  cover_full((1 << 8) - 1); //----cover_full

  const cover_scale_e(this.val);
  final int val;

  @override
  String toString() => 'cover_scale_e($val)';
}

//----------------------------------------------------poly_subpixel_scale_e
// These constants determine the subpixel accuracy, to be more precise,
// the number of bits of the fractional part of the coordinates.
// The possible coordinate capacity in bits can be calculated by formula:
// sizeof(int) * 8 - poly_subpixel_shift, i.e, for 32-bit integers and
// 8-bits fractional part the capacity is 24 bits.
enum poly_subpixel_scale_e {
  poly_subpixel_shift(8), //----poly_subpixel_shift
  poly_subpixel_scale(1 << 8), //----poly_subpixel_scale
  poly_subpixel_mask((1 << 8) - 1); //----poly_subpixel_mask

  const poly_subpixel_scale_e(this.val);
  final int val;
}

//----------------------------------------------------------filling_rule_e
enum filling_rule_e { fill_non_zero, fill_even_odd }

//-----------------------------------------------------------------------pi
const double pi = 3.14159265358979323846;

//------------------------------------------------------------------deg2rad
double deg2rad(double deg) {
  return deg * pi / 180.0;
}

//------------------------------------------------------------------rad2deg
double rad2deg(double rad) {
  return rad * 180.0 / pi;
}
