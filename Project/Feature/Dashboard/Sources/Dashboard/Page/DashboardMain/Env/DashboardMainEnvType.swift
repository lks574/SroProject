import ComposableArchitecture
import Foundation
import Domain
import Platform

protocol DashboardMainEnvType {
  var mainQueue: AnySchedulerOf<DispatchQueue> { get }
  var sideEffect: AppSideEffect { get }

  func routeToThread()
}
