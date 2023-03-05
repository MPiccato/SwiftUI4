//
//  ContentView.swift
//  RegEx
//
//  Created by Martin Piccato on 05/03/2023.
//

import SwiftUI
import RegexBuilder

struct ContentView: View {
    @State var text = "jsjajdasds ajdkadja #mpiccato djakjdsakdj @mpiccato@gmail.com ajdakdweihwkejvnlc #mpdatatrading jwfw whvkjwhwlgh woighwl knwlqigwo egwlkjghleghqo egique #xcode gqogh mpiccato@me.com  qegq gq qiegq #Apple oeigqlhwegnw lgjw "
    
    @State private var hashTags: String = ""
    @State private var emails: String = ""
    
    var body: some View {
        Form {
            Section {
                Text(text)
                Button("Get HashTags and Emails") {
                    checkHashTags()
                    checkEmails()
                }
            }
            
            Section("HashTags") {
                Text(hashTags)
            }
            Section("Emails") {
                Text(emails)
            }
            
        }
    }
    
    func checkHashTags() {
        //let regex = try! Regex("#[a-z0-9]+")
        let regex = Regex {
            "#"
            OneOrMore(.word)
        }
        
        let match = text.matches(of: regex)
        match.forEach { value in
            let lowerBounds = value.range.lowerBound
            let upperBpunds = value.range.upperBound
            let hashTag = text[lowerBounds...upperBpunds]
            hashTags.append(String(hashTag))
        }
    }
    
    func checkEmails() {
        let regex = /\b[\w\.~]+@[\w\.~]+\.\w{2,4}\b/
        let match = text.matches(of: regex)
        match.forEach { value in
            let lowerBounds = value.range.lowerBound
            let upperBounds = value.range.upperBound
            let email = text[lowerBounds...upperBounds]
            emails.append(String(email))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
