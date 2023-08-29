//
//  postClass.swift
//  LinkedIn
//
//  Created by TDI Student on 24.8.23.
//
// here it is created an data container Post for reusing after to create new posts in collection View
import Foundation
class Post {
    var Id: Int = 0
    var postImage:String = ""
    var profession:String = ""
    var description:String = ""
    var username:String=""
    var profileImage:String=""
    required init?() {
    
    }
    init(postImage: String, profession: String, description: String,username:String,profileImage:String,Id:Int) {
        self.postImage=postImage
        self.profession = profession
        self.description = description
        self.Id=Id;
        self.profileImage=profileImage
        self.username=username;
    }
}
