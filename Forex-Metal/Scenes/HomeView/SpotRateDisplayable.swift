//
//  SpotRateDisplayable.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-05-16.
//

import Foundation
import UIKit

typealias SpotRateDisplayables = [SpotRateDisplayable]

struct SpotRateDisplayable {
    var currencyCode: String
    var time: String
    var spotRateExport: AttributedString
    var spotRateImport: AttributedString
    var rateO: String
    var rateC: String
    var rateH: String
    var rateL: String
    var netChg: String
    var chg: String
    
    
    init(currencyCode: String, time: String, spotRateExport: AttributedString, spotRateImport: AttributedString, rateO: String, rateC: String, rateH: String, rateL: String, netChg: String, chg: String) {
        self.currencyCode = currencyCode
        self.time = time
        self.spotRateExport = spotRateExport
        self.spotRateImport = spotRateImport
        self.rateO = rateO
        self.rateC = rateC
        self.rateH = rateH
        self.rateL = rateL
        self.netChg = netChg
        self.chg = chg
    }
}


extension SpotRateDisplayable {
    init (rate: Datum) {
        self.init(currencyCode: rate.currencyCode,
                  time: rate.lastUpdateTime.changeDateToTime(),
                  spotRateExport: rate.spotrateExp.forPrice(),
                  spotRateImport: rate.spotrateImp.forPrice(),
                  rateO: rate.openRate.convertToString(),
                  rateC: rate.closeRate.convertToString(),
                  rateH: rate.highRate.convertToString(),
                  rateL: rate.lowRate.convertToString(),
                  netChg: rate.netChg.convertToString(),
                  chg: rate.percentageChg.convertToString2F())
    }
}


extension Array where Element == SpotRateDisplayable {
    static var loading: Self {
        return (1...10).map { _ in
            SpotRateDisplayable(currencyCode: "Loading",
                                time: "Loading",
                                spotRateExport: .init("Loading"),
                                spotRateImport: .init("Loading"),
                                rateO: "Loading",
                                rateC: "Loading",
                                rateH: "Loading",
                                rateL: "Loading",
                                netChg: "Loading",
                                chg: "Loading")
        }
    }
}
