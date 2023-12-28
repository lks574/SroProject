import LinkNavigator
import Architecture
import Platform

struct SplashBuilder<RootNavigator: RootNavigatorType> {
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = Link.Threads.Application.Path.splash.rawValue

    return .init(matchPath: matchPath) { navigator, _, diContainer -> RouteViewController? in
      guard let env: AppSideEffect = diContainer.resolve() else { return .none }

      return DebugWrappingViewController(matchPath: matchPath) {
        SplashPage(
          store: .init(
            initialState: SplashStore.State(),
            reducer: {
              SplashStore(
                env: SplashEnvLive(
                  sideEffect: env,
                  linkNavigator: navigator)
              )
            })
        )
      }
    }
  }
}
