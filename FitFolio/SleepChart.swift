//
//  HeartRate.swift
//  FitFolio
//
//  Created by Deepesh Garg on 25/11/23.
//

import Foundation
import SwiftUI
import Charts

struct SleepChartModel: Identifiable {
    let id = UUID()
    let hoursSlept: Double
    let checkedAt: Date
}

struct SleepChart: View {
    
    let list = [
        SleepChartModel(hoursSlept: 5, checkedAt: dateFormatter.date(from: "10/11/2023") ?? Date()),
        SleepChartModel(hoursSlept: 7, checkedAt: dateFormatter.date(from: "11/11/2023") ?? Date()),
        SleepChartModel(hoursSlept: 8, checkedAt: dateFormatter.date(from: "12/11/2023") ?? Date()),
        SleepChartModel(hoursSlept: 7, checkedAt: dateFormatter.date(from: "13/11/2023") ?? Date()),
        SleepChartModel(hoursSlept: 6, checkedAt: dateFormatter.date(from: "14/11/2023") ?? Date()),
        SleepChartModel(hoursSlept: 7, checkedAt: dateFormatter.date(from: "15/11/2023") ?? Date()),
        SleepChartModel(hoursSlept: 8, checkedAt: dateFormatter.date(from: "16/11/2023") ?? Date()),
    ]
    
    static var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yy"
        return df
    }()
    
    func formatDayOfWeek(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            Chart(list) { sleepChartModel in
                LineMark(x: .value("Day", formatDayOfWeek(sleepChartModel.checkedAt)), y: .value("Hours Slept", sleepChartModel.hoursSlept)).foregroundStyle(.red)
                PointMark(
                    x: .value("Day", formatDayOfWeek(sleepChartModel.checkedAt)),
                    y: .value("Hours Slept", sleepChartModel.hoursSlept)).foregroundStyle(.red)
            }.chartYAxis {
                AxisMarks(position: .leading)
            }.padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        } else {
            // Fallback on earlier versions
        }
    }
}
