//
//  Logs.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/27/26.
//

import Orchard

func i(_ message: String){
    Orchard.icon("ℹ️").i(message)
   
}

func e(_ message: String,error: Error){
    Orchard.icon("❌").e(message, error)
}

func e(_ message: String){
    Orchard.icon("❌").e(message)
}
