//
//  ViewController.swift
//  ios-uikit-uiprinterpickercontroller-demo
//
//  Created by Eiji Kushida on 2017/03/14.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapShowPrinter(_ sender: UIButton) {
        showPrinterPicker()
    }

    // UIPrinterPickerControllerをモーダル表示する
    func showPrinterPicker() {
        
        let printerPicker = UIPrinterPickerController(initiallySelectedPrinter: nil)
        printerPicker.present(animated: true, completionHandler: {
            
            [unowned self] printerPickerController, userDidSelect, error in
            
            if (error != nil) {
                print("Error : \(error)")
            } else {
                // 選択したUIPrinterを取得する
                if let printer: UIPrinter = printerPickerController.selectedPrinter {
                    print("Printer : \(printer.displayName)")
                    self.printToPrinter(printer: printer)
                } else {
                    print("Printer is not selected")
                }
            }
        })
    }

    // 印刷してみる
    func printToPrinter(printer: UIPrinter) {
        let printIntaractionController = UIPrintInteractionController.shared
        let info = UIPrintInfo(dictionary: nil)
        info.jobName = "Sample Print"
        info.orientation = .portrait
        printIntaractionController.printInfo = info
        printIntaractionController.printingItem = UIImage(named: "sample.jpg")
        printIntaractionController.print(to: printer, completionHandler: {
            controller, completed, error in
            
        })
    }
}

