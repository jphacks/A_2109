//
//  TopView.swift
//  WikiApp
//
//  Created by tiking on 2021/10/28.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("ピン留め本一覧")
                .font(.h3)
                .padding(.horizontal, 16)
            
            VerticalSpacer(height: 32)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 48) {
                    Image("nene")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Image("nene")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Image("nene")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Image("nene")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Image("nene")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 16)
            }
            
            VerticalSpacer(height: 64)
            
            Divider()
            
            VerticalSpacer(height: 64)
            
            Text("おすすめ本一覧")
                .font(.h3)
                .padding(.horizontal, 16)
            
            VerticalSpacer(height: 32)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 48) {
                    Image("nene")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Image("nene")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Image("nene")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Image("nene")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                    Image("nene")
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 16)
            }
        }
    }
}
