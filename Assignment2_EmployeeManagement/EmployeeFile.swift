//
//  EmployeeFile.swift
//  Assignment2_EmployeeManagement
//
//  Created by William Liang on 2026-06-19.
//

import Foundation

///Represents an employee in the employee management system
class Employee
{
    var id: Int
    var name: String
    var salary: Double
    {
        return 0
    }
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
    func displayDetails() -> String
    {
        return "ID: \(id) | Name: \(name) | Salary: \(salary)"
    }
}

class FullTimEmployee : Employee
{
    var monthlySalary: Double
    
    init(id: Int, name: String, monthlySalary: Double)
    {
        self.monthlySalary = monthlySalary
        super.init(id: id, name: name)
    }
    
    override var salary: Double
    {
        let annualSalary = 12 * monthlySalary
        return annualSalary
    }
}

class PartTimeEmployee : Employee
{
    var hourlyRate: Double
    var hoursWorked: Int
    
    init(id: Int, name: String, hourlyRate: Double, hoursWorked: Int) {
        self.hourlyRate = hourlyRate
        self.hoursWorked = hoursWorked
        super.init(id: id, name: name)
    }
    
    override var salary: Double
    {
        let annualSalary = hourlyRate * Double(hoursWorked) * 56
        return annualSalary
    }
}





