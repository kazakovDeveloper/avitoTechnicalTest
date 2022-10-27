//
//  GettingData.swift
//  TestProject
//
//  Created by Kazakov Danil on 26.10.2022.
//

import Foundation
import UIKit

protocol EmployeePresenterDelegate: AnyObject {
    func presentEmployees(employees: [Employee])
}

typealias PresenterDelegate = EmployeePresenterDelegate & UIViewController

final class EmployeePresenter {
    
    private weak var delegate: PresenterDelegate?
    private let cacheData = UserDefaultsService.shared
    
    public func getModelData() {
        if cacheData.saveDate.timeIntervalSinceNow > 3600 {
            guard let url = URL(string: "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c")else { return }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                do {
                    let modelData = try JSONDecoder().decode(ModelData.self, from: data)
                    self.cacheData.companyData = data
                    self.cacheData.saveDate = Date()
                    self.delegate?.presentEmployees(employees: modelData.company.employees.sorted(by: { $0.name < $1.name }))
                } catch {
                    print(error.localizedDescription)
                }
            }
            task.resume()
        } else {
            do {
                let employers = try JSONDecoder().decode(ModelData.self, from: cacheData.companyData).company.employees
                delegate?.presentEmployees(employees: employers.sorted(by: { $0.name < $1.name }))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
}
