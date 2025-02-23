//
//  AdView.swift
//  TSAdViewUIKitDemo
//
//  Created by TAE SU LEE on 2023/07/20.
//

import TSAdView
import SwiftUI

struct AdView: View {
    var body: some View {
        TSAdViewSwiftUI(
            adServiceTypes: [
                .googleAdManager(params: .init(adFormatIDs: [/*@START_MENU_TOKEN@*/"Your adFormatIDs"/*@END_MENU_TOKEN@*/],
                                               adUnitIDs: [/*@START_MENU_TOKEN@*/"Your adUnitID"/*@END_MENU_TOKEN@*/])),
                .googleAdMob(params: .init(adDimension: CGSize(width: 300, height: 400)))
            ], adViewProvider: { ads, adServiceType in
                // Create and return your custom UIView here based on the `ad`.
                // Note: This closure is specifically designed for AdManager.
                // For AdMob, you don't need to provide a custom UIView.
                return UIImageView(image: ads.first?.image(forKey: "image")?.image)
            }, onAdLoadFailure: {
                print("AdView onAdLoadFailure")
            }
        )
        .frame(width: 300, height: 400)
    }
}

struct AdView_Previews: PreviewProvider {
    static var previews: some View {
        AdView()
    }
}
