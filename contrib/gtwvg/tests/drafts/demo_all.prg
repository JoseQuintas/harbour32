#include "inkey.ch"
#include "wvtwin.ch"
#include "wvgparts.ch"

PROCEDURE demo_all

   LOCAL aCtlList := Array(50), GetList := {}, cText := "This is a GET"
   LOCAL nCont, nCtlIndex := 1, oCrt

   oCrt := wvgCrt():New()
   oCrt:lModal := .T.
   oCrt:Create( oCrt,, { 1, 1 }, { 28, 120 } )
   SetColor("N/W,N/W")
   SET SCOREBOARD OFF
   CLS

   SetColor( "B/W" )
   FOR nCont = 1 TO 6
      WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstText():New()
         :cFontName := "Arial"
         :nFontSize := nCont * 10 + 20
         :cText := "Test of " + :cFontName + " " + Ltrim( Str( :nFontSize ) )
         :Create( oCrt, , { -( nCont * 4 - 3 ), -95 }, { -4, -20 } )
      ENDWITH
   NEXT

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstMonthCalendar():New()
      :Create( oCrt, , { -1, -63 }, { -12, -30 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstCommandLink():New()
      :cText := "Cmd Link"
      :Create( oCrt, , { -13, -63 }, { -5, -15 } )
      :SetNote( "Vista and Above" )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstTrackbar():New()
      :Create( oCrt, , { -20, -60 }, { -2, -20 }, , .F. )
      :SetValues( 1, 1, 20 )
      :Show()
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstUpDown():New()
      :Create( oCrt, , { -18, -82 }, { -3, -5 } )
      :SetValues( 1, 1, 100 )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstEditMultiline():New()
      :cText := GetEditText()
      :Create( oCrt, , { -1, -2 }, { -5, -35 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstPushButton():New()
      :Create( oCrt, , { -7, -2 }, { -9, -30 } )
      :SetCaption( { , WVG_IMAGE_ICONRESOURCE, "tstico" } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstLineVertical():New()
      :Create( oCrt, , { -1, -38 }, { -16, 4 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstScrollbar():New()
      :Style += SBS_VERT
      :Create( oCrt, , { -1, -39 }, { -14, -2 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstScrollbar():New()
      :Style += SBS_HORZ
      :Create( oCrt, , { -17, -2 }, { -1, -36 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstLineHorizontal():New()
      :Create( oCrt, , { -16.5, -2 }, { 4, -36 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstIcon():New()
      :cImage := "tstico"
      :Create( oCrt, , { -19, -2 }, { -3, -8 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstBitmap():New()
      :cImage := "tstbmp"
      :Create( oCrt, , { -19, -41 }, { -3, -8 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstcheckbox():New()
      :cText := "Satisfied?"
      :Create( oCrt, , { -19, -15 }, { -1, -10 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstCheckBox():New()
      :cText := "Not Satisfied?"
      :Style += BS_LEFTTEXT
      :Create( oCrt, , { -21, -15 }, { -1, -10 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstRectangle():New()
      :Create( oCrt, , { -19, -30 }, { -3, -10 } )
      :SetColorBG( WIN_RGB( 52, 101, 164 ) )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstListBox():New()
      :Create( oCrt, , { -1, -43 }, { -5, -16 } )
      :AddItem( "Harbour" )
      :AddItem( "GtWvt" )
      :AddItem( "Wvtgui" )
      :AddItem( "Modeless" )
      :AddItem( "Dialogs" )
      :AddItem( "WVT" )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstText():New()
      :cText := "Degree"
      :Create( oCrt, , { -6.5, -43 }, { -1, -17 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstComboBox():New()
      :Create( oCrt, , { -7.5, -43 }, { -6, -17 } )
      :AddItem( "First" )
      :AddItem( "Second" )
      :AddItem( "Third" )
      :AddItem( "Fourth" )
      :AddItem( "Fifth" )
      :SetValue( 1 )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstGroupbox():new()
      :cText := "Compiler"
      :Create( oCrt, , { -9, -43 }, { -4.3, -17 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstRadioButton():New()
      :cText := "Harbour"
      :Create( oCrt, , { -10, -45 }, { -1, -12 } )
      :SetCheck( .T. )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstRadioButton():New()
      :Style += BS_LEFTTEXT
      :cText := "Clipper"
      :Create( oCrt, , { -11, -45 }, { -1, -12 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstRadioButton():New()
      :cText := "Xbase++"
      :Create( oCrt, , { -12, -45 }, { -1, -12 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstText():New()
      :cText := "Scrollable Text"
      :Create( oCrt, , { -14, -43 }, { -1, -18 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstScrollText():New()
      :cText := "This is Text Field"
      :Create( oCrt, , { -15, -43 }, { -1, -18 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstText():New()
      :cText := "Right Justified Numerics"
      :Create( oCrt, , { -16, -43 }, { -1, -18 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstEdit():New()
      :Style += ES_NUMBER + ES_RIGHT
      :cText := "1234567"
      :Create( oCrt, , { -17, -43 }, { -1, -18 } )
   ENDWITH

   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstButton():New()
      :cText := "OK"
      :Create( oCrt, , { -20, -50 }, { -1, -8 } )
   ENDWITH
   wvgSetAppWindow():Refresh()

   //oControl := wvgtstStatusbar():New()
   //oControl:Create( oCrt, , { -28, 1 }, { -1, -50 } )

   @ 23, 62 SAY "SAY in frame"

   SetColor( "N/W,N/W,,,N/W" )
   WITH OBJECT aCtlList[ nCtlIndex++ ] := wvgtstGroupBox():New()
      :cText := "GET in Groupbox"
      :Create( oCrt, , { -24, -60 }, { -2, -Len( cText ) - 4 } )
   ENDWITH

   //oControl := wvgtstFrame():New()
   //oControl:Create( oCrt, , { -25, -62 }, { -1, -Len( cText ) } )
   @ 25, 62 GET cText
   READ

   Inkey(0)
   ( nCtlIndex )
   oCrt:Destroy()

   RETURN

FUNCTION GetEditText()

   RETURN Replicate( Space(10) + hb_Eol(), 10 )
   //   "This sample is to show GTWVG possibilites." + hb_eol() + ;
   //   "It does not use existing GTWVG controls," + hb_eol() + ;
   //   "but uses features of GTWVG." + hb_eol() + ;
   //   "Think possibilites to expand." + hb_eol()
