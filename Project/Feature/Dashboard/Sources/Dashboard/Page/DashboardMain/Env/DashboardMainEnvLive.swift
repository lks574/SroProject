import Foundation
import CombineSchedulers
import Architecture
import LinkNavigator

struct DashboardMainEnvLive {
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
  let useCaseGroup: DashboardEnvType
  let linkNavigator: RootNavigatorType
}

extension DashboardMainEnvLive: DashboardMainEnvType {

}
