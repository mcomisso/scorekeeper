import SwiftUI

struct MainView: View {
    @SceneStorage("isReceiverMode") var isReceiverMode: Bool = false

    var body: some View {
        if isReceiverMode {
            ZStack(alignment: .bottom) {
                ConnectivityView()

                Button {
                    isReceiverMode = false
                } label: {
                    Text("Exit receiver mode")
                        .font(.callout)
                        .padding()
                        .background(.thickMaterial, in: RoundedRectangle(cornerRadius: 8))
                        .padding()
                }
            }
        } else {
            ContentView()
        }
    }
}

@main
struct ScoreMatchingApp: App {
    private let connectivity = Connectivity()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(connectivity)
        }
    }
}

extension Color {
    static var random: Color {
        Color(hue: Double.random(in: (0...1)), saturation: Double.random(in: (0.8...1.0)), brightness: 1)
    }
}
