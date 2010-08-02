/*
 * $Id$
 */

/* -------------------------------------------------------------------- */
/* WARNING: Automatically generated source file. DO NOT EDIT!           */
/*          Instead, edit corresponding .qth file,                      */
/*          or the generator tool itself, and run regenarate.           */
/* -------------------------------------------------------------------- */

/*
 * Harbour Project source code:
 * QT wrapper main header
 *
 * Copyright 2009-2010 Pritpal Bedi <pritpal@vouchcac.com>
 *
 * Copyright 2009 Marcos Antonio Gambeta <marcosgambeta at gmail dot com>
 * www - http://harbour-project.org
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
 * Boston, MA 02111-1307 USA (or visit the web site http://www.gnu.org/).
 *
 * As a special exception, the Harbour Project gives permission for
 * additional uses of the text contained in its release of Harbour.
 *
 * The exception is that, if you link the Harbour libraries with other
 * files to produce an executable, this does not by itself cause the
 * resulting executable to be covered by the GNU General Public License.
 * Your use of that executable is in no way restricted on account of
 * linking the Harbour library code into it.
 *
 * This exception does not however invalidate any other reasons why
 * the executable file might be covered by the GNU General Public License.
 *
 * This exception applies only to the code released by the Harbour
 * Project under the name Harbour.  If you copy code from other
 * Harbour Project or Free Software Foundation releases into a copy of
 * Harbour, as the General Public License permits, the exception does
 * not apply to the code that you add in this way.  To avoid misleading
 * anyone as to the status of such modified files, you must delete
 * this exception notice from them.
 *
 * If you write modifications of your own for Harbour, it is your choice
 * whether to permit this exception to apply to your modifications.
 * If you do not wish that, delete this exception notice.
 *
 */
/*----------------------------------------------------------------------*/

#include "hbqtcore.h"

/*----------------------------------------------------------------------*/
#if QT_VERSION >= 0x040500
/*----------------------------------------------------------------------*/

#include <QtCore/QPointer>

#include <QtCore/QPointF>


/*
 * QPointF ()
 * QPointF ( const QPoint & point )
 * QPointF ( qreal x, qreal y )
 */

typedef struct
{
   QPointF * ph;
   bool bNew;
   QT_G_FUNC_PTR func;
   int type;
} QGC_POINTER_QPointF;

QT_G_FUNC( hbqt_gcRelease_QPointF )
{
   QGC_POINTER * p = ( QGC_POINTER * ) Cargo;

   if( p && p->bNew )
   {
      if( p->ph )
      {
         HB_TRACE( HB_TR_DEBUG, ( "ph=%p    _rel_QPointF   /.\\", p->ph ) );
         delete ( ( QPointF * ) p->ph );
         HB_TRACE( HB_TR_DEBUG, ( "ph=%p YES_rel_QPointF   \\./", p->ph ) );
         p->ph = NULL;
      }
      else
      {
         HB_TRACE( HB_TR_DEBUG, ( "ph=%p DEL_rel_QPointF    :     Object already deleted!", p->ph ) );
         p->ph = NULL;
      }
   }
   else
   {
      HB_TRACE( HB_TR_DEBUG, ( "ph=%p PTR_rel_QPointF    :    Object not created with new=true", p->ph ) );
      p->ph = NULL;
   }
}

void * hbqt_gcAllocate_QPointF( void * pObj, bool bNew )
{
   QGC_POINTER * p = ( QGC_POINTER * ) hb_gcAllocate( sizeof( QGC_POINTER ), hbqt_gcFuncs() );

   p->ph = ( QPointF * ) pObj;
   p->bNew = bNew;
   p->func = hbqt_gcRelease_QPointF;
   p->type = HBQT_TYPE_QPointF;

   if( bNew )
   {
      HB_TRACE( HB_TR_DEBUG, ( "ph=%p    _new_QPointF", pObj ) );
   }
   else
   {
      HB_TRACE( HB_TR_DEBUG, ( "ph=%p NOT_new_QPointF", pObj ) );
   }
   return p;
}

