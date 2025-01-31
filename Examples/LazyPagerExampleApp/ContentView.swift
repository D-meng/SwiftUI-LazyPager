//
//  ContentView.swift
//  LazyPager
//
//  Created by Brian Floersch on 7/2/23.
//

import SwiftUI
import LazyPager


struct Foo {
    let id = UUID()
    var img: String
    let idx: Int
}

struct ContentView: View {
    
    @State var data = [
        Foo(img: "nora1", idx: 0),
    ]
    
    @State var show = true
    @State var opacity: CGFloat = 1
    @State var index = 0
    @State var templateHeight = 100.0
    @State var minZoom = 1.0
    
    var body: some View {
        VStack {
            LazyPager(data: data, page: $index) { element in
                ZStack {
                    Image(element.img)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .zoomable(min:minZoom, max: 5)
            .frame(height: templateHeight)
//            .onDismiss(backgroundOpacity: $opacity) {
//                show = false
//            }
//            .onTap {
//                print("tap")
//            }
//            .background(.black.opacity(opacity))
//            .background(ClearFullScreenBackground())
//            .ignoresSafeArea()
            .frame(height: 200)
            .background(.white)
            Spacer()
            Button(action: {
//                minZoom += 0.2
                templateHeight += 10
            }, label: {
                Text("Button")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
