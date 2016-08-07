//
//  GuildFields.swift
//  RxBattleNet
//
//  Created by Ivan Fabijanović on 07/08/16.
//  Copyright © 2016 Ivan Fabijanovic. All rights reserved.
//

public extension WoW.Guild {

    public enum Fields: String {
        
        /**
         * A list of characters that are a member of the guild. When the members list is requested, a list of character objects is returned. Each object in the returned members list contains a character block as well as a rank field.
         */
        case Members = "members"
        
        /**
         * A set of data structures that describe the achievements earned by the guild. When requesting achievement data, several sets of data will be returned.
         *
         * - `achievementsCompleted` - A list of achievement ids.
         * - `achievementsCompletedTimestamp` - A list of timestamps whose places correspond to the achievement ids in the `achievementsCompleted` list. The value of each timestamp indicates when the related achievement was earned by the guild.
         * - `criteria` - A list of criteria ids that can be used to determine the partial completeness of guild achievements.
         * - `criteriaQuantity` - A list of values associated with a given achievement criteria. The position of a value corresponds to the position of a given achievement criteria.
         * - `criteriaTimestamp` - A list of timestamps where the value represents when the criteria was considered complete. The position of a value corresponds to the position of a given achievement criteria.
         * - `criteriaCreated` - A list of timestamps where the value represents when the criteria was considered started. The position of a value corresponds to the position of a given achievement criteria.
         */
        case Achievements = "achievements"
        
        /**
         * A set of data structures that describe the news feed of the guild. When the news feed is requested, you receive a list of news objects. Each one has a type, a timestamp, and then some other data depending on the type: itemId, achievement object, etc.
         */
        case News = "news"
        
        /**
         * The top 3 challenge mode guild run times for each challenge mode map.
         */
        case Challenge = "challenge"
        
    }
    
}
