//
//  EmployeeFile.swift
//  Assignment2_EmployeeManagement
//
//  Created by William Liang on 2026-06-19.
//

import Foundation

class Employee
{
    var id: Int
    var name: String
    var salary: Double
    {
        return 0
    }
    
    init(id: Int, name: String, salary: Double) {
        self.id = id
        self.name = name
    }
    
    func displayDetails() -> String
    {
        return "ID: \(id) | Name: \(name) | Salary: \(salary)"
    }
}
