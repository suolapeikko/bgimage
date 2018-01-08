//
//  main.swift
//  bgimage
//
//  Created by Suolapeikko on 08/01/2018.
//  Copyright © 2018 Suolapeikko. All rights reserved.
//

import Foundation
import AppKit

let args = CommandLine.arguments
let argCount = CommandLine.arguments.count
var errorFlag = false

// Check if there is incompatible number of arguments
if(argCount != 2) {
    errorFlag = true
}

if(errorFlag) {
    print("bgimage: macOS change background image command line utility\n");
    print("         Usage:");
    print("         bgimage image_file        Path to background image");
    exit(EXIT_FAILURE)
}

let workspace = NSWorkspace.shared
let screens = NSScreen.screens

// Iterate through available screens and set the background image specified in argument
for screen in screens {
    
    do {
        try workspace.setDesktopImageURL(URL.init(fileURLWithPath: args[1]), for: screen, options:[:])
    }
    catch let error {
        print("Failed to set up a bsackground image for screen: \(error)")
    }
}
