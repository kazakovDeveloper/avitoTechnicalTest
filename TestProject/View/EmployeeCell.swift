//
//  EmployeeCell.swift
//  TestProject
//
//  Created by Kazakov Danil on 26.10.2022.
//

import UIKit

final class EmployeeCell: UITableViewCell {
    
    static let identifer = "EmployeeCell"

    var employeeImageView = UIImageView()
    var employeeTitleLabel = UILabel()
    var employeePhoneLabel = UILabel()
    var employeeSkillsLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(employeeImageView)
        addSubview(employeeTitleLabel)
        addSubview(employeePhoneLabel)
        addSubview(employeeSkillsLabel)
        
        configureImageView()
        configureTitleLabel()
        configurePhoneNumber()
        configureSkills()
        
        setImageConstraints()
        setTitleLabelConstraints()
        setPhoneLabelConstraints()
        setSkillsLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(employee: Employee) {
        
        employeeImageView.image = UIImage(named: "Image")
        employeeTitleLabel.text = employee.name
        employeeTitleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        employeePhoneLabel.text = "Phone Number: " + employee.phoneNumber
        employeeSkillsLabel.text = "Current skills: " + employee.skills.joined(separator: ", ")
    }
    
    func configureImageView() {
        employeeImageView.layer.cornerRadius = 10
        employeeImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        employeeTitleLabel.numberOfLines = 0
        employeeTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configurePhoneNumber() {
        employeePhoneLabel.numberOfLines = 0
        employeePhoneLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configureSkills() {
        employeeSkillsLabel.numberOfLines = 0
        employeeSkillsLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        employeeImageView.translatesAutoresizingMaskIntoConstraints = false
        employeeImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        employeeImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        employeeImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        employeeImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setTitleLabelConstraints() {
        employeeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        employeeTitleLabel.leadingAnchor.constraint(equalTo: employeeImageView.trailingAnchor, constant: 20).isActive = true
        employeeTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        employeeTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        employeeTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    }
    
    func setPhoneLabelConstraints() {
        employeePhoneLabel.translatesAutoresizingMaskIntoConstraints = false
        employeePhoneLabel.leadingAnchor.constraint(equalTo: employeeImageView.trailingAnchor, constant: 20).isActive = true
        employeePhoneLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        employeePhoneLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        employeePhoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setSkillsLabelConstraints() {
        employeeSkillsLabel.translatesAutoresizingMaskIntoConstraints = false
        employeeSkillsLabel.leadingAnchor.constraint(equalTo: employeeImageView.trailingAnchor, constant: 20).isActive = true
        employeeSkillsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        employeeSkillsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        employeeSkillsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
}
