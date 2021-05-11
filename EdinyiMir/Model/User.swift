//
//  User.swift
//  EdinyiMir
//
//  Created by 18725610 on 10.05.2021.
//

import Foundation

struct User: Decodable {
    var lastName: String?
    var firstName: String?
    var otherName: String?
    var birthday: String?
    var phone: String?
    var email: String?
    var passportSeria: String?
    var passportNumber: String?
    var passportIssuedBy: String?
    var passportWhenIssued: String?
    var profilePhotoUrl: String?
    var passportCode: String?
    var passportFirstPageUrl: String?
    var passportSecondPageUrl: String?
    var vtekSeria: String?
    var vtekNumber: String?
    var vtekDate: String?
    var vtekFirstPhotoUrl: String?
    var vtekSecondPhotoUrl: String?
    var region: String?
    var confirmation: Bool
    var confirmationReason: String?
    var role: String
    
    init(lastName: String,
    firstName: String,
    otherName: String,
    birthday: String,
    phone: String,
    email: String,
    passportSeria: String,
    passportNumber: String,
    passportIssuedBy: String,
    passportWhenIssued: String,
    profilePhotoUrl: String,
    passportCode: String,
    passportFirstPageUrl: String,
    passportSecondPageUrl: String,
    vtekSeria: String,
    vtekNumber: String,
    vtekDate: String,
    vtekFirstPhotoUrl: String,
    vtekSecondPhotoUrl: String,
    region: String,
    confirmation: Bool,
    confirmationReason: String,
    role: String) {
        self.lastName = lastName
        self.firstName = firstName
        self.otherName = otherName
        self.birthday = birthday
        self.phone = phone
        self.email = email
        self.passportSeria = passportSeria
        self.passportNumber = passportNumber
        self.passportIssuedBy = passportIssuedBy
        self.passportWhenIssued = passportWhenIssued
        self.profilePhotoUrl = profilePhotoUrl
        self.passportCode = passportCode
        self.passportFirstPageUrl = passportFirstPageUrl
        self.passportSecondPageUrl = passportSecondPageUrl
        self.vtekSeria = vtekSeria
        self.vtekNumber = vtekNumber
        self.vtekDate = vtekDate
        self.vtekFirstPhotoUrl = vtekFirstPhotoUrl
        self.vtekSecondPhotoUrl = vtekSecondPhotoUrl
        self.region = region
        self.confirmation = confirmation
        self.confirmationReason = confirmationReason
        self.role = role
    }
}
