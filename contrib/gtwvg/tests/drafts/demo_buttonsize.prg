#include "inkey.ch"
#include "hbgtwvg.ch"
#include "wvgparts.ch"
#include "wvtwin.ch"

FUNCTION demo_buttonSize( cText )

   LOCAL nKey := 0, oCrt, oControl, nCol := 0, aButtonSize := { 3, 6 }
   LOCAL oCtlList := { ;
      { "Insert", "icoharbour", Asc( "I" ), Nil }, ;
      { "Edit",   "icoharbour", Asc( "E" ), Nil }, ;
      { "Delete", "icoharbour", Asc( "D" ), Nil }, ;
      { "Search", "icoharbour", Asc( "S" ), Nil }, ;
      { "Exit",   "icoharbour", K_ESC, Nil } }

   hb_Default( @cText, "" )
   oCrt := wvgCrt():New()
   oCrt:lModal := .T.
   oCrt:Create( ,, { 1, 1 }, { 24, 60 } )
   SetColor( "W/B" )
   CLS
   @ 1, 0 SAY cText
   FOR EACH oControl IN oCtlList
      WITH OBJECT oControl[ 4 ] := wvgTstPushbutton():New()
         :PointerFocus := .F.
         :Style += BS_TOP
         :Create( oCrt, , { -3, iif( nCol == 0, -0.1, -nCol ) }, { -aButtonSize[ 1 ], -aButtonSize[ 2 ] } )
         :SetCaption( { , WVG_IMAGE_ICONRESOURCE, oControl[ 2 ] } )
         :SetCaption( oControl[ 1 ] )
         :Activate := BuildBlockKeyPut( oControl[ 3 ] )
         :TooltipText( oControl[ 1 ] )
         nCol += aButtonSize[2]
         aButtonSize[ 1 ] += 1
         aButtonSize[ 2 ] += 2
      ENDWITH
   NEXT
   DO WHILE nKey != K_ESC
      nKey := Inkey(0)
      IF nKey != K_ESC
         FOR EACH oControl IN oCtlList
            IF nKey == oControl[ 3 ]
               demo_buttonSize( oControl[ 1 ] )
            ENDIF
         NEXT
      ENDIF
   ENDDO
   oCrt:Destroy()

   RETURN Nil
