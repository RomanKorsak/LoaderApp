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
    
    let typesOfLoader: [String] = ["ballPulse", "ballSpinFadeLoader", "pacman", "circleStrokeSpin", "ballTrianglePath"]
    
    @IBOutlet var picker: UIPickerView!
    
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }

    @IBAction func buttonShowAnimation() {
        startAnimating(type: .ballBeat)
        
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
        myLabel.text = typesOfLoader[row]
    }
}
