//
//  HeartRate.swift
//  FitFolio
//
//  Created by Deepesh Garg on 25/11/23.
//

import Foundation
import SwiftUI
import Charts

struct HeartRateModel: Identifiable {
    let id = UUID()
    let bpm: Int
    let checkedAt: Date
}

struct HeartRate: View {
    
    let list = [
        HeartRateModel(bpm: 80, checkedAt: dateFormatter.date(from: "10/11/2023") ?? Date()),
        HeartRateModel(bpm: 85, checkedAt: dateFormatter.date(from: "11/11/2023") ?? Date()),
        HeartRateModel(bpm: 100, checkedAt: dateFormatter.date(from: "12/11/2023") ?? Date()),
        HeartRateModel(bpm: 101, checkedAt: dateFormatter.date(from: "13/11/2023") ?? Date()),
        HeartRateModel(bpm: 108, checkedAt: dateFormatter.date(from: "14/11/2023") ?? Date()),
        HeartRateModel(bpm: 99, checkedAt: dateFormatter.date(from: "15/11/2023") ?? Date()),
        HeartRateModel(bpm: 80, checkedAt: dateFormatter.date(from: "16/11/2023") ?? Date()),
        HeartRateModel(bpm: 94, checkedAt: dateFormatter.date(from: "17/11/2023") ?? Date()),
        HeartRateModel(bpm: 83, checkedAt: dateFormatter.date(from: "18/11/2023") ?? Date()),
        HeartRateModel(bpm: 100, checkedAt: dateFormatter.date(from: "19/11/2023") ?? Date()),
        HeartRateModel(bpm: 105, checkedAt: dateFormatter.date(from: "20/11/2023") ?? Date()),
        HeartRateModel(bpm: 89, checkedAt: dateFormatter.date(from: "21/11/2023") ?? Date()),
        HeartRateModel(bpm: 95, checkedAt: dateFormatter.date(from: "22/11/2023") ?? Date()),
        HeartRateModel(bpm: 80, checkedAt: dateFormatter.date(from: "23/11/2023") ?? Date()),
    ]
    
    static var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yy"
        return df
    }()
    
    func formatDate (_ date: Date) -> String {
        let cal = Calendar.current
        let dateComponents = cal.dateComponents([.day, .month], from: date)
        guard let day = dateComponents.day, let month = dateComponents.month else {
            return "-"
        }
        return "\(day)/\(month)"
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            Chart(list) { heartRateModel in
                LineMark(x: .value("Month", formatDate(heartRateModel.checkedAt)), y: .value("bpm", heartRateModel.bpm)).foregroundStyle(.red)
                PointMark(
                    x: .value("Month", formatDate(heartRateModel.checkedAt)),
                    y: .value("bpm", heartRateModel.bpm)).foregroundStyle(.red)
            }.chartYAxis {
                AxisMarks(position: .leading)
            }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        } else {
            // Fallback on earlier versions
        }
    }
}
