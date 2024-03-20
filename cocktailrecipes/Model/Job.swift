//
//  Job.swift
//  Salun
//
//  Created by Jessie Price on 3/20/24.
//

import Foundation
import RealmSwift


class Job: Object, ObjectKeyIdentifiable{
    @Persisted var _id = UUID().uuidString
    @Persisted var jobName : String
    //@Persisted var jobType : Map<String, Bool>
}

func AddJob(jobName: String){
    let job = Job(value: [
        "jobName": jobName
    ])
    Task{
        do{
            let realm = try Realm()
            try realm.write {
                realm.add(job)
            }
        }catch{
            
        }
    }
}
