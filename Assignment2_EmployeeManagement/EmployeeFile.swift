//
//  EmployeeFile.swift
//  Assignment2_EmployeeManagement
//
//  Created by William Liang on 2026-06-19.
//  ID: 991 830 711
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
    
    ///Display employee details in a readable format
    func displayDetails() -> String
    {
        return "ID: \(id) | Name: \(name) | Salary: \(salary)"
    }
}

///Represents a Full-Time Employee
class FullTimEmployee : Employee, Taxable
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
    
    override func displayDetails() -> String {
        return "ID: \(id) | Name: \(name) | Annual Salary: \(String(format: "%.2f", salary)) | Tax: \(String(format: "%.2f", calculateTax()))"
    }
    
    ///Calculate income tax of a full-time employee
    func calculateTax() -> Double {
        return 0.15 * salary
    }
}

///Represents a Part-Time Employee
class PartTimeEmployee : Employee, Taxable
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
    
    override func displayDetails() -> String {
        return "ID: \(id) | Name: \(name) | Annual Salary: \(String(format: "%.2f", salary)) | Tax: \(String(format: "%.2f", calculateTax()))"
    }
    
    ///Calculate income tax ofa a part-time employee
    func calculateTax() -> Double {
        return 0.1 * salary
    }
}

///Protocol to calculate income tax, based on the employee's salary
protocol Taxable
{
    func calculateTax() -> Double
}
