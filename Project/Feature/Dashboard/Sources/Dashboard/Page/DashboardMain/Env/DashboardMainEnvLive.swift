import Foundation
import CombineSchedulers
import Architecture
import LinkNavigator
import Platform

struct DashboardMainEnvLive {
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
  let sideEffect: AppSideEffect
  let linkNavigator: RootNavigatorType
}

extension DashboardMainEnvLive: DashboardMainEnvType {

  func routeToThread() {
    linkNavigator.replace(
      linkItem: .init(path: Link.Threads.Application.Path.splash.rawValue),
      isAnimated: true)
  }
}
