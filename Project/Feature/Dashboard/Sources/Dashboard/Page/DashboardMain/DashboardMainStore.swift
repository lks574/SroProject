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
  }
}
