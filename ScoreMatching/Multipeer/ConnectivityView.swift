import Foundation
import SwiftUI
import MultipeerConnectivity

struct ConnectivityView: View {

    @EnvironmentObject var connectivity: Connectivity
    @Environment(\.verticalSizeClass) var verticalSizeClass

    var body: some View {
        VStack {
            if !connectivity.connectedPeers.isEmpty {
                if verticalSizeClass == .regular {
                    VStack(spacing: 0) {
                        ForEach(connectivity.readOnlyData) { element in
                            TapButton(count:.constant(element.count),
                                      color: .constant(element.color),
                                      name: .constant(element.name),
                                      lastTapped: .constant(nil),
                                      lastTimeTapped: .constant(Date()))
                                .background(element.color)
                                .colorInvert()
                                .colorInvert()
                        }
                    }.ignoresSafeArea()
                } else {
                    HStack(spacing: 0) {
                        ForEach(connectivity.readOnlyData) { element in
                            TapButton(count:.constant(element.count),
                                      color: .constant(element.color),
                                      name: .constant(element.name),
                                      lastTapped: .constant(nil),
                                      lastTimeTapped: .constant(Date()))
                                .background(element.color)
                                .colorInvert()
                                .colorInvert()
                        }
                    }.ignoresSafeArea()
                }

            } else {
                List {
                    Section("Found") {
                        ForEach(Array(connectivity.peers), id: \.displayName) { peer in
                            Button {
                                connectivity.connect(to: peer)
                            } label: {
                                Text(peer.displayName)
                            }
                        }
                    }

                    Section("Connected") {
                        ForEach(Array(connectivity.connectedPeers), id: \.displayName) { peer in
                            Text(peer.displayName)
                        }
                    }
                }
            }
        }
    }
}
