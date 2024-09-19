//
//  HistoryView.swift
//  ZeroCount
//
//  Created by Jongwook Park on 2/5/24.
//

import SwiftUI

struct HistoryView: View {
    private var countHistoryStore = CountHistoryStore()
    
    var body: some View {
        NavigationStack {
            List {
                if countHistoryStore.countHistoryList.isEmpty {
                    Text(String(localized: "There is no history data."))
                }
                
                ForEach(countHistoryStore.countHistoryList) { history in
                    HStack(alignment: .bottom) {
                        Text("\(history.count)")
                            .fontWeight(.heavy)
                        .font(.largeTitle)
                        Spacer()
                        Text("\(history.dateString)")
                    }
                }
                .onDelete(perform: { indexSet in
                    // 화면상에서 indexSet에 포함된 "몇번째"요소들이 지워지면
                    // 실제 데이터도 지워줘야 한다
                    
                    // List에서 onDelete가 IndexSet을 주는 이유는
                    // 여러 개의 항목들을 한번에 선택 삭제할 수도 있기 때문이다
                    print("\(indexSet)")
                    countHistoryStore.deleteData(at: indexSet)
                })
            }
            .navigationTitle(String(localized: "History"))
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .onAppear {
                countHistoryStore.fetchData()
            }
            .refreshable {
                countHistoryStore.fetchData()
            }
        }
    }
}

#Preview {
    HistoryView()
}
