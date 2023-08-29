//
//  userClass.swift
//  LinkedIn
//
//  Created by TDI Student on 15.8.23.
//
// here is implemented the class Users which is data container of users and is used in other controller
import Foundation
import SwiftyJSON
class User{
    var Id: Int = 0
    var name:String = ""
    var email:String = ""
    var password:String = ""
    var gender:String=""
    static func validate(user: User) -> Bool {
            return user.Id > 0 && user.name.count > 8 && user.email.count > 8 && user.password.count > 8
        }
    static func createUser(json: JSON)-> User?{
         let user=User()
         if let id = json["id"].int{
             user.Id=id
         }
         if let name = json["username"].string{
             user.name=name
         }
         if let email = json["email"].string{
             user.email=email
         }
         if let password = json["password"].string{
             user.password=password
         }
        if let gender = json["gender"].string{
            user.gender=gender
        }
     return user
     }
    static func createUsers(jsonArray:[JSON])->[User]{
        var usersArray : [User]=[]
        for jsonObject in jsonArray{
            if let user = createUser(json: jsonObject){
                usersArray.append(user)
            }
        }
        return usersArray
    }
}
