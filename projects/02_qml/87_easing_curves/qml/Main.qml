import QtQuick
import QtQuick.Layouts

Window {
    id: root_id
    width: 1280
    height: 720
    visible: true

    property int anim_duration: 2000
    property color start_color: "beige"
    property color end_color: "blue"

    Flickable {
        anchors.fill: parent
        contentHeight: column_id.implicitHeight

        ColumnLayout {
            id: column_id
            width: parent.width
            spacing: 2

            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "Line"
                anim_duration: root_id.anim_duration
                easing_type: Easing.Linear
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InQuad"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InQuad
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutQuad"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutQuad
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InOutQuad"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InOutQuad
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutInQuad"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutInQuad
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InCubic"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InCubic
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutCubic"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutCubic
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InOutCubic"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InOutCubic
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutInCubic"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutInCubic
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InSine"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InSine
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutSine"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutSine
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InOutSine"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InOutSine
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutInSine"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutInSine
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InExpo"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InExpo
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutExpo"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutExpo
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InOutExpo"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InOutExpo
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutInExpo"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutInExpo
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InCirc"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InCirc
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutCirc"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutCirc
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InOutCirc"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InOutCirc
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InElastic"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InElastic
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutElastic"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutElastic
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InOutElastic"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InOutElastic
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutInElastic"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutInElastic
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InBack"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InBack
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutBack"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutBack
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InOutBack"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InOutBack
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutInBack"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutInBack
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InBounce"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InBounce
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutBounce"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutBounce
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "InOutBounce"
                anim_duration: root_id.anim_duration
                easing_type: Easing.InOutBounce
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "OutInBounce"
                anim_duration: root_id.anim_duration
                easing_type: Easing.OutInBounce
                container_width: root_id.width
            }
            Moving_Rectange {
                background_color: "gray"
                start_color: root_id.start_color
                end_color: root_id.end_color
                easing_text: "BezierSpline"
                anim_duration: root_id.anim_duration
                easing_type: Easing.BezierSpline
                container_width: root_id.width
            }
        }
    }
}
