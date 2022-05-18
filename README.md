### Попытка собрать XCFramework с тразнитивным модулем XCFrameworkChild
- XCFrameworkDemo - плейграунд для тестирования собранного XCFramework
- xcframework.sh - исполняемый скрипт для создания .xcframework или universal framework
- builds - папка с артефактами сборки

### Навигиация по репозиторию (по веткам):
- direct-linking - внутри XCFramework два фреймфорка XCFramework и XCFrameworkChild линкются динамически через интерфес Xcode. Сборка осуществляется по средствам xcodebuild archive.
- direct-static - тоже что и в direct-linking, только mach-o type у XCFramework и XCFrameworkChild изменены на staticlib
- direct-linking-build-instead-archive - тоже что и в direct-linking, XCFramework и XCFrameworkChild собираются через xcodebuild build
- cocoapods-devpod - линовква XCFrameworkChild в XCFramework осуществляется через DevPod (используется use_frameworks! :linkage => :static). Перед тестирвоанием необходимо вызывать bundle install и bundle exec pod install
- fat-framework - попытка собрать universal framework. Архитектрура arm64-simulator не поддерживается, поэтому пока перестали исследовать в эту сторону.