import LinkNavigator
import Architecture
import Platform

struct DashboardMainBuilder<RootNavigator: RootNavigatorType> {
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = Link.Dashboard.Application.Path.dashboardMain.rawValue

    return .init(matchPath: matchPath) { navigator, _, diContainer -> RouteViewController? in
      guard let env: AppSideEffect = diContainer.resolve() else { return .none }

      return DebugWrappingViewController(matchPath: matchPath) {
        DashboardMainPage(
          store: .init(
            initialState: DashboardMainStore.State(),
            reducer: {
              DashboardMainStore(
                env: DashboardMainEnvLive(
                  sideEffect: env,
                  linkNavigator: navigator)
              )
            })
        )
      }
    }
  }
}
