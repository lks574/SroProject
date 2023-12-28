import Foundation
import ComposableArchitecture

struct DashboardMainStore {
  let pageID = UUID().uuidString
  let env: DashboardMainEnvType
}

extension DashboardMainStore: Reducer {
  public var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none

      case .onTapList(let tapType):
        switch tapType {
        case .threads: env.routeToThread()
        }
        return .none
      }
    }
  }
}

extension DashboardMainStore {
  struct State: Equatable {
    
  }
}

extension DashboardMainStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case onTapList(DashboardMainStore.TapType)
  }
}

extension DashboardMainStore {
  enum TapType: String, Identifiable, Equatable, CaseIterable {
    var id: String { self.rawValue }
    case threads = "Threads"
  }
}
