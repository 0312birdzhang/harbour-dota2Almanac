/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow{
    id:appwindow
    property string direction_value
    property string drink_value
    property string goddes_value
    initialPage: Component { FirstPage { } }
    cover: CoverBackground {
        id:coverPage
        Label{
            id:sitToward
            text:"座位朝向：面向"+direction_value+"打Dota2，胜率最高"
            wrapMode: Text.WordWrap
            font.pixelSize: Theme.fontSizeSmall*3/4
            width: parent.width
            anchors.topMargin: Theme.paddingSmall*2
        }
        Label{
            id:canDrink
            anchors{
                top:sitToward.bottom
                topMargin: Theme.paddingSmall*2
            }
            text:"今日宜饮："+drink_value
            wrapMode: Text.WordWrap
            font.pixelSize: Theme.fontSizeSmall*3/4
            width: parent.width
        }
        Label{
            id:godLikeNum
            anchors{
                top:canDrink.bottom
                topMargin: Theme.paddingSmall*2
            }
            text:"超神指数："+goddes_value
            wrapMode: Text.WordWrap
            font.pixelSize: Theme.fontSizeSmall*3/4
            width: parent.width
        }
        Label{
            id:read
            anchors{
                horizontalCenter: parent.horizontalCenter
                bottom:holyshit.top
                bottomMargin: Theme.paddingSmall*5
            }
            text:"每日一读"
            color: Theme.highlightColor
            font.pixelSize: Theme.fontSizeMedium
        }
        Label{
            id:holyshit
            anchors{
                horizontalCenter: parent.horizontalCenter
                bottom:parent.bottom
                bottomMargin: Theme.paddingSmall*5
            }
            text:"天天超神"
            color: Theme.highlightColor
            font.pixelSize: Theme.fontSizeMedium
        }
    }
}


