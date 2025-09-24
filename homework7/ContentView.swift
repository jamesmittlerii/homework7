/**

 * __Homework 7__
 * Jim Mittler
 * 23 September 2025

 _Italic text_
 __Bold text__
 ~~Strikethrough text~~

 */

import SwiftUI

// this is our custom alignment
extension VerticalAlignment {
    private enum OneThird: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            // changing this doesn't do anything - we are always overriding it
            return d.height / 3
            //d[.top]
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
}

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content)
        -> some View
    {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct ContentView: View {

    @State private var showDebugBorders = true
    var body: some View {
        VStack {
            // Add a button to toggle the debug borders
            Button(
                showDebugBorders ? "Hide Debug Borders" : "Show Debug Borders"
            ) {
                showDebugBorders.toggle()
            }
            .padding()

            // we want two columns - name and picture on left
            // bio on right
            // we align using the "oneThird" structure we built
            HStack(alignment: .oneThird) {
                VStack {
                        
                    Image("itsme")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        

                    Text("Hello my name is Jim.")
                        .fontWidth(.condensed)
                        .alignmentGuide(.oneThird) { d in
                            d[VerticalAlignment.top]
                        }
                    
                }.if(showDebugBorders) { view in
                    view.border(Color.red)
                }

                VStack {
                    Text("Bio:")
                        .fontWidth(.condensed)
                        .alignmentGuide(.oneThird) { d in
                            d[VerticalAlignment.top]
                        }
                    Text(
                        "Retired handyman, student and general mischief maker."
                    )
                    .textScale(.secondary)

                    .padding()
                    Text(
                        "I enjoy wrenching on cars, fixing vacuum tube amplifiers and radios and noodling on guitar and bass."
                    ).textScale(.secondary)
                }.if(showDebugBorders) { view in
                    view.border(Color.red)
                }
            }.if(showDebugBorders) { view in
                view.border(Color.purple)
                    .overlay(
                        GeometryReader { geometry in
                            let guidePosition = geometry.size.height / 3
                            Rectangle()
                                .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                                .frame(height: 1)
                                .foregroundColor(.blue)
                                .offset(y: guidePosition)
                        }
                    )
            }

        }
    }
}

#Preview {
    ContentView()
}
