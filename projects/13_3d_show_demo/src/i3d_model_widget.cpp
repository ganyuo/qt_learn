

#include "i3d_model_widget.hpp"
#include <QVBoxLayout>
#include <Qt3DCore/QEntity>
#include <Qt3DRender/QCamera>
#include <Qt3DExtras/QForwardRenderer>
#include <Qt3DExtras/Qt3DWindow>
#include <Qt3DExtras/QOrbitCameraController>
#include <Qt3DRender/QMesh>
#include <Qt3DExtras/QPhongMaterial>
#include <Qt3DRender/QPointLight>
#include <Qt3DRender/QGeometryRenderer>
#include <Qt3DCore/QGeometry>
#include <Qt3DCore/QAttribute>
#include <Qt3DCore/QBuffer>

namespace imu_tools
{
namespace gui
{

i3d_model_widget_t::i3d_model_widget_t() : QWidget()
{
    QVBoxLayout *layout = new QVBoxLayout(this);  // 创建垂直布局
    
    // 创建Qt3D窗口（这是实际的3D渲染区域）
    m_3dWindow = new Qt3DExtras::Qt3DWindow();
    
    // 将Qt3D窗口嵌入到QWidget容器中
    QWidget *container = QWidget::createWindowContainer(m_3dWindow, this);
    container->setMinimumSize(400, 300);  // 设置最小尺寸
    layout->addWidget(container);          // 将容器添加到布局

    // 创建根实体：所有3D对象都将附加到此实体或其子实体上
    m_rootEntity = new Qt3DCore::QEntity();
    m_3dWindow->setRootEntity(m_rootEntity);  // 设置根实体
    
    // 获取并配置摄像机
    Qt3DRender::QCamera *camera = m_3dWindow->camera();
    camera->lens()->setPerspectiveProjection(45.0f, 16.0f/9.0f, 0.1f, 1000.0f);
    // 参数说明：45度视野、16:9宽高比、近裁剪面0.1、远裁剪面1000
    
    camera->setPosition(QVector3D(15.0f, 15.0f, 15.0f));  // 摄像机位置：(0,0,20)
    camera->setViewCenter(QVector3D(0, 0, 0));     // 摄像机看向原点
    camera->setUpVector(QVector3D(0, 1, 0));  // Y轴向上
    
    // 创建轨道摄像机控制器，用于鼠标交互
    Qt3DExtras::QOrbitCameraController *camController = 
        new Qt3DExtras::QOrbitCameraController(m_rootEntity);
    camController->setCamera(camera);  // 将控制器连接到摄像机
}

i3d_model_widget_t::~i3d_model_widget_t()
{
}

void i3d_model_widget_t::load_model(const QString &filePath)
{
    if (filePath.isEmpty()) return;  // 检查文件路径是否有效
    
    // 如果已存在模型实体，先删除它
    if (m_modelEntity) {
        m_modelEntity->deleteLater();  // 安全删除旧模型
    }
    
    // 创建新的模型实体，并设置父实体为根实体
    m_modelEntity = new Qt3DCore::QEntity(m_rootEntity);
    
    // 创建网格组件，用于加载OBJ模型
    Qt3DRender::QMesh *mesh = new Qt3DRender::QMesh(m_modelEntity);
    mesh->setSource(QUrl::fromLocalFile(filePath));  // 设置模型文件路径
    
    // 创建变换组件，调整模型大小
    Qt3DCore::QTransform *modelTransform = new Qt3DCore::QTransform(m_modelEntity);
    modelTransform->setScale(10.0f);  // 缩小模型为原来的一半
    modelTransform->setTranslation(QVector3D(0, 0, 0));  // 设置在原点
    QQuaternion rotation;
    rotation = QQuaternion::fromEulerAngles(10.0, 10.0, 10.0); // 设置模型欧拉角
    modelTransform->setRotation(rotation);

    // 创建Phong材质，提供光照和颜色效果
    Qt3DExtras::QPhongMaterial *material = new Qt3DExtras::QPhongMaterial(m_modelEntity);
    material->setDiffuse(QColor(QRgb(0x666666)));  // 灰色材质
    material->setAmbient(QColor(QRgb(0x666666)));  // 环境光颜色
    material->setSpecular(QColor(QRgb(0x000000))); // 关闭镜面反射
    
    // 将组件添加到实体中
    m_modelEntity->addComponent(mesh);      // 添加网格组件
    m_modelEntity->addComponent(material);  // 添加材质组件
    m_modelEntity->addComponent(modelTransform);
}

void i3d_model_widget_t::flesh(const QByteArray &frame)
{
}

}
}
