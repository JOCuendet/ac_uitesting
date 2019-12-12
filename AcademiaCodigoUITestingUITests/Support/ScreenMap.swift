import Foundation

enum ScreenType {
    case app
    case home
    case gallery
    case more

}

typealias ScreenMap = [ScreenType: Screen]

extension Dictionary where Key == ScreenType, Value == Screen {

    var appScreen: AppScreen { return screen(.app) }
    var homeScreen: HomeScreen { return screen(.home)}
    var galleryScreen: GalleryScreen { return screen(.gallery)}
    var moreScreen: MoreScreen { return screen(.more)}

    private func screen<T>(_ screenType: ScreenType) -> T {
        guard let screen = self[screenType] else {
            fatalError("💥 Missing screen \(screenType)")
        }
        guard let typedScreen = screen as? T else {
            fatalError("💥 Expected screen \(screenType) to be \(T.self) but is \(type(of: screen)) instead")
        }
        return typedScreen
    }
}

