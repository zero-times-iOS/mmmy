//
//  LoadStoryBoardUntils.swift
//  mmmy
//
//  Created by 叶长生 on 2018/11/27.
//  Copyright © 2018 Hoa. All rights reserved.
//
//  The Utils to load ViewController from stroyboard
//

import UIKit

public class LoadStoryBoardUntils
{

    /// Load a UIViewController from storyboard bundle.
    ///
    /// This method returns a UIViewController..
    ///
    /// - parameter storyBoardIdentifier: The storyBoard identifier used to load UIStoryboard.
    /// - parameter viewControllerIdentifier: The UIViewController Identifier used to load UIViewController from storyboard.
    /// - returns: A UIViewController.
    public static func loadViewController(_ storyBoardIdentifier: String, with viewControllerIdentifier: String) -> UIViewController {
        
        return UIStoryboard.init(name: storyBoardIdentifier, bundle: Bundle.main).instantiateViewController(withIdentifier: viewControllerIdentifier)
    }
    
}
