import QtQuick
import QtQuick.Controls

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    Cppclass {
        id: cppclass_id

        onSend_int: function(param) {
            console.log("Received: " + param + ", type is : " + typeof param)
        }
        onSend_double: function(param) {
            console.log("Received: " + param + ", type is : " + typeof param)
        }
        onSend_bool: function(param) {
            console.log("Received: " + param + ", type is : " + typeof param)
        }
        onSend_qreal: function(param) {
            console.log("Received: " + param + ", type is : " + typeof param)
        }
        onSend_float: function(param) {
            console.log("Received: " + param + ", type is : " + typeof param)
        }

        onSendStringUrl: (stringParam, urlParam)=>{
             console.log("Received QString: " + stringParam + ", type is: " + typeof stringParam)
             console.log("Received QUrl: " + urlParam + ", type is: " + typeof urlParam)
        }
        onSendColorFont: (colorParam, fontParam)=>{
                             console.log("Received QColor: " + colorParam + ", type is: " + typeof colorParam)
                             console.log("Received QFont: " + fontParam + ", type is: " + typeof fontParam)
                             rectId.color = colorParam
                             buttonId.font = fontParam
        }
        onSendDate: (dateParam)=> {
                        console.log("Received QDate: " + dateParam + ", type is: " + typeof dateParam)
                        console.log("Year is: "+dateParam.getFullYear())
                        console.log("Month is: "+(dateParam.getMonth()+1))
                        console.log("Day of week is: "+dateParam.getDay())
                        console.log("The day of month is: "+dateParam.getDate())
        }
        onSendPoint: function(pointParam, pointfParam) {
            console.log("Received QPoint: " + pointParam + ", type is: " + typeof pointParam)
            console.log("Received QPointF: " + pointfParam + ", type is: " + typeof pointfParam)
        }
        onSendSize: function(sizeParam, sizefParam) {
            console.log("Received QSize: " + sizeParam + ", type is: " + typeof sizeParam)
            console.log("Received QSizeF: " + sizefParam + ", type is: " + typeof sizefParam)
        }
        onSendRect: function(rectParam, rectfParam) {
            console.log("Received QRect: " + rectParam + ", type is: " + typeof rectParam)
            console.log("Received QRectF: " + rectfParam + ", type is: " + typeof rectfParam)
        }
    }

    Button {
        id: button_id
        text: "click"
        onClicked: function() {
            cppclass_id.cpp_slot()
            cppclass_id.receive_point(Qt.point(200, 300))
            cppclass_id.receive_rect(Qt.rect(40, 40, 100, 100))
        }
    }
}
