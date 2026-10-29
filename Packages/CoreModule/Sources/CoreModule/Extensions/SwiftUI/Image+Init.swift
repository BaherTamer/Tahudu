//
//  Image+Init.swift
//  CoreModule
//
//  Created by Baher Tamer on 29/10/2026.
//

import SwiftUI

extension Image {
    /// Tries to use systemImage first, imageName second (looked up in `bundle`, the main bundle by default) and lastly uiImage.
    public init?(imageSystemName: String?, imageName: String?, bundle: Bundle? = nil, uiImage: UIImage? = nil) {
        if let imageSystemName = imageSystemName {
            self.init(systemName: imageSystemName)
        } else if let imageName = imageName {
            self.init(imageName, bundle: bundle)
        } else if let uiImage = uiImage {
            self.init(uiImage: uiImage)
        } else {
            return nil
        }
    }
}
