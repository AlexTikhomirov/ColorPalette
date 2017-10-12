//
//  ViewController.swift
//  ColorPaletteTest
//
//  Created by  Tikhomirov on 12.10.17.
//  Copyright © 2017  Tikhomirov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var colorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SHTColorViewController {
            if let color = colorView.backgroundColor {
                vc.colorState = color
            }
        }
    }
}

