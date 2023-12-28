import Foundation
import ComposableArchitecture
import SwiftUI
import DesignSystem

struct DashboardMainPage {
  init(store: StoreOf<DashboardMainStore>) {
    self.store = store
    viewStore = ViewStore(store, observe: { $0 })
  }

  let store: StoreOf<DashboardMainStore>
  @ObservedObject var viewStore: ViewStoreOf<DashboardMainStore>
}

extension DashboardMainPage: View {
  var body: some View {
    List {
      ForEach(DashboardMainStore.TapType.allCases) { itemType in
        Text(itemType.rawValue)
          .onTapGesture {
            viewStore.send(.onTapList(itemType))
          }
      }
    }
  }
}

#Preview {
  DashboardMainPage(store: .init(
    initialState: DashboardMainStore.State(),
    reducer: {
      DashboardMainStore(
        env: DashboardMainEnvMock()
      )
    })
  )
}
