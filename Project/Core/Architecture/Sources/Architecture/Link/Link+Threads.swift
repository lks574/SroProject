import Foundation

// MARK: - Link.Dashboard

extension Link {
  public enum Threads {
    public enum Application { }
  }
}

// MARK: - Link.Dashboard.Application.Path

extension Link.Threads.Application {
  public enum Path: String, Equatable, CaseIterable {
    case splash
    case login
    case threadsMain
  }
}
