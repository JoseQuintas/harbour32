#include "inkey.ch"

FUNCTION demo_progrbar()

   LOCAL nKey := 0, nCont, oControl, oCrt

   oCrt := wvgCrt():New()
   oCrt:lModal := .T.
   oCrt:Create( ,, { 1, 1 }, { 10, 60 } )
   SetColor( "W/B" )
   CLS
   @ 1, 1 SAY "Processing"
   oControl := wvgtstProgressbar():New()
   oControl:Create( oCrt,, { -3, -1 }, { -2, -50 } )
   DO WHILE nKey != K_ESC
      FOR nCont = 1 TO 20
         oControl:SetValue( nCont, 1, 20 )
         nKey := Inkey(0.5)
         IF nKey == K_ESC
            EXIT
         ENDIF
      NEXT
   ENDDO
   oCrt:Destroy()

   RETURN Nil
