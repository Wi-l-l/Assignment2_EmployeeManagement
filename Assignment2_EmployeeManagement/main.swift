//
//  main.swift
//  Assignment2_EmployeeManagement
//
//  Created by William Liang on 2026-06-19.
//

import Foundation
var employees: [Int:Employee] = [:]
var toContinue = true

//Continue running the program until the user chooses to exit
while toContinue
{
    menu()
    let input = readLine()!
    
    switch input
    {
    case "1":
        print("\nAdding a Full-Time Employee...")
        addFullTimeEmployee()
    case "2":
        addPartTimeEmployee()
    case "3":
        displayEmployees()
    case "4":
        removeEmployee()
    case "5":
        findEmployee()
    case "6":
        print("Exiting the program...")
        toContinue = false
    default:
        print("\nInvalid choice. Please select a valid option from the menu")
    }
}

///Main menu of the employees management console
func menu()
{
    print("\n=== Employee Management System ==="
        + "\nPlease select one of the following options"
        + "\n1. Add a Full-Time Employee"
        + "\n2. Add a Part-Time Employee"
        + "\n3. Display All Employees"
        + "\n4. Remove an employee by ID"
        + "\n5. Search for an employee by ID"
        + "\n6. Exit"
        + "\n\nEnter your option:")
}

//Add a full-time employee
//TODO: Implement add full-time employee validation
func addFullTimeEmployee()
{
    var newFullTimeEmployee: Employee
    
    print("\nEnter Employee ID:")
    var ftEmpID = Int(readLine()!)!
    
    print("\nEnter Employee Name:")
    var ftEmpName = readLine()!
    
    print("\nEnter Employee Monthly Salary:")
    var ftEmpSalary = Double(readLine()!)!
    
    newFullTimeEmployee = FullTimEmployee(id: ftEmpID, name: ftEmpName, monthlySalary: ftEmpSalary)
    employees[ftEmpID] = newFullTimeEmployee
    
    //for (id, employee) in employees{
    //    print(employee.displayDetails())
    //}
}

//TODO: Add a part-time employee
//TODO: Implement add part-time employee validation
func addPartTimeEmployee()
{
    var newPartTimeEmp: Employee
    
    print("\nEnter Employee ID:")
    var ptEmpID = Int(readLine()!)!
    
    print("\nEnter Employee Name:")
    var ptEmpName = readLine()!
    
    print("\nEnter Employee Hourly Rate:")
    var ptEmpHourlyRate = Double(readLine()!)!
    
    print("\nEnter Employee Hours Worked:")
    var ptEmpWorkHours = Int(readLine()!)!
    
    newPartTimeEmp = PartTimeEmployee(id: ptEmpID, name: ptEmpName, hourlyRate: ptEmpHourlyRate, hoursWorked: ptEmpWorkHours)
    employees[ptEmpID] = newPartTimeEmp
    
    //for (id, employee) in employees{
    //    print(employee.displayDetails())
    //}
}

//TODO: Display all employees
func displayEmployees()
{
    //
}

//TODO: Remove an employee by ID
func removeEmployee()
{
    //
}

//TODO: Search for an employee by ID
func findEmployee()
{
    //
}


