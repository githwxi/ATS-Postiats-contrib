/*
** LiquidCrystal library
*/

/* ****** ****** */

#ifndef ARDUINO_CATS_LIQUID_CRYSTAL
#define ARDUINO_CATS_LIQUID_CRYSTAL

/* ****** ****** */

#include <LiquidCrystal.h>

/* ****** ****** */

#define \
LiquidCrystal_begin_2(lcd, col, row) \
  (static_cast<LiquidCrystal*>(lcd))->begin(col, row)
#define \
LiquidCrystal_begin_3(lcd, col, row, csz) \
  (static_cast<LiquidCrystal*>(lcd))->begin(col, row, csz)

/* ****** ****** */
//
#define LiquidCrystal_home(lcd) (static_cast<LiquidCrystal*>(lcd))->home()
#define LiquidCrystal_clear(lcd) (static_cast<LiquidCrystal*>(lcd))->clear()
//
/* ****** ****** */
//
#define LiquidCrystal_blink(lcd) (static_cast<LiquidCrystal*>(lcd))->blink()
#define LiquidCrystal_noBlink(lcd) (static_cast<LiquidCrystal*>(lcd))->noBlink()
//
#define LiquidCrystal_cursor(lcd) (static_cast<LiquidCrystal*>(lcd))->cursor()
#define LiquidCrystal_noCursor(lcd) (static_cast<LiquidCrystal*>(lcd))->noCursor()
//
#define LiquidCrystal_display(lcd) (static_cast<LiquidCrystal*>(lcd))->display()
#define LiquidCrystal_noDisplay(lcd) (static_cast<LiquidCrystal*>(lcd))->noDisplay()
//
#define LiquidCrystal_autoscroll(lcd) (static_cast<LiquidCrystal*>(lcd))->autoscroll()
#define LiquidCrystal_noAutoscroll(lcd) (static_cast<LiquidCrystal*>(lcd))->noAutoscroll()
//
/* ****** ****** */
//
#define LiquidCrystal_leftToRight(lcd) (static_cast<LiquidCrystal*>(lcd))->leftToRight()
#define LiquidCrystal_rightToLeft(lcd) (static_cast<LiquidCrystal*>(lcd))->rightToLeft()
//
/* ****** ****** */
//
#define LiquidCrystal_write(lcd, c) (static_cast<LiquidCrystal*>(lcd))->write(c)
//
/* ****** ****** */
//
#define LiquidCrystal_command(lcd, cmd) (static_cast<LiquidCrystal*>(lcd))->write(cmd)
//
/* ****** ****** */
//
#define \
LiquidCrystal_setCursor(lcd, col, row) \
  (static_cast<LiquidCrystal*>(lcd))->setCursor(col, row)
//
/* ****** ****** */
//
#define \
LiquidCrystal_createChar(lcd, num, data) \
  (static_cast<LiquidCrystal*>(lcd))->createChar(num, ((uint8_t*)data))
//
/* ****** ****** */

#endif // #ifndef(ARDUINO_CATS_LIQUID_CRYSTAL)

/* ****** ****** */

/* end of [LiquidCrystal.cats] */
