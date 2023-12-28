import Foundation
import LinkNavigator
import Dashboard
import Domain
import Platform

struct AppSideEffect: DependencyType, DashboardEnvType {
  let appStorageUseCase: AppStorageUseCaseType
}

extension AppSideEffect {
  static func build(isDev: Bool) -> AppSideEffect {
    return .init(
      appStorageUseCase: AppStorageUseCasePlatform(isDev: isDev)
    )
  }
}
