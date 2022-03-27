//
//  ActionStageView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 27/03/2022.
//

import SwiftUI

struct ActionStageView: View {
    @State private var selectedDuration: Duration = .seconds
    
    var body: some View {
        VStack {
            ActionStageLine {
                Text("Every")
                
                DurationTextField(text: .constant("10"))
                
                DurationSelector(selectedDuration: self.$selectedDuration)
                
                Text(",")
            }
            
            ActionStageLine {
                Text("Press")
                
                Button("Right Click") {
                    
                }
                
                DurationTextField(text: .constant("10"))
                
                Text("times,")
            }
            
            ActionStageLine {
                Text("Wait")
                
                DurationTextField(text: .constant("10"))
                
                DurationSelector(selectedDuration: self.$selectedDuration)
                
                Text(",")
            }
            
            ActionStageLine {
                Text("Repeat")
                
                DurationTextField(text: .constant("10"))
                
                Text("times.")
            }
        }
    }
}

struct ActionStageView_Previews: PreviewProvider {
    static var previews: some View {
        ActionStageView()
            .frame(minWidth: WindowSize.width)
            .frame(maxWidth: WindowSize.width)
            .padding(10)
    }
}
