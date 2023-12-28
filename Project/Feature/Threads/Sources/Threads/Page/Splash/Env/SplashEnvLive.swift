import Foundation
import CombineSchedulers
import Architecture
import LinkNavigator
import Platform

struct SplashEnvLive {
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
  let sideEffect: AppSideEffect
  let linkNavigator: RootNavigatorType
}

extension SplashEnvLive: SplashEnvType {

}
