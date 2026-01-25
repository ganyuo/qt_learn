/**
 * @file i3d_model_widget.hpp
 * @brief 3D模型展示界面
 * @author ganyuo (ganyuo@outlook.com)
 * @version 0.1
 * @date 2025-12-25
 * 
 * @copyright Copyright (C), 2019-2099, GaoWeiGanZhi. Co., Ltd.
 * 
 * 更新历史
 * 版本号 | 时间       | 修订者 | 修改内容
 * V0.1   | 2025-12-25 | ganyuo | 创建widget
 */

#ifndef __I3D_MODEL_WIDGET_HPP__
#define __I3D_MODEL_WIDGET_HPP__

#include <QWidget>
#include <Qt3DCore/QEntity>
#include <Qt3DExtras/Qt3DWindow>

namespace imu_tools
{
namespace gui
{

class i3d_model_widget_t : public QWidget
{
    Q_OBJECT

private:
    Qt3DExtras::Qt3DWindow *m_3dWindow;
    Qt3DCore::QEntity *m_rootEntity;
    Qt3DCore::QEntity *m_modelEntity = nullptr;

public:
    i3d_model_widget_t();
    ~i3d_model_widget_t();

    void load_model(const QString &filePath);

public slots:
    void flesh(const QByteArray &frame);
};

}
}

#endif /* __I3D_MODEL_WIDGET_HPP__ */
