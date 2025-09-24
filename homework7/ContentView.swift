/**
 
 * Homework 7
 * Jim Mittler
 * 22 August 2025
 
 _Italic text_
 __Bold text__
 ~~Strikethrough text~~

 */

import SwiftUI

extension VerticalAlignment {
    private enum OneThird : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height / 3
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
}

struct ContentView: View {
    var body: some View {
        
        HStack (alignment: .oneThird){
                    VStack {
                        Text("Hello my name is Jim.")
                            .fontWidth(.condensed)
                            .alignmentGuide(.oneThird) { d in d[VerticalAlignment.center] }
                        Image("itsme")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                    }

                    VStack {
                        Text("Bio:")
                            .fontWidth(.condensed)
                            .alignmentGuide(.oneThird) { d in d[VerticalAlignment.center] }
                        Text("Retired handyman, student and general mischief maker.").padding()
                        Text("I enjoy wrenching on cars, fixing vacuum tube amplifiers and radios and noodling on guitar and bass.")
                    }
                }
        
        VStack {
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
