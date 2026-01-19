//
//  SupabaseService.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//

//import Supabase
//import Foundation
//
//class SupabaseService {
//
//    static let shared = SupabaseService()
//
//    let client: SupabaseClient
//
//    private init() {
//
//        
//        print("SUPABASE_URL =", Bundle.main.infoDictionary?["SUPABASE_URL"] ?? "nil")
//        print("SUPABASE_KEY =", Bundle.main.infoDictionary?["SUPABASE_KEY"] ?? "nil")
//
//        guard
//            let urlString = Bundle.main.infoDictionary?["SUPABASE_URL"] as? String,
//            let url = URL(string: urlString),
//            let key = Bundle.main.infoDictionary?["SUPABASE_KEY"] as? String
//        else {
//            fatalError("❌ Supabase keys missing. Check Secrets.xcconfig and Info.plist")
//        }
//
//        client = SupabaseClient(
//            supabaseURL: url,
//            supabaseKey: key
//        )
//    }
//}

import Foundation
import Supabase

final class SupabaseService {

    static let shared = SupabaseService()

    let client: SupabaseClient

    private init() {

        // 🔴 HARD-CODED FOR SIMPLICITY (TEMPORARY)
        let supabaseURL = URL(string: "https://zoablliwzoiyeppfdugv.supabase.co")!
        let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpvYWJsbGl3em9peWVwcGZkdWd2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg4MjI1NTUsImV4cCI6MjA4NDM5ODU1NX0.2DRw3Wd9czTxnofN3iTqDzTdS48iYT4uUz7SR1NpnGA"

        client = SupabaseClient(
            supabaseURL: supabaseURL,
            supabaseKey: supabaseKey
        )
    }
}
