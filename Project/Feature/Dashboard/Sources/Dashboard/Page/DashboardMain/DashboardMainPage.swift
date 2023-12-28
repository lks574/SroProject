import Foundation
import ComposableArchitecture
import SwiftUI

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
    Text("DashboardMainPage")
      .foregroundStyle(.red)
  }
}