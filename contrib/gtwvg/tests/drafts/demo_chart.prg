#include "inkey.ch"

PROCEDURE demo_chart

   LOCAL aBarList := { "BAR-1", "BAR-2", "BAR-3" }
   LOCAL aMonthList := { "JAN", "FEB", "MAR", "APR", "MAY" }
   LOCAL aValueList := { ;
      { 1000, 2000, 3000, 4000, 5000 }, ;
      { 3000, 4000, 5000, 6000, 7000 }, ;
      { 5000, 6000, 7000, 5000, 4000 } }
   LOCAL oChart, oCrt

   oCrt := wvgCrt():New()
   oCrt:lModal := .T.
   oCrt:Create( oCrt,, { 1, 1 }, { 28, 120 } )
   SetColor("N/W,N/W")
   CLS
   oChart := BarChartClass():New()
   oChart:nTop := 2
   oChart:nLeft := 0
   oChart:nBottom := MaxRow() - 3
   oChart:nRight := MaxCol()
   oChart:nGradeCount := 5
   oChart:cTxtTitle := "COMPARE"
   oChart:aTxtSubList := aBarList
   oChart:aTxtBarList := aMonthList
   oChart:aValues := aValueList
   oChart:Show()
   Inkey(0)
   oCrt:Destroy()

   RETURN
