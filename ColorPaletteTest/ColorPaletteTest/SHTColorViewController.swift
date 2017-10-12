//
//  SHTColorViewController.swift
//  ColorPaletteTest
//
//  Created by  Tikhomirov on 12.10.17.
//  Copyright © 2017  Tikhomirov. All rights reserved.
//

import UIKit

class SHTColorViewController: UIViewController {
    
    public var colorState: UIColor = .gray
    public var colorNew: UIColor = .gray

    @IBOutlet weak var sliderR: UISlider!
    @IBOutlet weak var sliderG: UISlider!
    @IBOutlet weak var sliderB: UISlider!
    @IBOutlet weak var sliderA: UISlider!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var labelR: UILabel!
    @IBOutlet weak var labelG: UILabel!
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var valueLabelR: UILabel!
    @IBOutlet weak var valueLabelG: UILabel!
    @IBOutlet weak var valueLabelB: UILabel!
    @IBOutlet weak var valueLabelA: UILabel!
    @IBOutlet weak var colorStateView: UIView!
    @IBOutlet weak var colorNewView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(sliderView.frame)
        sliderTransform(sender: sliderR, index: 0)
        sliderTransform(sender: sliderG, index: 1)
        sliderTransform(sender: sliderB, index: 2)
        sliderTransform(sender: sliderA, index: 3)
        colorNew = colorState
        drawColor()
        setSliderPosition((R:5, G:6, B:7, A:8))
    }
    
    private func sliderTransform( sender: UISlider, index: Int) {
        if sender.isKind(of: UISlider.self) {
            sender.transform = CGAffineTransform(rotationAngle: CGFloat( .pi * -0.5))
            sender.frame = CGRect(x: sliderView.frame.width - 145.0 + CGFloat(index) * 35.0, y: 30.0, width: 30.0, height: sliderView.frame.height - 60)
            print(sender.frame)
        }
        switch index {
        case 0:
            labelR.frame = CGRect(x: sliderView.frame.width - 135.0 + CGFloat(index) * 35.0, y: 8.0, width: 30.0, height: 30.0)
            valueLabelR.frame = CGRect(x: sliderView.frame.width - 140.0 + CGFloat(index) * 35.0, y: sliderView.frame.height - 30.0, width: 30.0, height: 30.0)
        case 1:
            labelG.frame = CGRect(x: sliderView.frame.width - 135.0 + CGFloat(index) * 35.0, y: 8.0, width: 30.0, height: 30.0)
            valueLabelG.frame = CGRect(x: sliderView.frame.width - 140.0 + CGFloat(index) * 35.0, y: sliderView.frame.height - 30.0, width: 30.0, height: 30.0)
        case 2:
            labelB.frame = CGRect(x: sliderView.frame.width - 135.0 + CGFloat(index) * 35.0, y: 8.0, width: 30.0, height: 30.0)
            valueLabelB.frame = CGRect(x: sliderView.frame.width - 140.0 + CGFloat(index) * 35.0, y: sliderView.frame.height - 30.0, width: 30.0, height: 30.0)
        default:
            labelA.frame = CGRect(x: sliderView.frame.width - 135.0 + CGFloat(index) * 35.0, y: 8.0, width: 30.0, height: 30.0)
            valueLabelA.frame = CGRect(x: sliderView.frame.width - 140.0 + CGFloat(index) * 35.0, y: sliderView.frame.height - 30.0, width: 30.0, height: 30.0)
        }
    }
    
    @IBAction func sliderAction(_ sender: Any) {
        if let slider = sender as? UISlider {
            switch slider.tag {
            case 0:
                valueLabelR.text = String(Int(slider.value))
            case 1:
                valueLabelG.text = String(Int(slider.value))
            case 2:
                valueLabelB.text = String(Int(slider.value))
            default :
                valueLabelA.text = String(Int(slider.value))
            }
        }
    }
    
    private func drawColor() {
        colorStateView.backgroundColor = colorState
        colorNewView.backgroundColor = colorNew
    }
    
    private func setSliderPosition(_ color:(R:Int, G:Int, B:Int, A:Int)) {
        sliderR.value = Float(color.R)
        sliderG.value = Float(color.G)
        sliderB.value = Float(color.B)
        sliderA.value = Float(color.A)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
