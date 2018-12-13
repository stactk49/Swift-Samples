//
//  SecurityQuestionPopoverViewController.swift
//  DHMyHome
//
//  Created by tstachowski on 9/22/17.
//  Copyright © 2017 Jak Jonnalagadda. All rights reserved.
//

import UIKit

class SecurityQuestionPopoverViewController: UIViewController {
    
    @IBOutlet weak var lblCheckChars: UILabel!
    @IBOutlet weak var lblCheckQuestion: UILabel!
    @IBOutlet weak var lblCheckUsername: UILabel!
    @IBOutlet weak var lblCheckPassword: UILabel!
    
    @IBOutlet weak var lblTextChars: UILabel!
    @IBOutlet weak var lblTextQuestion: UILabel!
    @IBOutlet weak var lblTextUsername: UILabel!
    @IBOutlet weak var lblTextPassword: UILabel!
    
    var lengthOfSecurityAnswer:Int!
    var username:String!
    var password:String!
    var answer:String!
    var initArray:Int!
    var matchFound:Bool = false
    let arrIllegalAnswers = ["movie", "favorite movie", "quote", "cook", "learned", "job", "dream job", "dream", "spouse", "vacation", "sports player", "player"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        // Do any additional setup after loading the view.
        for index in (0...arrIllegalAnswers.count - 1) {
            if(arrIllegalAnswers[index] == answer) {
                print(arrIllegalAnswers[index])
                print(answer)
                return matchFound = true
            }
            else {
                matchFound = false
            }
            print(matchFound)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AnalyticsHelper.shared.autoTrackVC(vcName: UtilityMethods.classNameAsString(obj: SecurityQuestionPopoverViewController.self))
        
        if(lengthOfSecurityAnswer > 3) {
            lblCheckChars.text = "✓"
            lblCheckChars.textColor = UIColor.lightGray
            lblTextChars.textColor = UIColor.lightGray
        }
        else {
            lblCheckChars.text = "•"
            lblCheckChars.textColor = UIColor.white
            lblTextChars.textColor = UIColor.white
        }
        
        if(matchFound == false) {
            lblCheckQuestion.text = "✓"
            lblCheckQuestion.textColor = UIColor.lightGray
            lblTextQuestion.textColor = UIColor.lightGray
        }
        else {
            lblCheckQuestion.text = "•"
            lblCheckQuestion.textColor = UIColor.white
            lblTextQuestion.textColor = UIColor.white
        }
        if(answer != username) {
            lblCheckUsername.text = "✓"
            lblCheckUsername.textColor = UIColor.lightGray
            lblTextUsername.textColor = UIColor.lightGray
        }
        else {
            lblCheckUsername.text = "•"
            lblCheckUsername.textColor = UIColor.white
            lblTextUsername.textColor = UIColor.white
        }
        if(answer != password) {
            lblCheckPassword.text = "✓"
            lblCheckPassword.textColor = UIColor.lightGray
            lblTextPassword.textColor = UIColor.lightGray
        }
        else {
            lblCheckPassword.text = "•"
            lblCheckPassword.textColor = UIColor.white
            lblTextPassword.textColor = UIColor.white
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
