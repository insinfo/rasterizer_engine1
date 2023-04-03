//----------------------------------------------------------------------------
// Anti-Grain Geometry - Version 2.4
// Copyright (C) 2002-2005 Maxim Shemanarev (http://www.antigrain.com)
//
// Permission to copy, use, modify, sell and distribute this software
// is granted provided this copyright notice appears in all copies.
// This software is provided "as is" without express or implied
// warranty, and with no claim as to its suitability for any purpose.
//
//----------------------------------------------------------------------------
// Contact: mcseem@antigrain.com
//          mcseemagg@yahoo.com
//          http://www.antigrain.com
//----------------------------------------------------------------------------
//
// Arc vertex generator
//
//----------------------------------------------------------------------------

//=====================================================================arc
//
// See Implementation agg_arc.cpp
//
class arc {
  arc() {
    // m_scale(1.0); m_initialized(false);
  }
  arc.arc(double x, double y, double rx, double ry, double a1, double a2,
      [bool ccw = true]);

  double? m_x;
  double? m_y;
  double? m_rx;
  double? m_ry;
  double? m_angle;
  double? m_start;
  double? m_end;
  double? m_scale;
  double? m_da;
  bool? m_ccw;
  bool? m_initialized;
  int? m_path_cmd;
}
