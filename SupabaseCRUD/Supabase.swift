//
//  Supabase.swift
//  SupabaseCRUD
//
//  Created by Godwin IE on 23/07/2024.
//

import Foundation
import Supabase

let supabase = SupabaseClient(
  supabaseURL: URL(string: "https://ggpislwccasfyqdvbwym.supabase.co")!,
  supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdncGlzbHdjY2FzZnlxZHZid3ltIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjE3NDUyNjgsImV4cCI6MjAzNzMyMTI2OH0.0EaFY1svBk5dlu4zSausbVy64T9_np5b-v3AKm8lnC4"
)
