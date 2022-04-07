//
//  ViewController.swift
//  LoaderApp
//
//  Created by Роман Корсак on 4.04.22.
//

import NVActivityIndicatorView
import NVActivityIndicatorViewExtended
import UIKit

final class ViewController: UIViewController, NVActivityIndicatorViewable {
    let typesOfLoader: [String] = ["ballPulse", "ballSpinFadeLoader", "pacman", "circleStrokeSpin", "ballTrianglePath", "squareSpin"]
    
    @IBOutlet private var picker: UIPickerView!
    @IBOutlet private var textView: UITextView!
    @IBOutlet private var colorsSegmentControl: UISegmentedControl!
    @IBOutlet private var slider: UISlider!
    @IBOutlet private var sliderValueLabel: UILabel!
    
    private var widthAndHeightOfLoader: Int = 100
    private var caseOfLoader: NVActivityIndicatorType = .ballDoubleBounce
    private var textFromTextView: String = ""
    private var colorOfLoader: UIColor = .red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        colorsSegmentControl.addTarget(self, action: #selector(changeColorOfLoader), for: .valueChanged)
        colorsSegmentControl.selectedSegmentTintColor = .red
        slider.minimumValue = 100
        slider.maximumValue = 200
        textView.layer.cornerRadius = 15
    }
    // MARK: Functions and actions
    @IBAction private func buttonShowAnimation() {
        textFromTextView = textView.text
        
        startAnimating(CGSize(width: widthAndHeightOfLoader, height: widthAndHeightOfLoader), message: textFromTextView, type: caseOfLoader, color: colorOfLoader, textColor: colorOfLoader)
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) { [weak self] in
            self?.stopAnimating()
        }
    }
    
    @IBAction private func sliderAction() {
        let value = Int(round(slider.value))
        widthAndHeightOfLoader = value
        sliderValueLabel.text = "\(widthAndHeightOfLoader)"
    }
    
    @objc private func changeColorOfLoader() {
        switch colorsSegmentControl.selectedSegmentIndex {
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
}

// MARK: UIPickerViewDataSource, UIPickerViewDelegate

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
        switch typesOfLoader[row] {
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
