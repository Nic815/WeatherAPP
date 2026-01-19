//
//  SupabaseService.swift
//  Glasscast
//
//  Created by NIKHIL on 19/01/26.
//



import Foundation
import Supabase

final class SupabaseService {

    static let shared = SupabaseService()

    let client: SupabaseClient

    private init() {

    
        let supabaseURL = URL(string: "https://zoablliwzoiyeppfdugv.supabase.co")!
        let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InpvYWJsbGl3em9peWVwcGZkdWd2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Njg4MjI1NTUsImV4cCI6MjA4NDM5ODU1NX0.2DRw3Wd9czTxnofN3iTqDzTdS48iYT4uUz7SR1NpnGA"

        client = SupabaseClient(
            supabaseURL: supabaseURL,
            supabaseKey: supabaseKey
        )
    }
}
