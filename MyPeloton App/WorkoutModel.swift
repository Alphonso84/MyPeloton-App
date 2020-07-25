//
//  WorkoutModel.swift
//  MyPeloton App
//
//  Created by Alphonso Sensley II on 7/25/20.
//

import Foundation

// MARK: - Workout
struct Workout: Codable {
    let workoutTimestamp: String
    let liveOnDemand: LiveOnDemand
    let instructorName: String
    let lengthMinutes: Int
    let fitnessDiscipline: FitnessDiscipline
    let type, title, classTimestamp: String
    let totalOutput, avgWatts: AvgCadenceRPM
    let avgResistance: String
    let avgCadenceRPM: AvgCadenceRPM
    let avgSpeedMph, distanceMi: AvgHeartrate
    let caloriesBurned: Int
    let avgHeartrate: AvgHeartrate
    let avgIncline, avgPaceMinMi: String
    let id: UUID
    enum CodingKeys: String, CodingKey {
        case workoutTimestamp = "Workout Timestamp"
        case liveOnDemand = "Live/On-Demand"
        case instructorName = "Instructor Name"
        case lengthMinutes = "Length (minutes)"
        case fitnessDiscipline = "Fitness Discipline"
        case type = "Type"
        case title = "Title"
        case classTimestamp = "Class Timestamp"
        case totalOutput = "Total Output"
        case avgWatts = "Avg. Watts"
        case avgResistance = "Avg. Resistance"
        case avgCadenceRPM = "Avg. Cadence (RPM)"
        case avgSpeedMph = "Avg. Speed (mph)"
        case distanceMi = "Distance (mi)"
        case caloriesBurned = "Calories Burned"
        case avgHeartrate = "Avg. Heartrate"
        case avgIncline = "Avg. Incline"
        case avgPaceMinMi = "Avg. Pace (min/mi)"
        case id = "UUID"
    }
}

enum AvgCadenceRPM: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(AvgCadenceRPM.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for AvgCadenceRPM"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum AvgHeartrate: Codable {
    case double(Double)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(AvgHeartrate.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for AvgHeartrate"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

enum FitnessDiscipline: String, Codable {
    case bootcamp = "Bootcamp"
    case cardio = "Cardio"
    case cycling = "Cycling"
    case strength = "Strength"
    case stretching = "Stretching"
    case yoga = "Yoga"
}

enum LiveOnDemand: String, Codable {
    case empty = ""
    case live = "Live"
    case onDemand = "On Demand"
}

typealias Workouts = [Workout]