HB_FUNC( QT_QPOINTF )
{
   QPointF * pObj = NULL;

   if( hb_pcount() == 2 && HB_ISNUM( 1 ) && HB_ISNUM( 2 ) )
   {
      pObj =  new QPointF( ( qreal ) hb_parnd( 1 ), ( qreal ) hb_parnd( 2 ) ) ;
   }
   else if( hb_pcount() == 1 && HB_ISPOINTER( 1 ) )
   {
      pObj =  new QPointF( *hbqt_par_QPoint( 1 ) ) ;
   }
   else
   {
      pObj =  new QPointF() ;
   }

   hb_retptrGC( hbqt_gcAllocate_QPointF( ( void * ) pObj, true ) );
}

/*
 * bool isNull () const
 */
HB_FUNC( QT_QPOINTF_ISNULL )
{
   QPointF * p = hbqt_par_QPointF( 1 );
   if( p )
      hb_retl( ( p )->isNull() );
   else
   {
      HB_TRACE( HB_TR_DEBUG, ( "............................... F=QT_QPOINTF_ISNULL FP=hb_retl( ( p )->isNull() ); p is NULL" ) );
   }
}

/*
 * qreal & rx ()
 */
HB_FUNC( QT_QPOINTF_RX )
{
   QPointF * p = hbqt_par_QPointF( 1 );
   if( p )
      hb_retnd( ( p )->rx() );
   else
   {
      HB_TRACE( HB_TR_DEBUG, ( "............................... F=QT_QPOINTF_RX FP=hb_retnd( ( p )->rx() ); p is NULL" ) );
   }
}

/*
 * qreal & ry ()
 */
HB_FUNC( QT_QPOINTF_RY )
{
   QPointF * p = hbqt_par_QPointF( 1 );
   if( p )
      hb_retnd( ( p )->ry() );
   else
   {
      HB_TRACE( HB_TR_DEBUG, ( "............................... F=QT_QPOINTF_RY FP=hb_retnd( ( p )->ry() ); p is NULL" ) );
   }
}

/*
 * void setX ( qreal x )
 */
HB_FUNC( QT_QPOINTF_SETX )
{
   QPointF * p = hbqt_par_QPointF( 1 );
   if( p )
      ( p )->setX( hb_parnd( 2 ) );
   else
   {
      HB_TRACE( HB_TR_DEBUG, ( "............................... F=QT_QPOINTF_SETX FP=( p )->setX( hb_parnd( 2 ) ); p is NULL" ) );
   }
}

/*
 * void setY ( qreal y )
 */
HB_FUNC( QT_QPOINTF_SETY )
{
   QPointF * p = hbqt_par_QPointF( 1 );
   if( p )
      ( p )->setY( hb_parnd( 2 ) );
   else
   {
      HB_TRACE( HB_TR_DEBUG, ( "............................... F=QT_QPOINTF_SETY FP=( p )->setY( hb_parnd( 2 ) ); p is NULL" ) );
   }
}

/*
 * QPoint toPoint () const
 */
HB_FUNC( QT_QPOINTF_TOPOINT )
{
   QPointF * p = hbqt_par_QPointF( 1 );
   if( p )
      hb_retptrGC( hbqt_gcAllocate_QPoint( new QPoint( ( p )->toPoint() ), true ) );
   else
   {
      HB_TRACE( HB_TR_DEBUG, ( "............................... F=QT_QPOINTF_TOPOINT FP=hb_retptrGC( hbqt_gcAllocate_QPoint( new QPoint( ( p )->toPoint() ), true ) ); p is NULL" ) );
   }
}

/*
 * qreal x () const
 */
HB_FUNC( QT_QPOINTF_X )
{
   QPointF * p = hbqt_par_QPointF( 1 );
   if( p )
      hb_retnd( ( p )->x() );
   else
   {
      HB_TRACE( HB_TR_DEBUG, ( "............................... F=QT_QPOINTF_X FP=hb_retnd( ( p )->x() ); p is NULL" ) );
   }
}

/*
 * qreal y () const
 */
HB_FUNC( QT_QPOINTF_Y )
{
   QPointF * p = hbqt_par_QPointF( 1 );
   if( p )
      hb_retnd( ( p )->y() );
   else
   {
      HB_TRACE( HB_TR_DEBUG, ( "............................... F=QT_QPOINTF_Y FP=hb_retnd( ( p )->y() ); p is NULL" ) );
   }
}


/*----------------------------------------------------------------------*/
#endif             /* #if QT_VERSION >= 0x040500 */
/*----------------------------------------------------------------------*/