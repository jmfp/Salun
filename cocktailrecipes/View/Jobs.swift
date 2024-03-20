//
//  Jobs.swift
//  Salun
//
//  Created by Jessie Price on 3/19/24.
//

import SwiftUI

struct Jobs: View {
    @State private var job = Job()
    var body: some View {
        ZStack{
            VStack{
                Text("Job Name")
                TextField("Job Name", text: $job.jobName)
                    .textFieldStyle(.roundedBorder)
                Button("List Job"){
                    AddJob(jobName: job.jobName)
                    }
                }
                    .buttonStyle(.borderedProminent)
            }.preferredColorScheme(.dark)
        }
    }


struct Jobs_Previews: PreviewProvider {
    static var previews: some View {
        Jobs()
    }
}
