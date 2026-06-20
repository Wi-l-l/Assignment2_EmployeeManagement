//
//  main.swift
//  Assignment2_EmployeeManagement
//
//  Created by William Liang on 2026-06-19.
//  ID: 991 830 711
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
        print("\nAdding a Part-Time Employee...")
        addPartTimeEmployee()
    case "3":
        print("\nDisplaying Current Employees...")
        displayEmployees()
    case "4":
        print("\nRemoving an Employee...")
        removeEmployee()
    case "5":
        print("\nFinding an Employee...")
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

///Add a full-time employee to the employees dictionary
func addFullTimeEmployee()
{
    var newFullTimeEmployee: Employee
    
    print("\nEnter Employee ID:")
    var ftEmpID = readLine()!
    
    //Handle employee ID input verification
    while (ftEmpID.isEmpty) || (ftEmpID.trimmingCharacters(in: .whitespaces).isEmpty) || (employees.keys.contains(Int(ftEmpID)!))
    {
        //Check if the employee ID input was left blank
        if (ftEmpID.isEmpty) || (ftEmpID.trimmingCharacters(in: .whitespaces).isEmpty)
        {
            print("\nThe employee ID cannot be blank. Enter the employee ID here. Or enter a non-positive number to exit out: ")
            ftEmpID = readLine()!
        }
        
        //Check if the employee ID already belongs to an existing employee
        else if employees.keys.contains(Int(ftEmpID)!)
        {
            print("\nThis ID already belongs to an existing employee. Put a new ID here:")
            ftEmpID = readLine()!
        }
    }
    //Convert the validated string ID to an integer
    let fullTimeID = Int(ftEmpID)!
    
    //Proceed with adding other employee details, if the ID is a positive integer
    if fullTimeID > 0
    {
        print("\nEnter Employee Name:")
        var ftEmpName = readLine()!
        while (ftEmpName.isEmpty) || (ftEmpName.trimmingCharacters(in: .whitespaces).isEmpty)
        {
            print("\nEmployee name cannot be empty. Enter the employee's name:")
            ftEmpName = readLine()!
        }
        
        print("\nEnter Employee Monthly Salary:")
        var ftEmpSalary = Double(readLine()!)!
        while (ftEmpSalary <= 0) || (String(ftEmpSalary).isEmpty)
        {
            print("\nThe employee must have a monthly salary greater than $0. Enter the salary here:")
            ftEmpSalary = Double(readLine()!)!
        }
        
        newFullTimeEmployee = FullTimEmployee(id: fullTimeID, name: ftEmpName, monthlySalary: ftEmpSalary)
        employees[fullTimeID] = newFullTimeEmployee
    }
    
    //Return to main menu if the ID input is a non-positive integer
    else
    {
        print("\nReturning to main menu...")
        return
    }
}

