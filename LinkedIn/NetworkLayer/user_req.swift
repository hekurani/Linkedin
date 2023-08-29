//
//  user_req.swift
//  LinkedIn
//
//  Created by TDI Student on 15.8.23.
//
import Foundation
import Alamofire
import SwiftyJSON
    // In this data container it is used to make FakeAPI requests which is used from different controllers.
class UserRequest{
    static func getUser(id:Int,completionHandler:
                  @escaping(_ employees:User?,_ error:Error?)->Void){
        let URLString="https://dummyjson.com/users/\(id)"
        AF.request(URLString,parameters:nil,encoding: JSONEncoding.default,headers:nil).responseJSON { response in
            switch response.result{
            case .success(let data):
                let dataJSON = JSON(data)
                if let user = User.createUser(json: dataJSON[]){
                    completionHandler(user,nil)
                }
                break
            case .failure(let error):
                completionHandler(nil,error)
                break;
            }
        }
        
    }
    static func getUsers(completionHandler: @escaping(_ users:[User],_ error: Error?)->Void){
        let URLString="https://dummyjson.com/users";
        AF.request(URLString,parameters:nil,encoding:JSONEncoding.default,headers:nil).responseJSON {response in
            switch response.result {
                
            case .success(let object):
              let objectJSON=JSON(object)
                if let dataArray = objectJSON["users"].array {
              
                    var usersArray: [User] = []
                    for userJSON in dataArray {
                     
                        if let user = User.createUser(json: userJSON) {
                            usersArray.append(user)
                            
                        }
                    }
                    completionHandler(usersArray, nil)
                }
            case .failure(let error):
                print("failure")
               completionHandler([],error)
            }
        }
    }
    static func createUsers(completionHandler:@escaping(_ user: User?, _ error:Error?)->Void){
        let URLString="https://dummyjson.com/users/add";
        let parameter: [String:Any]=["name":"John Doe","salary":"12030","age":"20"];
        AF.request(URLString,method:.post,parameters:parameter,encoding:JSONEncoding.default,headers:nil).responseJSON{response in
            switch response.result {
            case .success(let object):
                let objectJSON = JSON(object)
                print(objectJSON)
                if let user = User.createUser(json: objectJSON){
                    print(user.self)
                    completionHandler(user, nil)
                }
            case .failure(let error):
                completionHandler(nil,error)
            }
            
        }
    }
    static func getUserbyCredentials(username:String,password:String,completionHandler:
                  @escaping(_ employees:User?,_ error:Error?)->Void){
        let URLString="https://dummyjson.com/users/"
        AF.request(URLString,parameters:nil,encoding:JSONEncoding.default,headers:nil).responseJSON {response in
            switch response.result {
                
            case .success(let object):
              let objectJSON=JSON(object)
                if let dataArray = objectJSON["users"].array {
    
                    for userJSON in dataArray {
                        if let user = User.createUser(json: userJSON) {
                            if user.name==username && user.password==password {
                                completionHandler(user, nil);
                            }
                            
                           
                        }
                    }
                    completionHandler(nil, nil)
                    //completionHandler([], nil)
                }
            case .failure(let error):
                print("failure")
               //completionHandler(nil,error)
            }
        }

        
    }
    
}
