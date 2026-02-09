import 'package:flutter/widgets.dart';

extension Sized on num{
  SizedBox get height => SizedBox(height: toDouble(),); 
  SizedBox get width => SizedBox(width: toDouble(),); 
}