//
//  PeriodPicker.swift
//  QuickMaths
//
//  Created by Trey Davis on 4/14/21.
//

import SwiftUI

struct PeriodPicker: View {
    @Binding var n: Periods
    
    var body: some View {
        Picker(selection: $n, label: Text(n.localizedName)) {
            ForEach(Periods.allCases) {
                Text($0.rawValue).tag($0)
            }
        }
    }
}

enum Periods: String, Equatable, CaseIterable, Identifiable {
    case annually = "Annually"
    case semiannually = "Semiannually"
    case quarterly = "Quarterly"
    case monthly = "Monthly"
    case weekly = "Weekly"
    case daily = "Daily"
    
    var id: String { self.rawValue }
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
