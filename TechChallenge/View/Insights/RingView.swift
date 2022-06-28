//
//  RingView.swift
//  TechChallenge
//
//  Created by Adrian Tineo Cabello on 29/7/21.
//

import SwiftUI

fileprivate typealias Category = TransactionModel.Category

struct RingView: View {
    @EnvironmentObject private var transactions: TransactionList
    
    private let categories = Category.allCases.filter { $0 != .all}
    
    private func ratio(for categoryIndex: Int) -> Double {
        let category = categories[categoryIndex]
        return getCategoriesRatio()[category] ?? 0.0
    }
    
    private func getCategoriesRatio() -> [Category: Double] {
        var ratio: [Category: Double] = [:]
        for category in categories {
            ratio[category] = transactions.list.ratioFor(selectedCategory: category, includeOnlyPinned: true)
        }
        return ratio
    }
    
    private func offset(for categoryIndex: Int) -> Double {
        guard categoryIndex != 0 else {
            return 0.0
        }
        // Iterate through the categories and sum up the ratio of each category
        return (0...categoryIndex-1).reduce(0.0) { partialResult, eachIndex in
            partialResult + ratio(for: eachIndex)
        }
    }

    private func gradient(for categoryIndex: Int) -> AngularGradient {
        let color = categories[categoryIndex].color
        return AngularGradient(
            gradient: Gradient(colors: [color.unsaturated, color]),
            center: .center,
            startAngle: .init(
                offset: offset(for: categoryIndex),
                ratio: 0
            ),
            endAngle: .init(
                offset: offset(for: categoryIndex),
                ratio: ratio(for: categoryIndex)
            )
        )
    }
    
    private func percentageText(for categoryIndex: Int) -> String {
        let percentage = (ratio(for: categoryIndex) * 100)
        if percentage > 0 {
            return "\(percentage.formatted(hasDecimals: false))%"
        }
        return ""
    }
    
    var body: some View {
        ZStack {
            ForEach(categories.indices, id: \.self) { categoryIndex in
                PartialCircleShape(
                    offset: offset(for: categoryIndex),
                    ratio: ratio(for: categoryIndex)
                )
                .stroke(
                    gradient(for: categoryIndex),
                    style: StrokeStyle(lineWidth: 28.0, lineCap: .butt)
                )
                .overlay(
                    PercentageText(
                        offset: offset(for: categoryIndex),
                        ratio: ratio(for: categoryIndex),
                        text: percentageText(for: categoryIndex)
                    )
                )
            }
        }
    }
}

extension RingView {
    struct PartialCircleShape: Shape {
        let offset: Double
        let ratio: Double
        
        func path(in rect: CGRect) -> Path {
            Path(offset: offset, ratio: ratio, in: rect)
        }
    }
    
    struct PercentageText: View {
        let offset: Double
        let ratio: Double
        let text: String
        
        private func position(for geometry: GeometryProxy) -> CGPoint {
            let rect = geometry.frame(in: .local)
            let path = Path(offset: offset, ratio: ratio / 2.0, in: rect)
            return path.currentPoint ?? .zero
        }
        
        var body: some View {
            GeometryReader { geometry in
                Text(text)
                    .percentage()
                    .position(position(for: geometry))
            }
        }
    }
}

#if DEBUG
struct RingView_Previews: PreviewProvider {
    static var sampleRing: some View {
        ZStack {
            RingView.PartialCircleShape(offset: 0.0, ratio: 0.15)
                .stroke(
                    Color.red,
                    style: StrokeStyle(lineWidth: 28.0, lineCap: .butt)
                )
            
            RingView.PartialCircleShape(offset: 0.15, ratio: 0.5)
                .stroke(
                    Color.green,
                    style: StrokeStyle(lineWidth: 28.0, lineCap: .butt)
                )
                
            RingView.PartialCircleShape(offset: 0.65, ratio: 0.35)
                .stroke(
                    Color.blue,
                    style: StrokeStyle(lineWidth: 28.0, lineCap: .butt)
                )
        }
    }
    
    static var previews: some View {
        VStack {
            sampleRing
                .scaledToFit()
            
            RingView()
                .scaledToFit()
                .environmentObject(TransactionList())
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
#endif
