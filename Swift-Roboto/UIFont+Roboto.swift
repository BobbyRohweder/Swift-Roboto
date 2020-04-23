//
//  UIFont+Roboto.swift
//  Swift-Roboto
//
//  Created by Bobby Rohweder on 4/22/20.
//  Copyright © 2020 Bobby Rohweder. All rights reserved.
//

import UIKit

extension UIFont {
    
    private struct RobotoFileName {
        static let thin = "Roboto-Thin.ttf"
        static let light = "Roboto-Light.ttf"
        static let regular = "Roboto-Regular.ttf"
        static let medium = "Roboto-Medium.ttf"
        static let bold = "Roboto-Bold.ttf"
        static let black = "Roboto-Black.ttf"
        
        static let thinItalic = "Roboto-ThinItalic.ttf"
        static let lightItalic = "Roboto-LightItalic.ttf"
        static let regularItalic = "Roboto-Italic.ttf"
        static let mediumItalic = "Roboto-MediumItalic.ttf"
        static let boldItalic = "Roboto-BoldItalic.ttf"
        static let blackItalic = "Roboto-BlackItalic.ttf"
    }
    
    private static var registerRobotoFonts: () = {
        do {
            let bundle = Bundle(for: RobotoContext.self)
            try UIFont.registerFont(withFilename: RobotoFileName.thin, bundle: bundle)
            try UIFont.registerFont(withFilename: RobotoFileName.light, bundle: bundle)
            try UIFont.registerFont(withFilename: RobotoFileName.regular, bundle: bundle)
            try UIFont.registerFont(withFilename: RobotoFileName.medium, bundle: bundle)
            try UIFont.registerFont(withFilename: RobotoFileName.bold, bundle: bundle)
            try UIFont.registerFont(withFilename: RobotoFileName.black, bundle: bundle)
            
            try UIFont.registerFont(withFilename: RobotoFileName.thinItalic, bundle: bundle)
            try UIFont.registerFont(withFilename: RobotoFileName.lightItalic, bundle: bundle)
            try UIFont.registerFont(withFilename: RobotoFileName.regularItalic, bundle: bundle)
            try UIFont.registerFont(withFilename: RobotoFileName.mediumItalic, bundle: bundle)
            try UIFont.registerFont(withFilename: RobotoFileName.boldItalic, bundle: bundle)
            try UIFont.registerFont(withFilename: RobotoFileName.blackItalic, bundle: bundle)
        } catch let error as NSError {
            assertionFailure("Failed to load fonts with error \(error)")
        }
    }()
    
    private struct RobotoFont {
        static let thin = UIFont(name: "Roboto-Thin", size: 25)!
        static let light = UIFont(name: "Roboto-Light", size: 25)!
        static let regular = UIFont(name: "Roboto", size: 25)!
        static let medium = UIFont(name: "Roboto-Medium", size: 25)!
        static let bold = UIFont(name: "Roboto-Bold", size: 25)!
        static let black = UIFont(name: "Roboto-Black", size: 25)!
        
        static let thinItalic = UIFont(name: "Roboto-ThinItalic", size: 25)!
        static let lightItalic = UIFont(name: "Roboto-LightItalic", size: 25)!
        static let regularItalic = UIFont(name: "Roboto-Italic", size: 25)!
        static let mediumItalic = UIFont(name: "Roboto-MediumItalic", size: 25)!
        static let boldItalic = UIFont(name: "Roboto-BoldItalic", size: 25)!
        static let blackItalic = UIFont(name: "Roboto-BlackItalic", size: 25)!
    }
    
    private static func registerRobotoFontsIfNeeded() {
        _ = UIFont.registerRobotoFonts
    }
    
    /// Roboto Font with specified Size
    public static func roboto(size: CGFloat, weight: Weight = .regular) -> UIFont {
        registerRobotoFontsIfNeeded()
        
        let font: UIFont = {
            switch weight {
            case .thin: return RobotoFont.thin
            case .ultraLight: return RobotoFont.light
            case .light: return RobotoFont.light
            case .regular: return RobotoFont.regular
            case .medium: return RobotoFont.medium
            case .semibold: return RobotoFont.medium
            case .bold: return RobotoFont.bold
            case .heavy: return RobotoFont.bold
            case .black: return RobotoFont.black
            
            default: return RobotoFont.regular
            }
        }()
        
        return font.withSize(size)
    }
    
    /// Roboto Italic Font with specified Size
    public static func robotoItalic(size: CGFloat, weight: Weight = .regular) -> UIFont {
        registerRobotoFontsIfNeeded()
        
        let font: UIFont = {
            switch weight {
            case .thin: return RobotoFont.thinItalic
            case .ultraLight: return RobotoFont.lightItalic
            case .light: return RobotoFont.lightItalic
            case .regular: return RobotoFont.regularItalic
            case .medium: return RobotoFont.mediumItalic
            case .semibold: return RobotoFont.mediumItalic
            case .bold: return RobotoFont.boldItalic
            case .heavy: return RobotoFont.boldItalic
            case .black: return RobotoFont.blackItalic
                
            default: return RobotoFont.regularItalic
            }
        }()
        
        return font.withSize(size)
    }
    
}

extension UIFont {
    
    /// Used to register available fonts
    public class func registerFont(withFilename filename: String, bundle: Bundle) throws {
        guard let pathForResourceString = bundle.path(forResource: filename, ofType: nil) else {
            throw NSError(domain: "Failed to register font - path for resource not found.", code: -1, userInfo: nil)
        }
        
        guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
            throw NSError(domain: "Failed to register font - font data could not be loaded.", code: -1, userInfo: nil)
        }
        
        guard let dataProvider = CGDataProvider(data: fontData) else {
            throw NSError(domain: "Failed to register font - data provider could not be loaded.", code: -1, userInfo: nil)
        }
        
        guard let fontRef = CGFont(dataProvider) else {
            throw NSError(domain: "Failed to register font - font could not be loaded.", code: -1, userInfo: nil)
        }
        
        var errorRef: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(fontRef, &errorRef)
        if let error = errorRef?.takeRetainedValue() {
            throw error
        }
    }
    
}

/// A class used to reference this bundle
class RobotoContext { }
