//
//  SpotRateItem.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-05-16.
//

import SwiftUI

struct SpotRateItem: View {
    
    private var rate: SpotRateDisplayable
    
    init(rate: SpotRateDisplayable) {
        self.rate = rate
    }
    
    var body: some View {
        HStack {
            buildCurrencyTimeView()
            
            buildInfoView()
        }.frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
    
    @ViewBuilder
    func buildCurrencyTimeView() -> some View {
        VStack(spacing: 8) {
            Text(rate.currencyCode)
                .font(.customFont(font: .nunito,
                                  style: .bold,
                                  size: 17))
            Text(rate.time)
                .multilineTextAlignment(.leading)
                .font(.customFont(font: .nunito,
                                  style: .light,
                                  size: 14))
            
            Spacer()
        }
        .frame(width: 80)
    }
    
    @ViewBuilder
    func buildInfoView() -> some View {
        VStack(spacing: 8) {
            buildRatesView()
            
            HStack() {
                buildRateView()
                Spacer()
                buildChgView()
            }
            
            Spacer()
        }
        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
    
    @ViewBuilder
    func buildRatesView() -> some View {
        HStack(spacing: 8) {
            Text(rate.spotRateExport)
                .font(.customFont(font: .nunito,
                                  style: .light,
                                  size: 14))
            Color(.red)
                .frame(width: 2,height: 15)
            
            Text(rate.spotRateImport)
                .font(.customFont(font: .nunito,
                                  style: .light,
                                  size: 14))
            
            Spacer()
        }.frame(height: 30)
    }
    
    @ViewBuilder
    func buildChgView() -> some View {
        VStack(spacing: 3) {
            HStack(spacing: 5) {
                Text("Net Chg :")
                    .font(.customFont(font: .nunito,
                                      style: .semiBold,
                                      size: 12))
                
                Text(rate.netChg)
                    .font(.customFont(font: .nunito,
                                      style: .light,
                                      size: 11))
                
                Spacer()
            }
            
            HStack(spacing: 5) {
                Text("% Chg :")
                    .font(.customFont(font: .nunito,
                                      style: .semiBold,
                                      size: 12))
                
                Text(rate.chg)
                    .font(.customFont(font: .nunito,
                                      style: .light,
                                      size: 11))
                Spacer()
            }
        }.frame(width: 115)
    }
    
    @ViewBuilder
    func buildRateView() -> some View {
        VStack(spacing: 3) {
            HStack(spacing: 5) {
                Text("O :")
                    .font(.customFont(font: .nunito,
                                      style: .semiBold,
                                      size: 12))
                
                Text(rate.rateO)
                    .font(.customFont(font: .nunito,
                                      style: .light,
                                      size: 11))
                
                Text("C :")
                    .font(.customFont(font: .nunito,
                                      style: .semiBold,
                                      size: 12))
                
                Text(rate.rateC)
                    .font(.customFont(font: .nunito,
                                      style: .light,
                                      size: 11))
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            HStack(spacing: 5) {
                Text("H :")
                    .font(.customFont(font: .nunito,
                                      style: .semiBold,
                                      size: 12))
                
                Text(rate.rateH)
                    .font(.customFont(font: .nunito,
                                      style: .light,
                                      size: 11))
                
                Text("L :")
                    .font(.customFont(font: .nunito,
                                      style: .semiBold,
                                      size: 12))
                
                Text(rate.rateL)
                    .font(.customFont(font: .nunito,
                                      style: .light,
                                      size: 11))
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }.frame(minWidth: 160)
    }
}
