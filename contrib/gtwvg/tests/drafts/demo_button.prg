#include "inkey.ch"
#include "hbgtwvg.ch"
#include "wvgparts.ch"
#include "wvtwin.ch"

FUNCTION demo_button( cText, nMode )

   LOCAL nKey := 0, oCrt, oControl, nCol := 0, GetList := {}
   LOCAL cName := Space(30), cAddress := Space(30), cCity := Space(20)
   LOCAL oCtlList := { ;
      { "Insert", "icoharbour", Asc( "I" ), Nil }, ;
      { "Edit",   "icoharbour", Asc( "E" ), Nil }, ;
      { "Delete", "icoharbour", Asc( "D" ), Nil }, ;
      { "Search", "icoharbour", Asc( "S" ), Nil }, ;
      { "Exit",   "icoharbour", K_ESC, Nil } }

   hb_Default( @cText, "" )
   hb_Default( @nMode, 1 )
   IF nMode == 1
      oCrt := wvgCrt():New()
      oCrt:lModal := .T.
      oCrt:Create( ,, { 1, 1 }, { 24, 60 } )
   ELSE
      hb_gtReload( "WVG" )
      SetMode( 25, 80 )
   ENDIF
   SetColor( "W/B" )
   CLS
   @ 1, 0 SAY cText
   FOR EACH oControl IN oCtlList
      WITH OBJECT oControl[ 4 ] := wvgTstPushbutton():New()
         :PointerFocus := .F.
         :Style += BS_TOP
         :Create( oCrt, , { -3, iif( nCol == 0, -0.1, -nCol ) }, { -3, -6 } )
         :SetCaption( { , WVG_IMAGE_ICONRESOURCE, oControl[ 2 ] } )
         :SetCaption( oControl[ 1 ] )
         :Activate := BuildBlockKeyPut( oControl[ 3 ] )
         :TooltipText( oControl[ 1 ] )
         nCol += 6
      ENDWITH
   NEXT
   @ 8, 1         SAY "Name.....:" GET cName
   @ Row() + 1, 1 SAY "Address..:" GET cAddress
   @ Row() + 1, 1 SAY "City.....:" GET cCity
   SetPaintGetList( GetList, oCrt )
   CLEAR GETS
   DO WHILE nKey != K_ESC
      nKey := Inkey(0)
      IF nKey != K_ESC
         FOR EACH oControl IN oCtlList
            IF nKey == oControl[ 3 ]
               IF oCrt == Nil
                  hb_ThreadStart( { || demo_button( oControl[ 1 ], nMode ) } )
               ELSE
                  demo_button( oControl[ 1 ], nMode )
               ENDIF
            ENDIF
         NEXT
      ENDIF
   ENDDO
   IF nMode == 1
      oCrt:Destroy()
   ENDIF

   RETURN Nil

FUNCTION BuildBlockKeyPut( nKey )

   RETURN { || HB_KeyPut( nKey ) }

FUNCTION SetPaintGetList( GetList, oCrt )

   LOCAL oGet, oControl

   FOR EACH oGet IN GetList
      oControl := wvgTstGroupbox():New()
      oControl:Create( oCrt, , { -(oGet:Row-0.3), -(oGet:Col-0.3) }, { -1.3, -0.4-Len( Transform( oGet:VarGet(), oGet:Picture ) ) } )
   NEXT

   RETURN Nil

