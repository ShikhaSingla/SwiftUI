//
//  ContentView.swift
//  DemoSwiftUI
//
//  Created by IOS on 24/01/20.
//  Copyright © 2020 IOS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var tutors: [Tutor] = []
    
    var body: some View {
        NavigationView {
            List(tutors) { tutor in
                TutorCell(tutor: tutor)
            }
                
            .navigationBarTitle("Tutors")
        }
        
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tutors: testData)
    }
}
#endif

struct TutorCell: View {
    let tutor: Tutor
    
    var body: some View {
        NavigationLink(destination: TutorDetail(tutorDetail: tutor)) {
            Image(tutor.imageName)
                .cornerRadius(40.0)
            VStack(alignment: .leading) {
                Text(tutor.name)
                Text(tutor.headline)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct TutorDetail: View {
    
    let tutorDetail: Tutor
    
    var body: some View {
        VStack {
            
            Image(tutorDetail.imageName)
                .cornerRadius(40.0)
                .frame(width: 120, height: 120, alignment: .center)
            Text(tutorDetail.headline)
            .font(.subheadline)
            .foregroundColor(.gray)
            Text(tutorDetail.bio)
                .padding()
            Spacer()
        }
        .navigationBarTitle(Text(tutorDetail.name), displayMode: .inline)
        
    }
}
