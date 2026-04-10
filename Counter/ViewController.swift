//
//  ViewController.swift
//  Counter
//
//  Created by Sagida on 25.02.2026.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    
    private var counterNumber = 0
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        updateCounterLabel()
        historyTextView.text = "История изменений:\n"
    }
    
    private func updateCounterLabel() {
        counterLabel.text = "\(counterNumber)"
    }
    
    private func updateHistory(_ text: String) {
        let time = dateFormatter.string(from: Date())
        historyTextView.text += "\(time): \(text)\n"
        scrollHistoryToBottom()
    }
    
    private func scrollHistoryToBottom() {
        let bottom = NSRange(
            location: historyTextView.text.count - 1,
            length: 1
        )
        historyTextView.scrollRangeToVisible(bottom)
    }
    
    @IBAction private func incrementButtonTapped(_ sender: Any) {
        counterNumber += 1
        updateCounterLabel()
        updateHistory("значение изменено на +1")
    }
    
    @IBAction private func decrementButtonTapped(_ sender: Any) {
        if counterNumber > 0 {
            counterNumber -= 1
            updateHistory("значение изменено на -1")
        } else {
            updateHistory("попытка уменьшить значение счётчика ниже 0")
        }
        updateCounterLabel()
    }
    
    @IBAction private func resetButtonTapped(_ sender: Any) {
        counterNumber = 0
        updateCounterLabel()
        updateHistory("значение сброшено")
    }
}

