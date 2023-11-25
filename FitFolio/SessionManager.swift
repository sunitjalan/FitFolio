//
//  SessionManager.swift
//  FitFolio
//
//  Created by Sunit Jalan on 25/11/23.
//

import Foundation
class SessionManager {
    static let shared = SessionManager()

    var currentUserEmail: String?

    private init() {}
}
