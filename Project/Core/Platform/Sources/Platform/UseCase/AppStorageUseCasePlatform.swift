import Foundation
import Domain

public struct AppStorageUseCasePlatform {
  public init(isDev: Bool) {
    self.isDev = isDev
  }

  public let isDev: Bool
}

extension AppStorageUseCasePlatform: AppStorageUseCaseType {

}
