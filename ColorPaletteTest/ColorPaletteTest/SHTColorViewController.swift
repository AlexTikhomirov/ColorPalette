//
//  SHTColorViewController.swift
//  ColorPaletteTest
//
//  Created by  Tikhomirov on 12.10.17.
//  Copyright © 2017  Tikhomirov. All rights reserved.
//

import UIKit

class SHTColorViewController: UIViewController, colorDelegate {
    
    public var colorState: UIColor = .black
    public var colorNew: UIColor = .gray
    //MARK: - Outlets
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
    @IBOutlet weak var colorPicker: ColorPicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderTransform(sender: sliderR, index: 0)
        sliderTransform(sender: sliderG, index: 1)
        sliderTransform(sender: sliderB, index: 2)
        sliderTransform(sender: sliderA, index: 3)
        colorPicker.delegate = self;
        colorNew = colorState
        drawColor()
        setSliderPosition(convertColor(colorState))
    }
    //MARK: - Slider Transform
    private func sliderTransform( sender: UISlider, index: Int) {
        if sender.isKind(of: UISlider.self) {
            sender.transform = CGAffineTransform(rotationAngle: CGFloat( .pi * -0.5))
            sender.frame = CGRect(x: sliderView.frame.width - 145.0 + CGFloat(index) * 35.0, y: 30.0, width: 30.0, height: sliderView.frame.height - 60)
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
    
    private func setSliderPosition(_ color:(r:Int, g:Int, b:Int, a:Int)) {
        sliderR.value = Float(color.r)
        sliderG.value = Float(color.g)
        sliderB.value = Float(color.b)
        sliderA.value = Float(color.a)
    }
    //MARK: - Action
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
            colorNew = colorSliderToUIColor()
            drawColor()
        }
    }
    
    @IBAction func doneAction(_ sender: Any) {
        colorState = colorNew
        if let vc = navigationController?.viewControllers[0] as? ViewController {
                vc.colorView.backgroundColor = colorState
        }
        navigationController?.popViewController(animated: true)
    }
    //MARK: - Color funtion
    private func drawColor() {
        colorStateView.backgroundColor = colorState
        colorNewView.backgroundColor = colorNew
    }
    
    private func convertColor(_ color: UIColor) -> (r:Int, g:Int, b:Int, a:Int) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        if color.getRed(&r, green: &g, blue: &b, alpha: &a){
            return (r: Int(r * 255), g: Int(g * 255), b: Int(b * 255), a: Int(a * 255))
        }
        return (r: 255, g: 0, b: 255, a: 255)
    }
    
    private func colorSliderToUIColor() -> UIColor {
        let r = CGFloat(sliderR.value / 255)
        let g = CGFloat(sliderG.value / 255)
        let b = CGFloat(sliderB.value / 255)
        let a = CGFloat(sliderA.value / 255)
        let color = UIColor(red: r, green: g, blue: b, alpha: a)
        return color
    }
    
    func pickedColor(color: UIColor) {
        setSliderPosition(convertColor(color))
        valueLabelR.text = String(Int(sliderR.value))
        valueLabelG.text = String(Int(sliderG.value))
        valueLabelB.text = String(Int(sliderB.value))
        valueLabelA.text = String(Int(sliderA.value))
        colorNew = color
        drawColor()
    }
}
