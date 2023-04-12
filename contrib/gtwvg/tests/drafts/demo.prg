#include "inkey.ch"

PROCEDURE Main

   hb_ThreadStart( { || ThisMain() } )
   hb_ThreadWaitForAll()

   RETURN

FUNCTION ThisMain()

   LOCAL oControl, nOpc := 1

   SetMode( 25, 80 )
   SetColor( "W/GR" )
   CLS
   WITH OBJECT oControl := wvgTstIcon():New()
      :cImage := "icoharbour"
      :Create( ,, { -5, -40 }, { -10, -30 } )
      :SetColorBG( SetColor() )
   ENDWITH
   DO WHILE .T.
      @ 1, 0         PROMPT Pad( "Modal Progressbar", 20 )
      @ Row() + 1, 0 PROMPT Pad( "Modal Button", 20 )
      @ Row() + 1, 0 PROMPT Pad( "NoModal Button", 20 )
      @ Row() + 1, 0 PROMPT Pad( "Modal Button Size !=", 20 )
      @ Row() + 1, 0 PROMPT Pad( "Modal All", 20 )
      @ Row() + 1, 0 PROMPT Pad( "Modal Chart", 20 )
      @ Row() + 1, 0 PROMPT Pad( "Crt RMChart", 20 )
      @ Row() + 1, 0 PROMPT Pad( "NoModal RMChart", 20 )
      @ Row() + 2, 0 SAY "RMChart requires rmchart.dll"
      MENU TO nOpc
      IF LastKey() == K_ESC
         EXIT
      ENDIF
      DO CASE
      CASE nOpc == 1
         demo_progrbar()
      CASE nOpc == 2
         demo_button()
      CASE nOpc == 3
         hb_ThreadStart( { || demo_button( "", 2 ) } )
      CASE nOpc == 4
         demo_buttonsize()
      CASE nOpc == 5
         demo_all()
      CASE nOpc == 6
         demo_Chart()
      CASE nOpc == 7
         IF File( "rmchart.dll" )
            demo_rmchart()
         ENDIF
      CASE nOpc == 8
         IF File( "rmchart.dll" )
            hb_ThreadStart( { || tstRMChart() } )
         ENDIF
      ENDCASE
   ENDDO
   oControl:Destroy()
   CLS

   RETURN Nil
