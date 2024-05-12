//
//  Spots.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-05-12.
//

import Foundation

typealias SpotRates = [Datum]

struct Spots: Codable {
    let status, msg: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let closeRate: Double
    let contributorCode, currencyCode: String
    let currencyID, currencyRatesID: Int
    let dateAdded, dateHighUpdated, datelowupdated: String
    let dateManualupdated: String
    let dateSMSUpdated: String
    let dateUpdated: String
    let highRate: Double
    let lastUpdateTime: String
    let lastUpdateTimeWeb, lastRate, lowRate, netChg: Double
    let openRate, percentageChg, spotrateExp, spotrateImp: Double

    enum CodingKeys: String, CodingKey {
        case closeRate = "CloseRate"
        case contributorCode = "Contributor_Code"
        case currencyCode = "Currency_Code"
        case currencyID = "Currency_ID"
        case currencyRatesID = "Currency_Rates_ID"
        case dateAdded = "DateAdded"
        case dateHighUpdated = "DateHighUpdated"
        case datelowupdated = "Datelowupdated"
        case dateManualupdated = "DateManualupdated"
        case dateSMSUpdated = "DateSMSUpdated"
        case dateUpdated = "DateUpdated"
        case highRate = "HighRate"
        case lastUpdateTime = "Last_Update_Time"
        case lastUpdateTimeWeb = "Last_Update_Time_Web"
        case lastRate = "LastRate"
        case lowRate = "LowRate"
        case netChg = "Net_Chg"
        case openRate = "OpenRate"
        case percentageChg = "Percentage_Chg"
        case spotrateExp = "Spotrate_Exp"
        case spotrateImp = "Spotrate_Imp"
    }
}
