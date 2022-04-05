//
//  ViewController.swift
//  LoaderApp
//
//  Created by Роман Корсак on 4.04.22.
//

import NVActivityIndicatorView
import NVActivityIndicatorViewExtended
import UIKit

class ViewController: UIViewController, NVActivityIndicatorViewable {
    
    let typesOfLoader: [String] = ["ballPulse", "ballSpinFadeLoader", "pacman", "circleStrokeSpin", "ballTrianglePath", "squareSpin"]
    
    
    
    
    @IBOutlet var picker: UIPickerView!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var colorsSegmentControl: UISegmentedControl!
    
    var caseOfLoader: NVActivityIndicatorType = .ballDoubleBounce
    var textFromTextView: String = ""
    var colorOfLoader: UIColor = .red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        colorsSegmentControl.addTarget(self, action: #selector(self.changeColorOfLoader), for: .valueChanged)
        colorsSegmentControl.selectedSegmentTintColor = .red
    }
    
    
    @objc func changeColorOfLoader(){
        switch colorsSegmentControl.selectedSegmentIndex{
        case 0:
            colorOfLoader = .red
        case 1:
            colorOfLoader = .blue
        case 2:
            colorOfLoader = .green
        case 3:
            colorOfLoader = .orange
        case 4:
            colorOfLoader = .darkGray
        default:
            colorOfLoader = .red
        }
        colorsSegmentControl.selectedSegmentTintColor = colorOfLoader
    }

    @IBAction func buttonShowAnimation() {
        
        textFromTextView = textView.text
        
        startAnimating( message: textFromTextView, type: caseOfLoader, color: colorOfLoader, textColor: colorOfLoader) /*,padding: <#T##CGFloat?#>, displayTimeThreshold: <#T##Int?#>, minimumDisplayTime: <#T##Int?#>, backgroundColor: <#T##UIColor?#>, , fadeInAnimation: <#T##FadeInAnimation?##FadeInAnimation?##(UIView) -> Void#>)*/
        
        
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { [weak self] in
            self?.stopAnimating()
        }
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        typesOfLoader.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return typesOfLoader[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch typesOfLoader[row]{
        case "ballPulse":
            caseOfLoader = .ballPulse
        case "ballSpinFadeLoader":
            caseOfLoader = .ballSpinFadeLoader
        case "pacman":
            caseOfLoader = .pacman
        case "circleStrokeSpin":
            caseOfLoader = .circleStrokeSpin
        case "ballTrianglePath":
            caseOfLoader = .ballTrianglePath
        case "squareSpin":
            caseOfLoader = .squareSpin
        default:
            caseOfLoader = .ballDoubleBounce
        }
        
    }
}
