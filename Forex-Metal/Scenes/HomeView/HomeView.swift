//
//  HomeView.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-05-16.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject
    private var viewModel: HomeViewModel
    
    
    private enum Labels {
        static let waitingPlaceholder = "Fetching Rates!"
    }
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            ResultStateViewBuilder(result: self.viewModel.rates)
                .setWaitingView {
                    StandardEmptyView(message: Labels.waitingPlaceholder)
                }
                .setLoadingView { displayable in
                    self.buildMoviesList(rates: displayable ?? .loading)
                }
                .buildContent(self.buildMoviesList)
                .navigationTitle("Movies")
        }
        .task {
            viewModel.fetchRates()
        }
    }
    
    @ViewBuilder
    private func buildMoviesList(rates: SpotRateDisplayables) -> some View {
        List {
            ForEach(rates.indices, id: \.self) { index in
                SpotRateItem(rate: rates[index])
                //.background(index % 2 == 0 ? .white : .gray.opacity(0.5))
            }
        }.listStyle(PlainListStyle())
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(adapter: NetworkAdapter()))
}
