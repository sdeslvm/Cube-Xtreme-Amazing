import Foundation
import SwiftUI

struct CubeXtremeEntryScreen: View {
    @StateObject private var loader: CubeXtremeWebLoader

    init(loader: CubeXtremeWebLoader) {
        _loader = StateObject(wrappedValue: loader)
    }

    var body: some View {
        ZStack {
            CubeXtremeWebViewBox(loader: loader)
                .opacity(loader.state == .finished ? 1 : 0.5)
            switch loader.state {
            case .progressing(let percent):
                CubeXtremeProgressIndicator(value: percent)
            case .failure(let err):
                CubeXtremeErrorIndicator(err: err)  // err теперь String
            case .noConnection:
                CubeXtremeOfflineIndicator()
            default:
                EmptyView()
            }
        }
    }
}

private struct CubeXtremeProgressIndicator: View {
    let value: Double
    var body: some View {
        GeometryReader { geo in
            CubeXtremeLoadingOverlay(progress: value)
                .frame(width: geo.size.width, height: geo.size.height)
                .background(Color.black)
        }
    }
}

private struct CubeXtremeErrorIndicator: View {
    let err: String  // было Error, стало String
    var body: some View {
        Text("Ошибка: \(err)").foregroundColor(.red)
    }
}

private struct CubeXtremeOfflineIndicator: View {
    var body: some View {
        Text("Нет соединения").foregroundColor(.gray)
    }
}
