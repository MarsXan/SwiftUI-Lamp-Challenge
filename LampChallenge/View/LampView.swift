//
//  ContentView.swift
//  LampChallenge
//
//  Created by mohsen mokhtari on 8/10/23.
//

import SwiftUI

struct LampView: View {
    static let initialOffset: CGSize = .init(width: 0, height: 70)
    @State private var lampOffset: CGSize = initialOffset
    @State private var lampColor: Color = Color.yellow
    @State private var isLampOn: Bool = false
    
    var body: some View {
        ZStack {
            
            ZStack(alignment: .top) {
                Color.black
                    .ignoresSafeArea()
                    .zIndex(0)
                
                VStack{
                    Image("tree")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                       
                    Text("Telperion was the elder of the Two Trees of Valinor, called the White Tree, which shed silver light on the domain of the Valar. His leaves were of dark green, shining silver beneath, and his boughs were decked with brilliant flowers that shed a rain of silver dew, which was collected as a source of water and of light.")
                        .font(.body)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        
                        
                }.zIndex(2)
                    .vAlign(.bottom)
                
                
                
                Rope(lampOffset: lampOffset)
                    .stroke(Color(.lightGray),
                            lineWidth: 4)
                    .zIndex(3)
                
                Rectangle()
                    .fill(isLampOn ? lampColor : .clear)
                    .frame(width: 150, height: 150)
                    .offset(x: lampOffset.width, y: lampOffset.height)
                    .blur(radius: 90)
                    .zIndex(1)
                
                Image(systemName: "lightbulb.fill")
                    .resizable()
                    .frame(width: 30, height: 50)
                    .foregroundColor(isLampOn ? lampColor : Color(.lightGray) )
                    .rotationEffect(.degrees(180))
                    .offset(x: lampOffset.width, y: lampOffset.height)
                    .padding(.top,-2)
                    .overlay {
                        Circle()
                            .fill(.black)
                            .frame(width: 13, height: 13)
                            .offset(x: lampOffset.width, y: lampOffset.height)
                            .blur(radius: 8)
                            .opacity(isLampOn ? 0 : 1)
                    }
                    .gesture(
                        DragGesture().onChanged { value in
                            lampOffset = .init(width: value.translation.width, height: value.translation.height + 70)
                        } .onEnded({ value in
                            lampOffset = LampView
                            .initialOffset
                        })
                    )
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.6)) {
                            isLampOn.toggle()
                        }
                    }.zIndex(3)
            }
            .animation(.spring(response: 0.35,
                               dampingFraction: 0.35,
                               blendDuration: 0),
                       value: lampOffset == LampView.initialOffset )
            .edgesIgnoringSafeArea(.top)
            
        }
    }
}



struct Lamp_Previews: PreviewProvider {
    static var previews: some View {
        LampView()
            .preferredColorScheme(.dark)
    }
}
