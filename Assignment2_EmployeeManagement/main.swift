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
    var ftEmpID = readLine()!
    
    //Continue checking if the employee
    while (ftEmpID.isEmpty) || (ftEmpID.trimmingCharacters(in: .whitespaces).isEmpty) || (employees.keys.contains(Int(ftEmpID)!))
    {
        if (ftEmpID.isEmpty) || (ftEmpID.trimmingCharacters(in: .whitespaces).isEmpty)
        {
            print("\nThe employee ID cannot be blank. Enter the employee ID here. Or enter a non-positive number to exit out: ")
            ftEmpID = readLine()!
        }
        else if employees.keys.contains(Int(ftEmpID)!)
        {
            print("\nThis ID already belongs to an existing employee. Put a new ID here:")
            ftEmpID = readLine()!
        }
    }
    let fullTimeID = Int(ftEmpID)!
    
    if fullTimeID > 0
    {
        print("\nEnter Employee Name:")
        var ftEmpName = readLine()!
        while (ftEmpName.isEmpty) || (ftEmpName.trimmingCharacters(in: .whitespaces).isEmpty)
        {
            print("Employee name cannot be empty. Enter the employee's name:")
            ftEmpName = readLine()!
        }
        
        print("\nEnter Employee Monthly Salary:")
        var ftEmpSalary = Double(readLine()!)!
        while (ftEmpSalary <= 0) || (String(ftEmpSalary).isEmpty)
        {
            print("The employee must have a monthly salary greater than $0. Enter the salary here:")
            ftEmpSalary = Double(readLine()!)!
        }
        
        newFullTimeEmployee = FullTimEmployee(id: fullTimeID, name: ftEmpName, monthlySalary: ftEmpSalary)
        employees[fullTimeID] = newFullTimeEmployee
    }
    else
    {
        print("\nReturning to main menu...")
        return
    }
}

//TODO: Add a part-time employee
//TODO: Implement add part-time employee validation
func addPartTimeEmployee()
{
    var newPartTimeEmp: Employee
    
    print("\nEnter Employee ID:")
    var ptEmpID = readLine()!
    
    while (ptEmpID.isEmpty) || (ptEmpID.trimmingCharacters(in: .whitespaces).isEmpty) || (employees.keys.contains(Int(ptEmpID)!))
    {
        if (ptEmpID.isEmpty) || (ptEmpID.trimmingCharacters(in: .whitespaces).isEmpty)
        {
            print("\nThe employee ID cannot be blank. Enter the employee ID here. Or enter a non-positive number to exit out: ")
            ptEmpID = readLine()!
        }
        else if employees.keys.contains(Int(ptEmpID)!)
        {
            print("\nThis ID already belongs to an existing employee. Put a new ID here:")
            ptEmpID = readLine()!
        }
    }
    let partTimeID = Int(ptEmpID)!
    
    if partTimeID > 0
    {
        print("\nEnter Employee Name:")
        var ptEmpName = readLine()!
        while (ptEmpName.isEmpty) || (ptEmpName.trimmingCharacters(in: .whitespaces).isEmpty)
        {
            print("The employee name cannot be empty. Enter the employee's name here:")
            ptEmpName = readLine()!
        }
        
        print("\nEnter Employee Hourly Rate:")
        var ptEmpHourlyRate = Double(readLine()!)!
        while ptEmpHourlyRate <= 0
        {
            print("The employee must have an hourly rate greater than 0. Enter a new hourly rate here:")
            ptEmpHourlyRate = Double(readLine()!)!
        }
        
        print("\nEnter Employee Hours Worked:")
        var ptEmpWorkHours = Int(readLine()!)!
        while ptEmpWorkHours <= 0
        {
            print("\nThe employee must work more than 0 hours. \nEnter the hours worked:")
            ptEmpWorkHours = Int(readLine()!)!
        }
        
        newPartTimeEmp = PartTimeEmployee(id: partTimeID, name: ptEmpName, hourlyRate: ptEmpHourlyRate, hoursWorked: ptEmpWorkHours)
        employees[partTimeID] = newPartTimeEmp
    }
    else
    {
        print("\nReturning to main menu...")
        return
    }
}

//TODO: Display all employees
func displayEmployees()
{
    if employees.isEmpty
    {
        print("\nThere are currently no employees in the system. Please add employees first.")
    }
    else
    {
        print("\n--|Current Employees|--")
        for employee in employees.values{
            print(employee.displayDetails())
        }
    }
    
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


