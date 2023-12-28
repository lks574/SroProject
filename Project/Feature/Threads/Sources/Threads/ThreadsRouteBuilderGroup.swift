import Architecture
import LinkNavigator

public struct ThreadsRouteBuilderGroup<RootNavigator: RootNavigatorType> {

  public init() { }
}

extension ThreadsRouteBuilderGroup {
  public var applicationRelease: [RouteBuilderOf<RootNavigator>] {
    [
      SplashBuilder.generate(),
    ]
  }
}

