INCLUDEPATH += \
	inc

# 必须使用`HEADERS`添加定义了信号或槽函数类的头文件
# 否则 Qt 不会调用 moc 生成代码
HEADERS += \
    inc/my_signal.h \
    inc/my_slot.h

SOURCES += \
	src/main.cpp
