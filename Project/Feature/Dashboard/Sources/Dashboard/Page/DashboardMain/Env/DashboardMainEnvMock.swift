import Foundation
import CombineSchedulers
import Architecture
import LinkNavigator
import Platform

struct DashboardMainEnvMock {
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
  let sideEffect: AppSideEffect = .mock()
}

extension DashboardMainEnvMock: DashboardMainEnvType {

  func routeToThread() {
    
  }
}
