import QtQuick 2.0
import Sailfish.Silica 1.0
Item{
    width: parent.width
    height:eventDesc.height+eventName.height
    Label{
        id:eventName
        text:name
        font.pixelSize: Theme.fontSizeMedium
        width:parent.width
        font.bold: true
        wrapMode: Text.WordWrap
        anchors{
            topMargin: Theme.paddingSmall
            leftMargin: Theme.paddingSmall
            rightMargin: Theme.paddingSmall
        }
    }
    Label{
        id:eventDesc
        text:description
        width:parent.width
        font.pixelSize: Theme.fontSizeSmall/3*2
        wrapMode: Text.WordWrap
        anchors{
            top:eventName.bottom
            leftMargin: Theme.paddingSmall
            rightMargin: Theme.paddingSmall
        }
    }

}
