//palette.dart
import 'package:flutter/material.dart'; 
class Palette { 
  static const MaterialColor pColor =  MaterialColor( 
    0xFFA80808, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch. 
     <int, Color>{ 
      50:   Color(0xFFA80808 ),//10% 
      100:  Color(0xFFA80808),//20% 
      200:  Color(0xFFA80808),//30% 
      300:  Color(0xFFA80808),//40% 
      400:  Color(0xFFA80808),//50% 
      500:  Color(0xFFA80808),//60% 
      600:  Color(0xFFA80808),//70% 
      700:  Color(0xFFA80808),//80% 
      800:  Color(0xFFA80808),//90% 
      900:  Color(0xFFA80808),//100% 
    }, 
  ); 
} 