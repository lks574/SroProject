import ComposableArchitecture
import Foundation
import Domain

protocol DashboardMainEnvType {
  var mainQueue: AnySchedulerOf<DispatchQueue> { get }
  var useCaseGroup: DashboardEnvType { get }
}
