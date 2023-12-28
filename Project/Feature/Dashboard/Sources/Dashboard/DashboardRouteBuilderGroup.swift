import Architecture
import LinkNavigator

public struct DashboardRouteBuilderGroup<RootNavigator: RootNavigatorType> {

  public init() { }
}

extension DashboardRouteBuilderGroup {
  public var applicationRelease: [RouteBuilderOf<RootNavigator>] {
    [
      DashboardMainBuilder.generate(),
    ]
  }
}
