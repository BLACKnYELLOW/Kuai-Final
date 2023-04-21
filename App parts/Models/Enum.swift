//
//  Enum.swift
//  Kuai
//
//  Created by Asher Polsky (student LM) on 3/8/23.
//

import Foundation

enum CurrentView {
    case tab, morningSetup, weeklySetup
}

enum weekDay {
    case sunday, monday, tuesday, wednesday, thursday, friday, saturday
}

class BasicInfo : ObservableObject {
    @Published var view : CurrentView
    
    init(view: CurrentView) {
        self.view = .tab
    }
}
