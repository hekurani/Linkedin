//
//  HomeViewController.swift
//  LinkedIn
//
//  Created by TDI Student on 10.8.23.
//

import UIKit
// In this controller is implemented teh collectoon view and is used for showing posts in an vertical view
class HomeViewController: UIViewController {
    let viewControllerID="PostCollectionViewCell";
    @IBOutlet weak var collectionView: UICollectionView!
    var receivedUsername: String? 
    var Posts=[Post]()
    @IBOutlet weak var profileImage: UIImageView!
    var gender:String="";
    @IBOutlet weak var username: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username.text=receivedUsername
        profileImage.image=UIImage(named:gender)
        // Do any additional setup after loading the view.
        let nibcell = UINib(nibName:viewControllerID,bundle:nil)
        collectionView.register(nibcell,forCellWithReuseIdentifier:viewControllerID)
       reloadData()
    }
    
    func reloadData(){
        let newPosts = [
            Post(postImage:"post1", profession:"Doctor",description: "Hello, I want to announce that I started a new position as an intern. Come on, say congrats!",username: "James",profileImage: "profile1", Id:1),
            Post(postImage:"post2", profession:"Engineer",description: "Hello, I want to announce that I started a new position as an intern. Come on, say congrats!",username: "John",profileImage: "profile2", Id:2),
            Post(postImage:"post3", profession:"BioChemist",description: "Hello, I want to announce that I started a new position as an intern. Come on, say congrats!",username: "Ora",profileImage: "profile3", Id:3),
            Post(postImage:"post4", profession:"Civil Engineer",description: "Hello, I want to announce that I started a new position as an intern. Come on, say congrats!",username:"Endrit",profileImage:"profile4", Id:4),
            Post(postImage:"post5", profession:"Doctor",description: "Hello, I want to announce that I started a new position as an intern. Come on, say congrats!",username:"Ajla",
                 profileImage:"profile5",Id:5),
            Post(postImage:"post6", profession:"Engineer",description: "Hello, I want to announce that I started a new position as an intern. Come on, say congrats!",username:"Dua",profileImage:"profile6", Id:6),
            Post(postImage:"post7", profession:"BioChemist",description: "Hello, I want to announce that I started a new position as an intern. Come on, say congrats!",username:"Rea",profileImage:"profile7", Id:7),
            Post(postImage:"post8", profession:"Civil Engineer",description: "Hello, I want to announce that I started a new position as an intern. Come on, say congrats!",username:"Nihan",profileImage: "profile8", Id:8)
               ]
        Posts.append(contentsOf: newPosts)
        collectionView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
// Here it is implemented the protocols to use collection View.
extension HomeViewController:UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Posts.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            let inset:CGFloat = 10
            return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: UIScreen.main.bounds.width,height:450)
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewControllerID, for: indexPath) as! PostCollectionViewCell
            let post = Posts[indexPath.row]
//            cell.postImage.image = UIImage(named: "logo")
            cell.postDescription.text=post.description
            cell.Username.text=post.username
            cell.profileImage.image=UIImage(named:"logo")
            cell.postImage.image=UIImage(named:post.postImage)
            cell.userProfession.text=post.profession
            cell.profileImage.image=UIImage(named:post.profileImage)
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let post = Posts[indexPath.row]
            print("\(indexPath.row) - \(post.description)")
        }
}
