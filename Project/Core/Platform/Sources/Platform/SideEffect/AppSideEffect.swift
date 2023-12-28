import Foundation
import LinkNavigator
import Domain

public struct AppSideEffect: DependencyType {
  let appStorageUseCase: AppStorageUseCaseType
}

public extension AppSideEffect {
  static func build(isDev: Bool) -> AppSideEffect {
    .init(
      appStorageUseCase: AppStorageUseCasePlatform(isDev: isDev)
    )
  }

  static func mock() -> AppSideEffect {
    .init(
      appStorageUseCase: AppStorageUseCasePlatform(
        isDev: true)
    )
  }
}
