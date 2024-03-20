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
    @Persisted var jobName = "New Job"
    @Persisted var jobType : Map<String, Bool>
}
