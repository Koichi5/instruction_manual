//
//  RobotCleanerMaintenanceTerm.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2023/12/25.
//

import Foundation

struct RobotCleanerMaintenanceTerm: Identifiable {
    let id = UUID()
    let parts: String
    let frequency: String
    let exchangeTerm: String
}

let robotCleanerMaintenanceTerms: [RobotCleanerMaintenanceTerm] = [
    .init(parts: "ダスト容器", frequency: "必要に応じて洗浄", exchangeTerm: ""),
    .init(parts: "フィルター", frequency: "週１回（ペットがいるご家庭では週２回）を目安に清掃します。フィルターは洗わないでください", exchangeTerm: "２ヶ月ごと"),
    .init(parts: "ゴミセンサー", frequency: "２週間に１回を目安に清掃する", exchangeTerm: ""),
    .init(parts: "前輪部", frequency: "２週間に１回を目安に清掃する", exchangeTerm: "１２ヶ月ごと"),
    .init(parts: "エッジクリーニングブラシ", frequency: "月１回(ペットがいるご家庭では月２回)を目安に清掃する", exchangeTerm: "１２ヶ月ごと"),
    .init(parts: "ディアルアクションブラシ", frequency: "月１回(ペットがいるご家庭では月２回)を目安に清掃する", exchangeTerm: "１２ヶ月ごと"),
    .init(parts: "センサー", frequency: "月に１回を目安に清掃する", exchangeTerm: ""),
    .init(parts: "充電用接続部", frequency: "月に１回を目安に清掃する", exchangeTerm: ""),
]
