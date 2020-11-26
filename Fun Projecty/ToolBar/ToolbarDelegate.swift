//
//  ToolbarDelegate.swift
//  ToolBar
//
//  Created by Apple on 5/11/20.
//

import UIKit

class ToolbarDelegate: NSObject {

}

#if targetEnvironment(macCatalyst)

extension ToolbarDelegate: NSToolbarDelegate {
    
    func toolbarDefaultItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        let identifiers: [NSToolbarItem.Identifier] = [
            .toggleSidebar
        ]
        return identifiers
    }
    
}

#endif
