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
import "files/API.js" as JS
import "."
Page {
    id: page
    property string direction_value
    property string drink_value
    property string goddes_value
    SilicaFlickable{
        id:flickable
        Component.onCompleted: {
            JS.initAlmanac();
        }
        ListModel{id:goods}
        ListModel{id:bads}
        anchors.fill: parent
        PageHeader{
            id:header
            title:"Dota2老黄历"
        }
        Label{
            id:showDate
            width:parent.width
            font.pixelSize: Theme.fontSizeMedium*5/4
            font.bold: true
            anchors{
                top:header.bottom
                horizontalCenter: parent.horizontalCenter
            }
        }
        Separator {
            width:parent.width
            anchors{
                left:parent.left
                right:parent.right
                top:showDate.bottom
                bottomMargin: Theme.paddingSmall
            }
            color: Theme.highlightColor
        }
        Item{
            id:good
            width:parent.width/3
            height:goodList.height
            anchors{
                left:parent.left
                top:showDate.bottom
                topMargin: Theme.paddingSmall*2
            }
            Label{
                anchors{
                    verticalCenter:parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
                text:"宜"
                font.pixelSize: Theme.fontSizeLarge
            }
        }

        SilicaListView{
            id:goodList
            model:goods
            anchors{
                left:good.right
                right:parent.right
                top:showDate.bottom
                topMargin: Theme.paddingSmall*2
            }
            height: childrenRect.height
            clip:true
            delegate:ShowEvents{}
            VerticalScrollDecorator {}
        }
        Separator {
            width:parent.width
            anchors{
                left:parent.left
                right:parent.right
                bottom:bad.top
                topMargin: Theme.paddingSmall*2
                bottomMargin: Theme.paddingSmall
            }
            color: Theme.highlightColor
        }
        Item{
            id:bad
            anchors{
                top:good.bottom
                left:parent.left
                topMargin: Theme.paddingSmall*2
            }
            width:parent.width/3
            height:badList.height
            Label{
                text:"不宜"
                font.pixelSize: Theme.fontSizeLarge
                anchors{
                    verticalCenter:parent.verticalCenter
                    horizontalCenter: parent.horizontalCenter
                }
            }
        }
        SilicaListView{
            id:badList
            model:bads
            anchors{
                left:bad.right
                right:parent.right
                topMargin: Theme.paddingSmall*2
                top:goodList.bottom
            }
            height: childrenRect.height
            clip:true
            delegate: ShowEvents{}
            VerticalScrollDecorator {}
        }
        Separator {
            width:parent.width
            anchors{
                left:parent.left
                right:parent.right
                top:badList.bottom
                topMargin: Theme.paddingSmall
            }
            color: Theme.highlightColor
        }
        Label{
            id:sitToward
            anchors{
                top:badList.bottom
                leftMargin: Theme.paddingSmall
                topMargin: Theme.paddingSmall*2

            }
            text:"<strong>座位朝向：</strong>面向<font color='#4a4'>"+direction_value+"</font>打Dota2，胜率最高"
            wrapMode: Text.WordWrap
            font.pixelSize: Theme.fontSizeSmall
            width: parent.width
        }
        Label{
            id:canDrink
            anchors{
                top:sitToward.bottom
                leftMargin: Theme.paddingSmall
                topMargin: Theme.paddingSmall*2
            }
            text:"<strong>今日宜饮：</strong>"+drink_value
            wrapMode: Text.WordWrap
            font.pixelSize: Theme.fontSizeSmall
            width: parent.width
        }
        Label{
            id:godLikeNum
            anchors{
                top:canDrink.bottom
                leftMargin: Theme.paddingSmall
                topMargin: Theme.paddingSmall*2
            }
            text:"<strong>超神指数：</strong>"+goddes_value
            wrapMode: Text.WordWrap
            font.pixelSize: Theme.fontSizeSmall
            width: parent.width
        }
        Label{
            anchors{
                bottom:parent.bottom
                right:parent.right
                bottomMargin: Theme.paddingMedium
                rightMargin: Theme.paddingMedium
            }
            text:">>>"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    pageStack.push(aboutpage)
                }
            }
        }
    }
    Page{
        id:aboutpage
        SilicaFlickable {
                id: about
                anchors.fill: parent
                contentHeight: aboutRectangle.height

                VerticalScrollDecorator { flickable: about }

                Column {
                    id: aboutRectangle
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: parent.width
                    spacing: Theme.paddingSmall

                    PageHeader {
                        //: headline of application information page
                        title: qsTr("关于")
                    }

                    Image {
                        source: "files/icon-launcher-almanac.png"
                        width: parent.width
                        fillMode: Image.PreserveAspectFit
                        horizontalAlignment: Image.AlignHCenter
                    }

                    Label {
                        text:  "Dota2老黄历 0.1"
                        horizontalAlignment: Text.Center
                        width: parent.width - Theme.paddingLarge * 2
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    SectionHeader {
                        //: headline for application description
                        text: "描述"
                    }

                    Label {
                        //: application description
                        text: "本软件基于http://sandbox.runjs.cn/show/efhhvosl<br/>"+
                               "感谢 新浪微薄@iCassius的授权，感谢中文原作者<br/> "+
                               "也感谢最初作者 twitter: @fake_faith, G+: Yiding He<br/>"+
                               "如果你对本软件有什么好的想法，可以邮件联系我 Email:birdzhang@9smart.cn<br/>"
                        width: parent.width - Theme.paddingLarge * 2
                        anchors.horizontalCenter: parent.horizontalCenter
                        wrapMode: Text.WordWrap
                        font.pixelSize: Theme.fontSizeSmall
                    }

                    SectionHeader {
                        //: headline for application licensing information
                        text: qsTr("Licensing")
                    }

                    Label {
                        //: Copyright and license information
                        text: qsTr("Copyright © by") + " 0312birzhang\n" + qsTr("License") + ": GPL v2"
                        width: parent.width - Theme.paddingLarge * 2
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: Theme.fontSizeSmall
                    }

                    SectionHeader {
                        //: headline for application project information
                        text: "项目源码"
                        font.pixelSize: Theme.fontSizeSmall
                    }

                    Label {
                        textFormat: Text.RichText;
                        text: "<style>a:link { color: " + Theme.highlightColor + "; }</style><a href=\"https://github.com/0312birdzhang/harbour-dota2Almanac\">https://github.com/0312birdzhang/harbour-dota2Almanac\</a>"
                        width: parent.width - Theme.paddingLarge * 2
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: Theme.fontSizeTiny

                        onLinkActivated: {
                            Qt.openUrlExternally(link)
                        }
                    }
                }
            }
    }

}


