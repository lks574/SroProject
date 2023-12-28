import Foundation
import CombineSchedulers
import Architecture
import LinkNavigator
import Platform

struct SplashEnvMock {
  let mainQueue: AnySchedulerOf<DispatchQueue> = .main
  let sideEffect: AppSideEffect = .mock()
}

extension SplashEnvMock: SplashEnvType {

}