/// Add a part-time employee to the employees dictionary
func addPartTimeEmployee()
{
    var newPartTimeEmp: Employee
    
    print("\nEnter Employee ID:")
    var ptEmpID = readLine()!
    
    //Handle employee ID input verification
    while (ptEmpID.isEmpty) || (ptEmpID.trimmingCharacters(in: .whitespaces).isEmpty) || (employees.keys.contains(Int(ptEmpID)!))
    {
        //Check if the employee ID input was left blank
        if (ptEmpID.isEmpty) || (ptEmpID.trimmingCharacters(in: .whitespaces).isEmpty)
        {
            print("\nThe employee ID cannot be blank. Enter the employee ID here. Or enter a non-positive number to exit out: ")
            ptEmpID = readLine()!
        }
        
        //Check if the employee ID already belongs to an existing employee
        else if employees.keys.contains(Int(ptEmpID)!)
        {
            print("\nThis ID already belongs to an existing employee. Put a new ID here:")
            ptEmpID = readLine()!
        }
    }
    //Convert the validated string ID to an integer
    let partTimeID = Int(ptEmpID)!
    
    //Proceed with adding other employee details, if the ID is a positive integer
    if partTimeID > 0
    {
        print("\nEnter Employee Name:")
        var ptEmpName = readLine()!
        while (ptEmpName.isEmpty) || (ptEmpName.trimmingCharacters(in: .whitespaces).isEmpty)
        {
            print("\nThe employee name cannot be empty. Enter the employee's name here:")
            ptEmpName = readLine()!
        }
        
        print("\nEnter Employee Hourly Rate:")
        var ptEmpHourlyRate = Double(readLine()!)!
        while ptEmpHourlyRate <= 0
        {
            print("\nThe employee must have an hourly rate greater than 0. Enter a new hourly rate here:")
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
    
    //Return to main menu if the ID input is a non-positive integer
    else
    {
        print("\nReturning to main menu...")
        return
    }
}

///Display all current employees in the employees dictionary by ascending ID
func displayEmployees()
{
    //Tell the user there are no employees in the system
    if employees.isEmpty
    {
        print("\nThere are currently no employees in the system. Please add employees first.")
    }
    //Display employees by employee ID ascending
    else
    {
        let sortedEmployees = employees.sorted(by: {$0.key < $1.key}).map({$0.value})
        
        print("\n--|Current Employees|--")
        for employee in sortedEmployees
        {
            print(employee.displayDetails())
        }
    }
    
}

///Remove an employee from the employees dictionary by ID
func removeEmployee()
{
    //Warn the user that there are no employees to remove
    if employees.isEmpty
    {
        print("\nThere are currently no employees in the system to remove.")
    }
    
    //Proceed, if there exist employees
    else
    {
        print("\nEnter employee ID:")
        var removeIDInput = readLine()!
        
        //Handle ID input validation cases
        while (!(employees.keys.contains(Int(removeIDInput)!)) || (removeIDInput.isEmpty) || (removeIDInput.trimmingCharacters(in: .whitespaces).isEmpty)) && !(Int(removeIDInput)! <= 0)
        {
            //Check if the employee ID input is left blank
            if (removeIDInput.isEmpty) || (removeIDInput.trimmingCharacters(in: .whitespaces).isEmpty)
            {
                print("\nThere cannot be a blank ID. Enter a non-blank employee ID here. Or type a non-positive number to return to the main menu:")
                removeIDInput = readLine()!
            }
            
            //Check if the employee ID does not belong to an existing employee
            else if !(employees.keys.contains(Int(removeIDInput)!)) && (Int(removeIDInput)! > 0)
            {
                print("\nThere is no employee with ID: \(removeIDInput). Enter a different ID. Or type a non-positive number to return to the main menu:")
                removeIDInput = readLine()!
            }
        }
        
        //Convert the validated string ID to an integer
        let idToRemove = Int(removeIDInput)!
        
        //Remove employee of the validated ID
        if idToRemove >= 0
        {
            print("\nRemoving employee with ID: \(idToRemove)")
            employees.removeValue(forKey: idToRemove)
            print("Employee successfully removed...")
        }
        
        //Return to main menu if the ID input is a non-positive integer
        else
        {
            print("\nReturning to main menu...")
        }
    }
}

///Search for a specific employee by ID
func findEmployee()
{
    //Warn the user that there are no employees to find
    if employees.isEmpty
    {
        print("\nThere are currently no employees in the system to find.")
    }
    
    //Proceed, if there exist employees
    else
    {
        print("\nEnter employee ID:")
        var findIDInput = readLine()!
        
        //Handle ID input validation cases
        while !(employees.keys.contains(Int(findIDInput)!) || (findIDInput.isEmpty) || (findIDInput.trimmingCharacters(in: .whitespaces).isEmpty)) && !(Int(findIDInput)! <= 0)
        {
            //Check if the employee ID input is left blank
            if (findIDInput.isEmpty) || (findIDInput.trimmingCharacters(in: .whitespaces).isEmpty)
            {
                print("\nThere cannot be a blank ID. Enter a non-blank employee ID here. Or type a non-positive number to return to the main menu:")
                findIDInput = readLine()!
            }
            
            //Check if the employee ID does not belong to an existing employee
            else if !(employees.keys.contains(Int(findIDInput)!)) && (Int(findIDInput)! > 0)
            {
                print("\nThere is no employee with ID: \(findIDInput). Enter a different ID. Or type a non-positive number to return to the main menu:")
                findIDInput = readLine()!
            }
        }
        
        //Convert the validated string ID to an integer
        let idToFind = Int(findIDInput)!
        
        //Find and display the employee with such ID
        if idToFind >= 0
        {
            print("\nLocating employee with ID: \(idToFind)")
            print(employees[idToFind]!.displayDetails())
        }
        
        //Return to main menu if the ID input is a non-positive integer
        else
        {
            print("Returning to main menu...")
        }
    }
}
