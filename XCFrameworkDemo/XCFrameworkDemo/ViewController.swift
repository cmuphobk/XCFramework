//
//  ViewController.swift
//  XCFrameworkDemo
//
//  Created by docdoc on 17.05.2022.
//

import UIKit
import XCFramework

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        XCFrameworkLocator.doWork()
        let locator = XCFrameworkLocator.init()
        locator.doWork()
    }
}

