import Foundation
import SwiftUI
import LinkNavigator
import Architecture

@main
struct AppMain: App {
  var body: some Scene {
    WindowGroup {
      AppView()
    }
  }
}

struct AppView: View {
  var body: some View {
    LinkNavigationView(
      linkNavigator:
        SingleLinkNavigator(
          routeBuilderItemList: AppRouterBuilderGroup().applicationBuilders,
          dependency: AppSideEffect.build(isDev: .isDev)
        ),
      item: .init(path: Link.Dashboard.Application.Path.dashboardMain.rawValue)
    )
    .ignoresSafeArea()
  }
}

extension Bool {
  fileprivate static var isDev: Self {
    guard let mode = Bundle.main.infoDictionary?["Mode"] as? String else { return false }
    return mode.lowercased() == "development"
  }
}
