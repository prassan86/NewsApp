//
//  DateUtility.swift
//  NewsApp
//
//  Created by Nagarajan, Karunakaran on 6/10/20.
//

import Foundation

class DateUtility {
    
    static func formattedDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: dateString)!
        let formatter = DateFormatter()
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        formatter.dateFormat = "MM/dd/yy • h:mma"
        let datestring = formatter.string(from: date)
        return datestring
    }
}
