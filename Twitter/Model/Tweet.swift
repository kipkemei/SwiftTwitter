//
//  Tweet.swift
//  Twitter
//
//  Created by De Isaac on 7/10/20.
//  Copyright © 2020 De Isaac. All rights reserved.
//

import Foundation

struct Tweet {
    let caption: String
    let tweetID: String
    var likes: Int
    let retweetCount: Int
    var timestamp: Date!
    let user: User
    var didLike = false
    var replyingTo: String?
    
    var isReply: Bool { return replyingTo != nil }
    
    init(user: User,tweetID: String, dictionary: [String: Any]) {
        self.tweetID = tweetID
        self.user = user
        
        self.caption = dictionary["caption"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.retweetCount = dictionary["retweetCount"] as? Int ?? 0
        
        if let timestamp = dictionary["timestamp"] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
        
        if let replyingTo = dictionary["replyingTo"] as? String {
            self.replyingTo = replyingTo
        }
    }
}
