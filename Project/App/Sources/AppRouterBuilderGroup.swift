import Foundation
import LinkNavigator
import Architecture
import Dashboard

struct AppRouterBuilderGroup<RootNavigator: RootNavigatorType> {
  public var applicationBuilders: [RouteBuilderOf<RootNavigator>] {
    DashboardRouteBuilderGroup().applicationRelease
  }
}
