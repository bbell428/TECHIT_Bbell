//
//  ContentView.swift
//  CounrtryAPI
//
//  Created by 김종혁 on 9/30/24.
//

import SwiftUI

struct ContentView: View {
    var countryStore: CountryStore = CountryStore(countrys: countryData)
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(countryStore.countrys) { country in
                    NavigationLink {
                        CountryDetailView(city: country)
                    } label: {
                        VStack {
                            Text(country.name)
                                .font(.headline)
                            Text(country.capital)
                                .font(.subheadline)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
