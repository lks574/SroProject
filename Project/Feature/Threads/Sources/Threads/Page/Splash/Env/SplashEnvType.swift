import ComposableArchitecture
import Foundation
import Domain
import Platform

protocol SplashEnvType {
  var mainQueue: AnySchedulerOf<DispatchQueue> { get }
  var sideEffect: AppSideEffect { get }
}
