import Foundation

// MARK: - Link.Dashboard

extension Link {
  public enum Dashboard {
    public enum Application { }
  }
}

// MARK: - Link.Dashboard.Application.Path

extension Link.Dashboard.Application {
  public enum Path: String, Equatable, CaseIterable {
    case dashboardMain
  }
}
