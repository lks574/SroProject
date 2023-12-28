import Foundation
import ComposableArchitecture

struct SplashStore {
  let pageID = UUID().uuidString
  let env: SplashEnvType
}

extension SplashStore: Reducer {
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

extension SplashStore {
  struct State: Equatable {

  }
}

extension SplashStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
  }
}
