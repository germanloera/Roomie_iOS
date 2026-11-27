//
//  HomeViewModel.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/27/26.
//

import Foundation
import Observation
import SwiftUI
import Combine

@Observable
@MainActor
public final class HomeViewModel {
    
    @ObservationIgnored private let sessionTaskHolder = TaskHolder()
    
    private let supabaseRepository: any SupabaseRepositoryProtocol
    private let authRepository: any AuthRepository
    public var bottomBarIndex: Int = 0

   

    public init(
        bottomBarIndex : Int = 0,
        supabaseRepository: any SupabaseRepositoryProtocol = SupabaseRepository.shared,
        authRepository: any AuthRepository = AuthRepositoryImpl.shared
    ) {
        self.supabaseRepository = supabaseRepository
        self.authRepository = authRepository
        self.bottomBarIndex = bottomBarIndex
    }
    
    public convenience init(
        repository: any SupabaseRepositoryProtocol = SupabaseRepository.shared,
        auth: any AuthRepository = AuthRepositoryImpl.shared
    ) {
        self.init(bottomBarIndex : 0, supabaseRepository: repository, authRepository: auth)
    }
    
    

    
    
    
    
    
    public func setBottomBarIndex(_ index: Int) {
        self.bottomBarIndex = index
    }
    
    
    
    
    
    
    
       
}
