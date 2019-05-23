//
//  ViewController.swift
//  RealmTest
//
//  Created by dit03 on 2019. 5. 23..
//  Copyright © 2019년 201820028. All rights reserved.
//

import UIKit
import RealmSwift

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}

class ViewController: UIViewController {

    @IBOutlet weak var textValue: UITextField!
    @IBOutlet weak var textAge: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnAdd(_ sender: Any) {
        let person = Person()
        
        person.name = textValue.text!
        person.age = Int(textAge.text!)!
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(person)
        }
        textValue.text = ""
        textAge.text = ""
    }
    
    @IBAction func btnDeleteAll(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    @IBAction func btnGet(_ sender: Any) {
        textView.text = ""
        
        let realm = try! Realm()
        let vals = realm.objects(Person.self)//불러온다
        
        if vals.count == 0 {
            return
        } else {
            for i in vals {
                textView.text = textView.text! + "Name : \(i.name), Age : \(i.age) \n"
            }
        }
    }
    
}

