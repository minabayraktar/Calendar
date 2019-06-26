//
//  MonthView.swift
//  Calendar
//
//  Created by Apple on 6/26/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
protocol MonthViewDelegate: class{
    func didChangeMonth(monthIndex: Int, year: Int)
}
class MonthView: UIView {
    var monthsArr = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    var currentMonthIndex = 0
    var currentYear: Int = 0
    var delegate: MonthViewDelegate?
    override init (frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
        
        setupViews()
        
        btnLeft.isEnabled=false
        }
    @objc func btnLeftRightAction(sender: UIButton){
        if sender == btnRight{
            currentMonthIndex += 1
            if currentMonthIndex > 11{
                currentMonthIndex = 0
                currentYear += 1
                
            }
            
        } else {
            currentMonthIndex -= 1
            if currentMonthIndex < 0 {
                currentMonthIndex = 11
                currentYear -= 1
            }
            
        }
        lblName.text="\(monthsArr[currentMonthIndex]) \(currentYear)"delegate?.didChangeMonth(monthIndex: currentMonthIndex, year: currentYear)
    }
    func setupViews() {
        self.addSubview(lblName)
        lblName.topAnchor.constraint(equalTo: topAnchor).isActive=true
        lblName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive=true
        
        lblName.widthAnchor.constraint(equalToConstant: 150).isActive=true
        
        lblName.heightAnchor.constraint(equalTo: heightAnchor).isActive=true
        
            lblName.text="\(monthsArr[currentMonthIndex])\(currentYear)"
        
        self.addSubview(btnRight)
        btnRight.topAnchor.contraint(equalTo: topAnchor).isActive=true
        
    btnRight.rightAnchor.contraint(equalTo: rightAnchor).isActive=true
        
    btnRight.widthAnchor.contraint(equalToConstant:50).isActive=true
        
         btnRight.heightAnchor.contraint(equalTo: heightAnchor).isActive=true
        
        self.addSubview(btnLeft)
        btnLeft.topAnchor.contraint(equalTo: topAnchor).isActive=true

        btnLeft.leftAnchor.contraint(equalTo: leftAnchor).isActive=true
        
        btnLeft.widthAnchor.contraint(equalToConstant:50).isActive=true
        
        btnLeft.heightAnchor.contraint(equalTo: heightAnchor).isActive=true
        }
    let lblName: UILabel = {
        let lbl=UILabel()
        lbl.text="Default Month Year text"
        lbl.textColor = Style.monthViewLblColor
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
        
    }()
    let btnRight: UIButton = {
        let btn = UIButton()
        btn.setTitle(">", for: .normal)
        btn.setTitleColor(Style.monthViewBtnRightColor, for: .normal)
        btn.traslantesAutoresizingMaskIntoConstraints=false
        
        btn.addTarget(self, action: #selector(btnLeftRightAction(sender:)),for: .touchUpInside)
        return btn
        
    }()
    let btnLeft: UIButton = {
let btn = UIButton()
        btn.setTitle("<", for: .normal)
btn.setTitleColor(Style.monthViewBtnLeftColor, for: .normal)
btn.traslantesAutoresizingMaskIntoConstraints=false
btn.addTarget(self, action: #selector(btnLeftRightAction(sender:)),for: .touchUpInside)
btn.setTitleColor(UIColor.lightGray, for: .disabled)
        return btn
    }()
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implented")
    }
}
