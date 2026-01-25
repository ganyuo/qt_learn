#include <QApplication>
#include <QWidget>
#include <QVBoxLayout>
#include <QPushButton>
#include <QFileDialog>
#include <QMessageBox>
#include <Qt3DCore/QEntity>
#include <Qt3DRender/QCamera>
#include <Qt3DExtras/QForwardRenderer>
#include <Qt3DExtras/Qt3DWindow>
#include <Qt3DExtras/QOrbitCameraController>
#include <Qt3DRender/QMesh>
#include <Qt3DExtras/QPhongMaterial>
#include <Qt3DRender/QPointLight>

class ModelViewer : public QWidget {
    Q_OBJECT
public:
    explicit ModelViewer(QWidget *parent = nullptr) : QWidget(parent) {
        setupUI();
        setup3DScene();
    }

    void loadModel(const QString &filePath) {
        if (filePath.isEmpty()) return;
        
        if (m_modelEntity) {
            m_modelEntity->deleteLater();
        }
        
        m_modelEntity = new Qt3DCore::QEntity(m_rootEntity);
        
        Qt3DRender::QMesh *mesh = new Qt3DRender::QMesh(m_modelEntity);
        mesh->setSource(QUrl::fromLocalFile(filePath));
        
        Qt3DExtras::QPhongMaterial *material = new Qt3DExtras::QPhongMaterial(m_modelEntity);
        material->setDiffuse(QColor(QRgb(0x928327)));
        material->setSpecular(QColor(QRgb(0xFFFFFF)));
        
        m_modelEntity->addComponent(mesh);
        m_modelEntity->addComponent(material);
    }

private:
    void setupUI() {
        QVBoxLayout *layout = new QVBoxLayout(this);
        
        m_3dWindow = new Qt3DExtras::Qt3DWindow();
        QWidget *container = QWidget::createWindowContainer(m_3dWindow, this);
        container->setMinimumSize(400, 300);
        layout->addWidget(container);
        
        QPushButton *loadButton = new QPushButton("加载OBJ模型", this);
        connect(loadButton, &QPushButton::clicked, this, &ModelViewer::onLoadButtonClicked);
        layout->addWidget(loadButton);
    }

    void setup3DScene() {
        m_rootEntity = new Qt3DCore::QEntity();
        m_3dWindow->setRootEntity(m_rootEntity);
        
        Qt3DRender::QCamera *camera = m_3dWindow->camera();
        camera->lens()->setPerspectiveProjection(45.0f, 16.0f/9.0f, 0.1f, 1000.0f);
        camera->setPosition(QVector3D(0, 0, 20.0f));
        camera->setViewCenter(QVector3D(0, 0, 0));
        
        Qt3DExtras::QOrbitCameraController *camController = 
            new Qt3DExtras::QOrbitCameraController(m_rootEntity);
        camController->setCamera(camera);
        
        Qt3DCore::QEntity *lightEntity = new Qt3DCore::QEntity(m_rootEntity);
        Qt3DRender::QPointLight *light = new Qt3DRender::QPointLight(lightEntity);
        light->setColor("white");
        light->setIntensity(1.0f);
        lightEntity->addComponent(light);
        
        Qt3DCore::QTransform *lightTransform = new Qt3DCore::QTransform(lightEntity);
        lightTransform->setTranslation(QVector3D(10.0f, 10.0f, 10.0f));
        lightEntity->addComponent(lightTransform);
    }

    void onLoadButtonClicked() {
        QString fileName = QFileDialog::getOpenFileName(
            this, "打开OBJ模型", "", "OBJ文件 (*.obj)");
        if (!fileName.isEmpty()) {
            loadModel(fileName);
        }
    }

private:
    Qt3DExtras::Qt3DWindow *m_3dWindow;
    Qt3DCore::QEntity *m_rootEntity;
    Qt3DCore::QEntity *m_modelEntity = nullptr;
};

int main(int argc, char *argv[]) {
    QApplication app(argc, argv);
    
    ModelViewer viewer;
    viewer.setWindowTitle("Qt 3D OBJ模型查看器");
    viewer.resize(800, 600);
    viewer.show();
    
    return app.exec();
}

