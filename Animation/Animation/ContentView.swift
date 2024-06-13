//
//  ContentView.swift
//  Animation
//
//  Created by Adrian Prieto Villena on 13/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingRed = false
    let letters = Array("Hello SwiftUI")
    @State private var enabledButton = false
    @State private var enabledLetter = false
    @State private var dragAmount = CGSize.zero
    @State private var animationAmount = 0.0
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation(.spring(duration: 1, bounce: 0.5)) {
                    animationAmount += 360
                }
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(
                .degrees(animationAmount), axis: (x:0, y:1,z:0)
            )
        }
        VStack {
            Button("Tap Me") {
                enabledButton.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabledButton ? .blue : .red)
            .animation(nil, value: enabledButton)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabledButton ? 60 : 0))
            .animation(.spring(duration: 1, bounce: 0.6), value: enabledButton)
        }
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabledLetter ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabledLetter.toggle()
                }
        )
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation(.bouncy) {
                            dragAmount = .zero
                        }
                    }
            )
            .animation(.bouncy, value: dragAmount)
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

#Preview {
    ContentView()
}
