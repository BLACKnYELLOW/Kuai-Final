//
//  MonthStruct.swift
//  App parts
//
//  Created by Michael Liu (student LM) on 4/17/23.
//

import Foundation



struct MonthStruct {

    

    var monthType: MonthType

    var dayInt: Int

    func day() -> String {

        return String(dayInt)

        

    }

}



enum MonthType {

    case Previous

    case Current

    case Next

}
