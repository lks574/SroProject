import Foundation
import ComposableArchitecture
import SwiftUI
import DesignSystem

struct SplashPage {
  init(store: StoreOf<SplashStore>) {
    self.store = store
    viewStore = ViewStore(store, observe: { $0 })
  }

  let store: StoreOf<SplashStore>
  @ObservedObject var viewStore: ViewStoreOf<SplashStore>
}

extension SplashPage: View {
  var body: some View {
    Text("SplashPage")
      .foregroundStyle(Color.red)
      .padding(24)
  }
}

#Preview {
  SplashPage(store: .init(
    initialState: SplashStore.State(),
    reducer: {
      SplashStore(
        env: SplashEnvMock()
      )
    })
  )
}
