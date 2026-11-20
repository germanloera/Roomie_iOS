//
//  TitleModifier.swift
//  TrustedRoomie
//
//  Created by German Loera on 11/19/26.
//

import SwiftUI

public struct ScreenConfig {
    public var title : String? = nil
    public var subtitle : String? = nil
    public var hideBackButton = false
    public var rightContent :  AnyView? = nil
    
    public init(
         title: String? = nil,
         subtitle: String? = nil,
         hideBackButton: Bool = false,
         rightContent: AnyView? = nil
     ) {
         self.title = title
         self.subtitle = subtitle
         self.hideBackButton = hideBackButton
         self.rightContent = rightContent
     }
    
}


struct TitleModifier: ViewModifier {
    
    
    public var config : ScreenConfig = ScreenConfig()
    
    init(config: ScreenConfig = ScreenConfig()) {
        self.config = config
    }
    
    func body(content: Content) -> some View {
        content.navigationBarBackButtonHidden(config.hideBackButton )
            .toolbar {
                
                ToolbarItem(placement: .principal) {
                    HStack(alignment: .center, spacing: 12) {
                        
                        VStack(alignment: .center, spacing: 0) {
                            if let _title = config.title {
                                
                                Text(_title)
                                    .frauncesFont(.semiBold ,size: 24)
                                    .foregroundStyle(Color.roomie.ink)
                            }
                            if let _sub = config.subtitle{
                                Text(_sub)
                                    .dmSansFont(size: 12)
                                    .foregroundStyle(Color.roomie.mute)
                            }
                        }
                        .padding(0)
                        .frame( alignment: .topLeading)
                        
                        if let rightContent = config.rightContent{
                            rightContent
                        }

                        
                    }
                }
            }
    }
}

