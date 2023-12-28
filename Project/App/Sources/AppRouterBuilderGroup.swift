import Foundation
import LinkNavigator
import Architecture
import Dashboard
import Threads

struct AppRouterBuilderGroup<RootNavigator: RootNavigatorType> {
  public var applicationBuilders: [RouteBuilderOf<RootNavigator>] {
    DashboardRouteBuilderGroup().applicationRelease
    + ThreadsRouteBuilderGroup().applicationRelease
  }
}
