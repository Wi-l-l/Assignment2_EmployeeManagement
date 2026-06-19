//
//  main.swift
//  Assignment2_EmployeeManagement
//
//  Created by William Liang on 2026-06-19.
//

import Foundation
var employees: [Int:Employee] = [:]
var toContinue = true
while toContinue
{
    menu()
    let input = readLine()!
    
    switch input
    {
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
