//
//  ViewController.swift
//  Counter
//
//  Created by Sagida on 25.02.2026.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    private var counterNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCounterLabel()
        
        historyTextView.text = "История изменений:\n"
    }

    @IBAction func incrementButtonTapped(_ sender: Any) {
        counterNumber += 1
        updateCounterLabel()
        updateHistory("значение изменено на +1")
        print("Increment button was tapped. Value: \(counterNumber)")
    }
    
    @IBAction func decrementButtonTapped(_ sender: Any) {
        if counterNumber > 0 {
            counterNumber -= 1
            updateHistory("значение изменено на -1")
        } else {
            updateHistory("попытка уменьшить значение счётчика ниже 0")
        }
        updateCounterLabel()
        print("Decrement button was tapped. Value: \(counterNumber)")
    }
    
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        counterNumber = 0
        updateCounterLabel()
        updateHistory("значение сброшено")
        print("Reset button was tapped. Value: \(counterNumber)")
    }
    
    private func updateCounterLabel() {
        counterLabel.text = "\(counterNumber)"
    }
    
    private func updateHistory(_ text: String) {
        let time = DateFormatter.localizedString(from: .now, dateStyle: .short, timeStyle: .short)
        historyTextView.text += "\(time): \(text)\n"
    }
    
}

