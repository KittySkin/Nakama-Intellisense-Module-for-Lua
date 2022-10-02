---@diagnostic disable: undefined-doc-param
local M = {}

---@class Account
---@field public metadata table
---@field public wallet table
---@field public username string
---@field public display_name string
---@field public timezone string
---@field public location string
---@field public language string
---@field public avatar_url string
M.account = {}

---@class CollectionObject
---@field public collection string
---@field public key string
---@field public user_id string
---@field public value table
---@field public version string
---@field public permission_read number
---@field public permission_write number
M.collection_object = {}

---@class Context
---@field env table A table of key/value pairs which are defined in the YAML configuration of the server. This is useful to store API keys and other secrets which may be different between servers run in production and in development.
---@field execution_mode string The mode associated with the execution context. It's one of these values: "run_once", "rpc", "before", "after", "match", "matchmaker", "leaderboard_reset", "tournament_reset", "tournament_end".
---@field query_params table Query params that was passed through from HTTP request.
---@field session_id string The user session associated with the execution context.
---@field user_id string The user ID associated with the execution context.
---@field username string The username associated with the execution context.
---@field user_session_exp number The user session expiry in seconds associated with the execution context.
---@field client_ip string The IP address of the client making the request.
---@field client_port string The port number of the client making the request.
---@field match_id string The match ID that is currently being executed. Only applicable to server authoritative multiplayer.
---@field match_node string The node ID that the match is being executed on. Only applicable to server authoritative multiplayer.
---@field match_label string Labels associated with the match. Only applicable to server authoritative multiplayer.
---@field match_tick_rate number Tick rate defined for this match. Only applicable to server authoritative multiplayer.
M.context = {}

---@class Presence
---@field user_id string
---@field session_id string
---@field username string
---@field node string
M.presence = {}

---@class GameMessage
---@field sender Presence
---@field op_code number
---@field data string
M.game_message = {}

---@class Dispatcher
M.dispatcher = {}


---Send a message to one or more presences.
---This may be called at any point in the match loop to give match participants information about match state changes. May also be useful inside the match join callback to send initial state to the user on successful join.
---@param op_code number Numeric message op code.
---@param data string Data payload string, or nil.
---@param presences Presence[] List of presences (a subset of match participants) to use as message targets, or nil to send to the whole match.
---@param sender Presence A presence to tag on the message as the 'sender', or nil.
function M.dispatcher.broadcast_message(op_code, data, presences, sender)
end

---Removes participants from the match.
---Call at any point during the match loop to remove participants based on misbehaviour or other game-specific rules.
---@param presences Presence
function M.dispatcher.match_kick(presences)
end

---Sets a new label for the match.
---@param label string
function M.dispatcher.match_label_update(label)
end

---@class MessageNames
M.message_names = {
    ---Add friends by ID or username to a user's account.
    AddFriends = "AddFriends",
    ---Add users to a group.
    AddGroupUsers = "AddGroupUsers",
    ---Authenticate a user with a custom id against the server.
    AuthenticateCustom = "authenticate_custom",
    ---Authenticate a user with a device id against the server.
    AuthenticateDevice = "AuthenticateDevice",
    ---Authenticate a user with an email+password against the server.
    AuthenticateEmail = "AuthenticateEmail",
    ---Authenticate a user with a Facebook OAuth token against the server.
    AuthenticateFacebook = "AuthenticateFacebook",
    ---Authenticate a user with Apple's GameCenter against the server.
    AuthenticateGameCenter = "AuthenticateGameCenter",
    ---Authenticate a user with Google against the server.
    AuthenticateGoogle = "AuthenticateGoogle",
    ---Authenticate a user with Steam against the server.
    AuthenticateSteam = "AuthenticateSteam",
    ---Block one or more users by ID or username.
    BlockFriends = "BlockFriends",
    ---Create a new group with the current user as the owner.
    CreateGroup = "CreateGroup",
    ---Delete one or more users by ID or username.
    DeleteFriends = "DeleteFriends",
    ---Delete one or more groups by ID.
    DeleteGroup = "DeleteGroup",
    ---Delete a leaderboard record.
    DeleteLeaderboardRecord = "DeleteLeaderboardRecord",
    ---Delete one or more notifications for the current user.
    DeleteNotifications = "DeleteNotifications",
    ---Delete one or more objects by ID or username.
    DeleteStorageObjects = "DeleteStorageObjects",
    ---Fetch the current user's account.
    GetAccount = "GetAccount",
    ---Fetch zero or more users by ID and/or username.
    GetUsers = "GetUsers",
    ---A healthcheck which load balancers can use to check the service.
    Healthcheck = "Healthcheck",
    ---Import Facebook friends and add them to a user's account.
    ImportFacebookFriends = "ImportFacebookFriends",
    ---Immediately join an open group, or request to join a closed one.
    JoinGroup = "JoinGroup",
    ---Kick a set of users from a group.
    KickGroupUsers = "KickGroupUsers",
    ---Leave a group the user is a member of.
    LeaveGroup = "LeaveGroup",
    ---Add a custom ID to the social profiles on the current user's account.
    LinkCustom = "LinkCustom",
    ---Add a device ID to the social profiles on the current user's account.
    LinkDevice = "LinkDevice",
    ---Add an email+password to the social profiles on the current user's account.
    LinkEmail = "LinkEmail",
    ---Add Facebook to the social profiles on the current user's account.
    LinkFacebook = "LinkFacebook",
    ---Add Apple's GameCenter to the social profiles on the current user's account.
    LinkGameCenter = "LinkGameCenter",
    ---Add Google to the social profiles on the current user's account.
    LinkGoogle = "LinkGoogle",
    ---Add Steam to the social profiles on the current user's account.
    LinkSteam = "LinkSteam",
    ---List a channel's message history.
    ListChannelMessages = "ListChannelMessages",
    ---List all friends for the current user.
    ListFriends = "ListFriends",
    ---List groups based on given filters.
    ListGroups = "ListGroups",
    ---List all users that are part of a group.
    ListGroupUsers = "ListGroupUsers",
    ---List leaderboard records.
    ListLeaderboardRecords = "ListLeaderboardRecords",
    ---Fetch a list of running matches.
    ListMatches = "ListMatches",
    ---Fetch a list of notifications.
    ListNotifications = "ListNotifications",
    ---List publicly readable storage objects in a given collection.
    ListStorageObjects = "ListStorageObjects",
    ---List groups the current user belongs to.
    ListUserGroups = "ListUserGroups",
    ---Promote a set of users in a group to the next role up.
    PromoteGroupUsers = "PromoteGroupUsers",
    ---Demote a set of users in a group to a lower role.
    DemoteGroupUsers = "DemoteGroupUsers",
    ---Get storage objects.
    ReadStorageObjects = "ReadStorageObjects",
    ---Remove the custom ID from the social profiles on the current user's account.
    UnlinkCustom = "UnlinkCustom",
    ---Remove the device ID from the social profiles on the current user's account.
    UnlinkDevice = "UnlinkDevice",
    ---Remove the email+password from the social profiles on the current user's account.
    UnlinkEmail = "UnlinkEmail",
    ---Remove Facebook from the social profiles on the current user's account.
    UnlinkFacebook = "UnlinkFacebook",
    ---Remove Apple's GameCenter from the social profiles on the current user's account.
    UnlinkGameCenter = "UnlinkGameCenter",
    ---Remove Google from the social profiles on the current user's account.
    UnlinkGoogle = "UnlinkGoogle",
    ---Remove Steam from the social profiles on the current user's account.
    UnlinkSteam = "UnlinkSteam",
    ---Update fields in the current user's account.
    UpdateAccount = "UpdateAccount",
    ---Update fields in a given group.
    UpdateGroup = "UpdateGroup",
    ---Write a record to a leaderboard.
    WriteLeaderboardRecord = "WriteLeaderboardRecord",
    ---Write objects into the storage engine.
    WriteStorageObjects = "WriteStorageObjects",

    ---You should use the following message names for register_rt_before and register_rt_after hooks

    ---Join a realtime chat channel.
    ChannelJoin = "ChannelJoin",
    ---Leave a realtime chat channel.
    ChannelLeave = "ChannelLeave",
    ---Send a message to a realtime chat channel.
    ChannelMessageSend = "ChannelMessageSend",
    ---Update a message previously sent to a realtime chat channel.
    ChannelMessageUpdate = "ChannelMessageUpdate",
    ---Remove a message previously sent to a realtime chat channel.
    ChannelMessageRemove = "ChannelMessageRemove",
    ---A client to server request to create a realtime match.
    MatchCreate = "MatchCreate",
    ---A client to server request to send data to a realtime match.
    MatchDataSend = "MatchDataSend",
    ---A client to server request to join a realtime match.
    MatchJoin = "MatchJoin",
    ---A client to server request to leave a realtime match.
    MatchLeave = "MatchLeave",
    ---Submit a new matchmaking process request.
    MatchmakerAdd = "MatchmakerAdd",
    ---Cancel a matchmaking process using a ticket.
    MatchmakerRemove = "MatchmakerRemove",
    ---Start following some set of users to receive their status updates.
    StatusFollow = "StatusFollow",
    ---Stop following some set of users to no longer receive their status updates.
    StatusUnfollow = "StatusUnfollow",
    ---Set the user's own status.
    StatusUpdate = "StatusUpdate"
}

---Accounts

---Delete an account by user ID.
---@param userId string REQUIRED - User ID for the account to be deleted. Must be valid UUID.
---@param recorded? boolean Whether to record this deletion in the database. By default this is set to false.
function M.account_delete_id(userId, recorded)
end

---Export account information for a specified user ID.
---@param userId string REQUIRED - User ID for the account to be exported. Must be valid UUID.
---@return string export Account information for the provided user ID, in JSON format.
function M.account_export_id(userId)
end

---Get all account information for a given user ID.
---@param id string User ID to fetch information for. Must be valid UUID.
---@return table account All account information including wallet, device IDs and more.
function M.account_get_id(id)
end

---Fetch information for multiple accounts by user IDs.
---@param userIds table REQUIRED - Table of user IDs to fetch information for. Must be valid UUID.
---@return table account Table of accounts.
function M.accounts_get_id(userIds)
end

---Update an account by user ID.
---@param user_id string REQUIRED - User ID for which the information is to be updated. Must be valid UUID.
---@param metadata? table Metadata to update. Use nil if it is not being updated.
---@param username? string Username to be set. Must be unique. Use "" (Go) or nil (Lua) if it is not being updated.
---@param display_name? string Display name to be updated. Use "" (Go) or nil (Lua) if it is not being updated.
---@param timezone? string Timezone to be updated. Use "" (Go) or nil (Lua) if it is not being updated.
---@param location? string Location to be updated. Use "" (Go) or nil (Lua) if it is not being updated.
---@param language? string Lang tag to be updated. Use "" (Go) or nil (Lua) if it is not being updated.
---@param avatar_url? string User's avatar URL. Use "" (Go) or nil (Lua) if it is not being updated.
function M.account_update_id(user_id, metadata, username, display_name, timezone, location, language, avatar_url)
end

---Authenticate

---Authenticate user and create a session token using an Apple sign in token.
---@param token string REQUIRED - Apple sign in token.
---@param username? string The user's username. If left empty, one is generated.
---@param create? boolean Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return boolean created Value indicating if this account was just created or already existed.
function M.authenticate_apple(token, username, create)
end

---Authenticate user and create a session token using a custom authentication managed by an external service or source not already supported by Nakama.
---@param id string REQUIRED - Custom ID to use to authenticate the user. Must be between 6-128 characters.
---@param username? string The user's username. If left empty, one is generated.
---@param create? boolean Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return boolean created Value indicating if this account was just created or already existed.
function M.authenticate_custom(id, username, create)
end

---Authenticate user and create a session token using a device identifier.
---@param id string REQUIRED - Device ID to use to authenticate the user. Must be between 1-128 characters.
---@param username? string The user's username. If left empty, one is generated.
---@param create? boolean Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return boolean created Value indicating if this account was just created or already existed.
function M.authenticate_device(id, username, create)
end

---Authenticate user and create a session token using an email address and password.
---@param email string REQUIRED - Email address to use to authenticate the user. Must be between 10-255 characters.
---@param password string REQUIRED - Password to set. Must be longer than 8 characters.
---@param username? string The user's username. If left empty, one is generated.
---@param create? boolean Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return boolean created Value indicating if this account was just created or already existed.
function M.authenticate_email(email, password, username, create)
end

---Authenticate user and create a session token using a Facebook account token.
---@param token string REQUIRED - Access token.
---@param import? boolean Whether to automatically import Facebook friends after authentication.
---@param username? string The user's username. If left empty, one is generated.
---@param create? boolean Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return boolean created Value indicating if this account was just created or already existed.
function M.authenticate_facebook(token, import, username, create)
end

---Authenticate user and create a session token using a Facebook Instant Game.
---@param playerInfo string REQUIRED - Facebook Player info.
---@param username? string The user's username. If left empty, one is generated.
---@param create? boolean Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return boolean created Value indicating if this account was just created or already existed.
function M.authenticate_facebook_instance_game(playerInfo, username, create)
end

---Authenticate user and create a session token using Apple Game Center credentials.
---@param playerId string REQUIRED - PlayerId provided by GameCenter.
---@param bundleId string REQUIRED - BundleId of your app on iTunesConnect.
---@param timestamp number REQUIRED - Timestamp at which Game Center authenticated the client and issued a signature.
---@param salt string REQUIRED - A random string returned by Game Center authentication on client.
---@param signature string REQUIRED - A signature returned by Game Center authentication on client.
---@param publicKeyUrl string REQUIRED - A URL to the public key returned by Game Center authentication on client.
---@param username string REQUIRED - The user's username. If left empty, one is generated.
---@param create boolean REQUIRED - Create user if one didn't exist previously.
---@return string userID REQUIRED - The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return boolean created Value indicating if this account was just created or already existed.
function M.authenticate_game_center(playerId, bundleId, timestamp, salt, signature, publicKeyUrl, username, create)
end

---Authenticate user and create a session token using a Google ID token.
---@param token string REQUIRED - Google OAuth access token.
---@param username? string The user's username. If left empty, one is generated.
---@param create? boolean Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return boolean created Value indicating if this account was just created or already existed.
function M.authenticate_google(token, username, create)
end

---Authenticate user and create a session token using a Steam account token.
---@param token string REQUIRED - Steam token.
---@param username? string The user's username. If left empty, one is generated.
---@param import? boolean Whether to automatically import Steam friends after authentication.
---@param create? boolean Create user if one didn't exist previously.
---@return string userID The user ID of the authenticated user.
---@return string username The username of the authenticated user.
---@return boolean created Value indicating if this account was just created or already existed.
function M.authenticate_steam(token, username, import, create)
end

---Generate a Nakama session token from a user ID.
---@param userId string REQUIRED - User ID to use to generate the token.
---@param username? string The user's username. If left empty, one is generated.
---@param expiresAt? number Number of seconds the token should be valid for. Defaults to server configured expiry time.
---@return string token The Nakama session token.
---@return number validity The period for which the token remains valid.
function M.authenticate_token_generate(userId, username, expiresAt)
end

---Link Apple authentication to a user ID.
---@param userId string REQUIRED - The user ID to be linked.
---@param token string REQUIRED - Apple sign in token.
function M.link_apple(userId, token)
end

---Link custom authentication to a user ID.
---@param userId string REQUIRED - The user ID to be linked.
---@param customId string REQUIRED - Custom ID to be linked to the user.
function M.link_custom(userId, customId)
end

---Link device authentication to a user ID.
---@param userId string REQUIRED - The user ID to be linked.
---@param deviceId string REQUIRED - Device ID to be linked to the user.
function M.link_device(userId, deviceId)
end

---Link email authentication to a user ID.
---@param userId string REQUIRED - The user ID to be linked.
---@param email string REQUIRED - Authentication email to be linked to the user.
---@param password string REQUIRED - Password to set. Must be longer than 8 characters.
function M.link_email(userId, email, password)
end

---Link Facebook authentication to a user ID.
---@param userId string REQUIRED - The user ID to be linked.
---@param username? string If left empty, one is generated.
---@param token string REQUIRED - Access token.
---@param importFriends boolean	Whether to automatically import Facebook friends after authentication.
function M.link_facebook(userId, username, token, importFriends)
end

---Link Facebook Instant Game authentication to a user ID.
---@param userId string REQUIRED - The user ID to be linked.
---@param playerInfo string REQUIRED - Facebook player info.
function M.link_facebook_instant_game(userId, playerInfo)
end

---Link Apple Game Center authentication to a user ID.
---@param userId string REQUIRED - The user ID to be linked.
---@param playerId string REQUIRED - Player ID provided by Game Center.
---@param bundleId string REQUIRED - Bundle ID of your app on iTunesConnect.
---@param timestamp number REQUIRED - Timestamp at which Game Center authenticated the client and issued a signature.
---@param salt string REQUIRED - A random string returned by Game Center authentication on client.
---@param signature string REQUIRED - A signature returned by Game Center authentication on client.
---@param publicKeyUrl string REQUIRED - A URL to the public key returned by Game Center authentication on client.
function M.link_gamecenter(userId, playerId, bundleId, timestamp, salt, signature, publicKeyUrl)
end

---Link Google authentication to a user ID.
---@param userId string REQUIRED - The user ID to be linked.
---@param token string REQUIRED - Google OAuth access token.
function M.link_google(userId, token)
end

---Link Steam authentication to a user ID.
---@param userId string REQUIRED - The user ID to be linked.
---@param username string REQUIRED - If left empty, one is generated.
---@param token string REQUIRED - Steam access token.
---@param importFriends boolean REQUIRED - Whether to automatically import Steam friends after authentication.
function M.link_steam(userId, username, token, importFriends)
end

---Unlink Apple authentication from a user ID.
---@param userId string REQUIRED - The user ID to be unlinked.
---@param token string REQUIRED - Apple sign in token.
function M.unlink_apple(userId, token)
end

---Unlink custom authentication from a user ID.
---@param userId string REQUIRED - The user ID to be unlinked.
---@param customId string REQUIRED - Custom ID to be unlinked from the user.
function M.unlink_custom(userId, customId)
end

---Unlink device authentication from a user ID.
---@param userId string REQUIRED - The user ID to be unlinked.
---@param deviceId string REQUIRED - Device ID to be unlinked to the user.
function M.unlink_device(userId, deviceId)
end

---Unlink email authentication from a user ID.
---@param userId string REQUIRED - The user ID to be unlinked.
---@param email string REQUIRED - Email to be unlinked from the user.
function M.unlink_email(userId, email)
end

---Unlink Facebook authentication from a user ID.
---@param userId string REQUIRED - The user ID to be unlinked.
---@param token string REQUIRED - Access token.
function M.unlink_facebook(userId, token)
end

---Unlink Facebook Instant Game authentication from a user ID.
---@param userId string REQUIRED - The user ID to be unlinked.
---@param playerInfo string REQUIRED - Facebook player info.
function M.unlink_facebook_instant_game(userId, playerInfo)
end

---Unlink Apple Game Center authentication from a user ID.
---@param userId string REQUIRED - The user ID to be unlinked.
---@param playerId string REQUIRED - Player ID provided by Game Center.
---@param bundleId string REQUIRED - Bundle ID of your app on iTunesConnect.
---@param timestamp number REQUIRED - Timestamp at which Game Center authenticated the client and issued a signature.
---@param salt string REQUIRED - A random string returned by Game Center authentication on client.
---@param signature string REQUIRED - A signature returned by Game Center authentication on client.
---@param publicKeyUrl string REQUIRED - A URL to the public key returned by Game Center authentication on client.
function M.unlink_game_center(userId, playerId, bundleId, timestamp, salt, signature, publicKeyUrl)
end

---Unlink Google authentication from a user ID.
---@param userId string REQUIRED - The user ID to be unlinked.
---@param token string REQUIRED - Google OAuth access token.
function M.unlink_google(userId, token)
end

---Unlink Steam authentication from a user ID.
---@param userId string REQUIRED - The user ID to be unlinked.
---@param token string REQUIRED - Steam access token.
function M.unlink_steam(userId, token)
end

---Chat

---Create a channel identifier to be used in other runtime calls. Does not create a channel.
---@param senderId string REQUIRED - UserID of the message sender (when applicable). An empty string defaults to the system user.
---@param target string REQUIRED - Can be the room name, group identifier, or another username.
---@param chanType number REQUIRED - The type of channel, for example group or direct.
---@return string channelId The generated ID representing a channel.
function M.channel_id_build(senderId, target, chanType)
end

---Send a message on a realtime chat channel.
---@param channelId string REQUIRED - The ID of the channel to send the message on.
---@param content table REQUIRED - Message content.
---@param senderId? string The UUID for the sender of this message. If left empty, it will be assumed that it is a system message.
---@param senderUsername? string The username of the user to send this message as. If left empty, it will be assumed that it is a system message.
---@param persist? boolean Whether to record this message in the channel history.
---@return table ack Message sent ack.
function M.channel_message_send(channelId, content, senderId, senderUsername, persist)
end

---Update a message on a realtime chat channel.
---@param channelId string REQUIRED - The ID of the channel to send the message on.
---@param messageId string REQUIRED - The ID of the message to update.
---@param content table REQUIRED - Message content. Must be set.
---@param senderId? string The UUID for the sender of this message. If left empty, it will be assumed that it is a system message.
---@param senderUsername? string The username of the user to send this message as. If left empty, it will be assumed that it is a system message.
---@param persist? boolean Whether to record this message in the channel history.
---@return table ack Message updated ack.
function M.channel_message_update(channelId, messageId, content, senderId, senderUsername, persist)
end

---Events

---Generate an event.
---@param name string REQUIRED - The name of the event to be created.
---@param properties table REQUIRED - A table of event properties.
---@param timestamp number REQUIRED - Numeric UTC value of when event is created.
---@param external boolean Whether the event is external.
function M.event(name, properties, timestamp, external)
end

---Friends

---Add friends to a user.
---@param userId string REQUIRED - The ID of the user to whom you want to add friends.
---@param username string REQUIRED - The name of the user to whom you want to add friends.
---@param ids table REQUIRED - The IDs of the users you want to add as friends.
---@param usernames table REQUIRED - The usernames of the users you want to add as friends.
function M.friendsAdd(userId, username, ids, usernames)
end

---Delete friends to a user.
---@param userId string REQUIRED - The ID of the user from whom you want to delete friends.
---@param username string REQUIRED - The name of the user from whom you want to delete friends.
---@param ids table REQUIRED - The IDs of the users you want to delete as friends.
---@param usernames table REQUIRED - The usernames of the users you want to delete as friends.
function M.friendsDelete(userId, username, ids, usernames)
end

---List all friends, invites, invited, and blocked which belong to a user.
---@param userId string REQUIRED - The ID of the user whose friends, invites, invited, and blocked you want to list.
---@param limit? number The number of friends to retrieve in this page of results. No more than 100 limit allowed per result.
---@param state? number The state of the friendship with the user. If unspecified this returns friends in all states for the user.
---@param cursor? string The cursor returned from a previous listing request. Used to obtain the next page of results.
---@return table fields The user information for users that are friends of the current user.
---@return string cursor An optional next page cursor that can be used to retrieve the next page of records (if any).
function M.friends_list(userId, limit, state, cursor)
end

---Groups

---Setup a group with various configuration settings. The group will be created if they don't exist or fail if the group name is taken.
---@param userId string REQUIRED - Mandatory. The user ID to be associated as the group superadmin.
---@param name string REQUIRED - Mandatory. Group name, must be unique.
---@param creatorId? string The user ID to be associated as creator. If not set or nil/null, system user will be set.
---@param langTag? string Group language.
---@param description? string Group description, can be left empty as nil/null.
---@param avatarUrl? string URL to the group avatar, can be left empty as nil/null.
---@param open? boolean Whether the group is for anyone to join, or members will need to send invitations to join.
---@param metadata? table Custom information to store for this group. Can be left empty as nil/null.
---@param maxCount? number Maximum number of members to have in the group.
---@return string createGroup The ID of the newly created group.
function M.group_create(userId, name, creatorId, langTag, description, avatarUrl, open, metadata, maxCount)
end

---Delete a group.
---@param groupId string REQUIRED - The ID of the group to delete.
function M.group_delete(groupId)
end

---Fetch one or more groups by their ID.
---@param groupIds table REQUIRED - A list of strings of the IDs for the groups to get.
---@return table getGroups A table of groups with their fields.
function M.groups_get_id(groupIds)
end

---Find groups based on the entered criteria.
---@param name string REQUIRED - Search for groups that contain this value in their name.
---@param langTag? string Filter based upon the entered language tag.
---@param members number REQUIRED - Search by number of group members.
---@param open boolean REQUIRED - Filter based on whether groups are Open or Closed.
---@param limit? number Return only the required number of groups denoted by this limit value.
---@param cursor? string Cursor to paginate to the next result set. If this is empty/null there are no further results.
---@return table groups A list of groups.
---@return string cursor An optional next page cursor that can be used to retrieve the next page of records (if any).
function M.groups_list(name, langTag, members, open, limit, cursor)
end

---Update a group with various configuration settings. The group which is updated can change some or all of its fields.
---@param groupId string REQUIRED - The ID of the group to update.
---@param userId? string User ID calling the update operation for permission checking. Set as nil to enact the changes as the system user.
---@param name? string Group name, can be empty if not changed.
---@param creatorId? string The user ID to be associated as creator. Can be empty if not changed.
---@param langTag? string Group language. Empty if not updated.
---@param description? string Group description, can be left empty if not updated.
---@param avatarUrl? string URL to the group avatar, can be left empty if not updated.
---@param open? boolean Whether the group is for anyone to join or not.
---@param metadata? table Custom information to store for this group. Use nil if field is not being updated.
---@param maxCount? number Maximum number of members to have in the group. Use 0, nil/null if field is not being updated.
function M.group_update(groupId, userId, name, creatorId, langTag, description, avatarUrl, open, metadata, maxCount)
end

---Join a group for a particular user.
---@param groupId string REQUIRED - The ID of the group to join.
---@param userId string REQUIRED - The user ID to add to this group.
---@param username string REQUIRED - The username of the user to add to this group.
function M.group_user_join(groupId, userId, username)
end

---Leave a group for a particular user.
---@param groupId string REQUIRED - The ID of the group to join.
---@param userId string REQUIRED - The user ID to add to this group.
---@param username string REQUIRED - The username of the user to add to this group.
function M.group_user_leave(groupId, userId, username)
end

---Add users to a group.
---@param groupId string REQUIRED - The ID of the group to add users to.
---@param userIds table REQUIRED - Table of user IDs to add to this group.
function M.group_users_add(groupId, userIds)
end

---Ban users from a group.
---@param groupId string REQUIRED - The ID of the group to add users to.
---@param userIds table REQUIRED - Table of user IDs to add to this group.
function M.group_users_ban(groupId, userIds)
end

---Demote users in a group.
---@param groupId string REQUIRED - The ID of the group whose members are being demoted.
---@param userIds table REQUIRED - Table of user IDs to demote.
function M.group_users_demote(groupId, userIds)
end

---Kick users from a group.
---@param groupId string REQUIRED - The ID of the group to kick users from.
---@param userIds table REQUIRED - Table of user IDs to kick.
function M.group_users_kick(groupId, userIds)
end

---List all members, admins and superadmins which belong to a group. This also list incoming join requests.
---@param groupId string REQUIRED - The ID of the group to list members for.
---@return table groupUsers The user information for members, admins and superadmins for the group. Also users who sent a join request.
function M.group_users_list(groupId)
end

---Promote users in a group.
---@param groupId string REQUIRED - The ID of the group whose members are being promoted.
---@param userIds table REQUIRED - Table of user IDs to promote.
function M.group_users_promote(groupId, userIds)
end

---List all groups which a user belongs to and whether they've been accepted or if it's an invite.
---@param userId string REQUIRED - The ID of the user to list groups for.
---@return table userGroups A table of groups with their fields.
---@return string cursor An optional next page cursor that can be used to retrieve the next page of records (if any).
function M.user_groups_list(userId)
end

---Hooks

---Registers a function to be run when a leaderboard resets.
---@param fn function REQUIRED - A function reference which will be executed on each leaderboard reset.
function M.register_leaderboard_reset(fn)
end

---Registers a function that will be called when matchmaking finds opponents.
---@param fn function REQUIRED - A function reference which will be executed on each matchmake completion.
function M.register_matchmaker_matched(fn)
end

---Register a function with the server which will be executed after every non-realtime message as specified while registering the function.
---@param fn function REQUIRED - A function reference which will be executed on each message.
---@param id string REQUIRED - The specific message name to execute the function after.
function M.register_req_after(fn, id)
end

---Register a function with the server which will be executed before any non-realtime message with the specified message name.
---@param fn function REQUIRED - A function reference which will be executed on each message.
---@param id string REQUIRED - The specific message name to execute the function after.
function M.register_req_before(fn, id)
end

---Registers a function for use with client RPC to the server.
---@param fn function REQUIRED - A function reference which will be executed on each RPC message.
---@param id string REQUIRED - The unique identifier used to register the function for RPC.
function M.register_rpc(fn, id)
end

---Register a function with the server which will be executed after every realtime message with the specified message name.
---@param fn function REQUIRED - A function reference which will be executed on each msgname message.
---@param id string REQUIRED - The specific message name to execute the function after.
function M.register_rt_after(fn, id)
end

---Register a function with the server which will be executed before any realtime message with the specified message name.
---@param fn function REQUIRED - A function reference which will be executed on each msgname message. The function should pass the payload input back as a return argument so the pipeline can continue to execute the standard logic.
---@param id string REQUIRED - The specific message name to execute the function after.
function M.register_rt_before(fn, id)
end

---Registers a function to be run when a tournament ends.
---@param fn function REQUIRED - A function reference which will be executed on each tournament end.
function M.register_tournament_end(fn)
end

---Registers a function to be run when a tournament resets.
---@param fn function REQUIRED - A function reference which will be executed on each tournament reset.
function M.register_tournament_reset(fn)
end

---Registers a function to be run only once.
---@param fn function REQUIRED - A function reference which will be executed only once.
function M.run_once(fn)
end

---Leaderboards

---Setup a new dynamic leaderboard with the specified ID and various configuration settings. The leaderboard will be created if it doesn't already exist, otherwise its configuration will not be updated.
---@param id string REQUIRED - The unique identifier for the new leaderboard. This is used by clients to submit scores.
---@param authoritative? boolean	Mark the leaderboard as authoritative which ensures updates can only be made via the Go runtime. No client can submit a score directly.
---@param sortOrder? string The sort order for records in the leaderboard. Possible values are "asc" or "desc".
---@param operator? string The operator that determines how scores behave when submitted; possible values are "best", "set", or "incr".
---@param resetSchedule? string The cron format used to define the reset schedule for the leaderboard. This controls when a leaderboard is reset and can be used to power daily/weekly/monthly leaderboards.
---@param metadata? table The metadata you want associated to the leaderboard. Some good examples are weather conditions for a racing game.
function M.leaderboard_create(id, authoritative, sortOrder, operator, resetSchedule, metadata)
end

---Delete a leaderboard and all scores that belong to it.
---@param id string REQUIRED - The unique identifier for the leaderboard to delete.
function M.leaderboard_delete(id)
end

---Find leaderboards which have been created on the server. Leaderboards can be filtered with categories.
---@param categoryStart number REQUIRED - Filter leaderboards with categories greater or equal than this value.
---@param categoryEnd number REQUIRED - Filter leaderboards with categories equal or less than this value.
---@param limit? number Return only the required number of leaderboards denoted by this limit value.
---@param cursor? string Cursor to paginate to the next result set. If this is empty/null there are no further results.
---@return table leaderboardList A list of leaderboard results and possibly a cursor.
function M.leaderboard_list(categoryStart, categoryEnd, limit, cursor)
end

---Remove an owner's record from a leaderboard, if one exists.
---@param id string REQUIRED - The unique identifier for the leaderboard to delete from.
---@param owner string REQUIRED - The owner of the score to delete.
function M.leaderboard_record_delete(id, owner)
end

---Fetch the list of leaderboard records around the owner.
---@param id string REQUIRED - The ID of the leaderboard to list records for.
---@param ownerId string REQUIRED - The owner ID around which to show records.
---@param limit? number Return only the required number of leaderboard records denoted by this limit value. Between 1-100.
---@param expiry? number Time since epoch in seconds. Must be greater than 0.
---@return table leaderboardRecordsHaystack A list of leaderboard records.
function M.leaderboardRecordsHaystack(id, ownerId, limit, expiry)
end

---List records on the specified leaderboard, optionally filtering to only a subset of records by their owners. Records will be listed in the preconfigured leaderboard sort order.
---@param id string REQUIRED - The unique identifier for the leaderboard to list. Mandatory field.
---@param owners table REQUIRED - List of owners to filter to.
---@param limit? number The maximum number of records to return (Max 10,000).
---@param cursor? string A cursor used to fetch the next page when applicable.
---@return table records A page of leaderboard records.
---@return table ownerRecords A list of owner leaderboard records (empty if the owners input parameter is not set).
---@return string nextCursor An optional next page cursor that can be used to retrieve the next page of records (if any).
---@return string prevCursor An optional previous page cursor that can be used to retrieve the previous page of records (if any).
function M.leaderboard_records_list(id, owners, limit, cursor)
end

---Use the preconfigured operator for the given leaderboard to submit a score for a particular user.
---@param id string REQUIRED - The unique identifier for the leaderboard to submit to.
---@param owner string REQUIRED - The owner of this score submission.
---@param username? string The owner username of this score submission, if it's a user.
---@param score? number The score to submit.
---@param subscore? number A secondary subscore parameter for the submission.
---@param metadata? table The metadata you want associated to this submission. Some good examples are weather conditions for a racing game.
---@return table record The newly created leaderboard record.
function M.leaderboard_record_write(id, owner, username, score, subscore, metadata)
end

---Fetch one or more leaderboards by ID.
---@param ids table REQUIRED - The table array of leaderboard ids.
---@return table leaderboards The leaderboard records according to ID.
function M.leaderboards_get_id(ids)
end

---Logger

---Write a DEBUG level message to the server logs.
---@param message string REQUIRED - The message to write to server logs with DEBUG level severity.
---@param vars any REQUIRED - Variables to replace placeholders in message.
function M.logger_debug(message, vars)
end

---Write an ERROR level message to the server logs.
---@param message string REQUIRED - The message to write to server logs with ERROR level severity.
---@param vars any REQUIRED - Variables to replace placeholders in message.
function M.logger_error(message, vars)
end

---Write an INFO level message to the server logs.
---@param message string REQUIRED - The message to write to server logs with INFO level severity.
---@param vars any REQUIRED - Variables to replace placeholders in message.
function M.logger_info(message, vars)
end

---Write a WARN level message to the server logs.
---@param message string REQUIRED - The message to write to server logs with WARN level severity.
---@param vars any REQUIRED - Variables to replace placeholders in message.
function M.logger_warn(message, vars)
end

---Matches

---Create a new authoritative realtime multiplayer match running on the given runtime module name. The given params are passed to the match's init hook.
---@param module string REQUIRED - The name of an available runtime module that will be responsible for the match. This was registered in InitModule.
---@param params? any Any value to pass to the match init hook.
---@return string matchId The match ID of the newly created match. Clients can immediately use this ID to join the match.
function M.match_create(module, params)
end

---Get information on a running match.
---@param id string REQUIRED - The ID of the match to fetch.
---@return table match Information for the running match.
function M.match_get(id)
end

---List currently running realtime multiplayer matches and optionally filter them by authoritative mode, label, and current participant count.
---@param limit? number The maximum number of matches to list.
---@param authoritative? boolean Set true to only return authoritative matches, false to only return relayed matches.
---@param label? string A label to filter authoritative matches by. Default "" means any label matches.
---@param minSize? number Inclusive lower limit of current match participants.
---@param maxSize? number Inclusive upper limit of current match participants.
---@param query? string Additional query parameters to shortlist matches.
---@return table match A table of matches matching the parameters criteria.
function M.match_list(limit, authoritative, label, minSize, maxSize, query)
end

---Allow the match handler to be sent a reservation signal to mark a user ID or session ID into the match state ahead of their join attempt and eventual join flow. Called when the match handler receives a runtime signal.
---@param id string REQUIRED - The user ID or session ID to send a reservation signal for.
---@param data string REQUIRED - An arbitrary input supplied by the runtime caller of the signal.
---@return string data Arbitrary data to return to the runtime caller of the signal. May be a string or nil.
function M.match_signal(id, data)
end

---Notifications

---Send one in-app notification to a user.
---@param userId string REQUIRED - The user ID of the user to be sent the notification.
---@param subject string REQUIRED - Notification subject.
---@param content table REQUIRED - Notification content. Must be set but can be an empty table.
---@param code number REQUIRED - Notification code to use. Must be equal or greater than 0.
---@param sender? string The sender of this notification. If left empty, it will be assumed that it is a system notification.
---@param persistent? boolean Whether to record this in the database for later listing.
function M.notification_send(userId, subject, content, code, sender, persistent)
end

---Send an in-app notification to all users.
---@param subject string REQUIRED - Notification subject.
---@param content table REQUIRED - Notification content. Must be set but can be an empty table.
---@param code number REQUIRED - Notification code to use. Must be greater than or equal to 0.
---@param persistent boolean Whether to record this in the database for later listing.
function M.notificationSendAll(subject, content, code, persistent)
end

---Send one or more in-app notifications to a user.
---@param notifications table REQUIRED - A list of notifications to be sent together.
function M.notifications_send(notifications)
end

---Purchases

---Look up a purchase receipt by transaction ID.
---@param transactionId string REQUIRED - Transaction ID of the purchase to look up.
---@return string owner The owner of the purchase.
---@return table purchase A validated purchase and its owner.
function M.purchase_get_by_transaction_id(transactionId)
end

---List stored validated purchase receipts.
---@param userId? string Filter by user ID. Can be an empty string to list purchases for all users.
---@param limit? number Limit number of records retrieved.
---@param cursor? string Pagination cursor from previous result. If none available set to nil or "" (empty string).
---@return table listPurchases A page of stored validated purchases.
function M.purchases_list(userId, limit, cursor)
end

---Validates and stores the purchases present in an Apple App Store Receipt.
---@param userId string REQUIRED - The user ID of the owner of the receipt.
---@param receipt string REQUIRED - Base-64 encoded receipt data returned by the purchase operation itself.
---@param persist? boolean Persist the purchase so that seenBefore can be computed to protect against replay attacks.
---@param passwordOverride? string Override the iap.apple.shared_password provided in your configuration.
---@return table validation The resulting successfully validated purchases. Any previously validated purchases are returned with a seenBefore flag.
function M.purchase_validate_apple(userId, receipt, persist, passwordOverride)
end

---Validates and stores a purchase receipt from the Google Play Store.
---@param userId string REQUIRED - The user ID of the owner of the receipt.
---@param receipt string REQUIRED - JSON encoded Google receipt.
---@param persist boolean Persist the purchase so that seenBefore can be computed to protect against replay attacks.
---@param clientEmailOverride? string Override the iap.google.client_email provided in your configuration.
---@param privateKeyOverride? string Override the iap.google.private_key provided in your configuration.
---@return table validation The resulting successfully validated purchases. Any previously validated purchases are returned with a seenBefore flag.
function M.purchase_validate_google(userId, receipt, persist, clientEmailOverride, privateKeyOverride)
end

---Validates and stores a purchase receipt from the Huawei App Gallery.
---@param userId string REQUIRED - The user ID of the owner of the receipt.
---@param receipt string REQUIRED - The Huawei receipt data.
---@param signature string REQUIRED - The receipt signature.
---@param persist? boolean Persist the purchase so that seenBefore can be computed to protect against replay attacks.
---@return table validation The resulting successfully validated purchases. Any previously validated purchases are returned with a seenBefore flag.
function M.purchase_validate_huawei(userId, receipt, signature, persist)
end

---Sessions

---Disconnect a session.
---@param sessionId string REQUIRED - The ID of the session to be disconnected.
---@param reason number REQUIRED - The reason for the session disconnect.
function M.session_disconnect(sessionId, reason)
end

---Log out a user from their current session.
---@param userId string REQUIRED - The ID of the user to be logged out.
---@param token string REQUIRED - The current session authentication token.
---@param refreshToken string REQUIRED - The current session refresh token.
function M.session_logout(userId, token, refreshToken)
end

---Storage

---Remove one or more objects by their collection/keyname and optional user.
---@param objectIds table REQUIRED - A list of object identifiers to be deleted.
function M.storage_delete(objectIds)
end

---List records in a collection and page through results. The records returned can be filtered to those owned by the user or "" for public records.
---@param userId string REQUIRED - for public records.
---@param collection string REQUIRED - Collection to list data from.
---@param limit number REQUIRED - Limit number of records retrieved.
---@param cursor? string Pagination cursor from previous result. If none available set to nil or "" (empty string).
---@return table objects A list of storage objects.
function M.storage_list(userId, collection, limit, cursor)
end

---Fetch one or more records by their bucket/collection/keyname and optional user.
---@param objectIds table REQUIRED - A table of object identifiers to be fetched.
---Usual content are: collection, key, user_id.
---@return table objects A list of matches matching the parameters criteria.
function M.storage_read(objectIds)
end

---Write one or more objects by their collection/keyname and optional user.
---@param objectIds table REQUIRED - A table of object identifiers to be written.
---Usual content are: collection, key, user_id, value, version, permission_read, permission_write.
---@return table acks A list of acks with the version of the written objects.
function M.storage_write(objectIds)
end

---Streams

---Close a stream and remove all presences on it.
---@param stream table REQUIRED - A stream object consisting of a 'mode' (int), 'subject' (string), 'descriptor' (string) and 'label' (string).
function M.stream_close(stream)
end

---Get a count of stream presences.
---@param stream table REQUIRED - A stream object consisting of a 'mode' (int), 'subject' (string), 'descriptor' (string) and 'label' (string).
---@return number countByStream Number of current stream presences.
function M.stream_count(stream)
end

---Send data to presences on a stream.
---@param stream table REQUIRED - A stream object consisting of a 'mode' (int), 'subject' (string), 'descriptor' (string) and 'label' (string).
---@param data string REQUIRED - The data to send.
---@param presences? table REQUIRED - Table of presences to receive the sent data. If not set, will be sent to all presences.
---@param reliable? boolean REQUIRED - Whether the sender has been validated prior.
function M.stream_send(stream, data, presences, reliable)
end

---Send a message to presences on a stream.
---@param stream table REQUIRED - A stream object consisting of a 'mode' (int), 'subject' (string), 'descriptor' (string) and 'label' (string).
---@param msg table REQUIRED - The message to send.
---@param presences table REQUIRED - Table of presences to receive the sent data. If not set, will be sent to all presences.
---@param reliable boolean REQUIRED - Whether the sender has been validated prior.
function M.stream_send_raw(stream, msg, presences, reliable)
end

---Retreive a stream presence and metadata by user ID.
---@param stream table REQUIRED - A stream object consisting of a 'mode' (int), 'subject' (string), 'descriptor' (string) and 'label' (string).
---@param userId string REQUIRED - The user ID to fetch information for.
---@param sessionId string REQUIRED - The current session ID for the user.
---@return table meta Presence and metadata for the user.
function M.stream_user_get(stream, userId, sessionId)
end

---Add a user to a stream.
---@param stream table REQUIRED - A stream object consisting of a 'mode' (int), 'subject' (string), 'descriptor' (string) and 'label' (string).
---@param userId string REQUIRED - The user ID to be added.
---@param sessionId string REQUIRED - The current session ID for the user.
---@param hidden? boolean Whether the user will be marked as hidden.
---@param persistence? boolean Whether message data should be stored in the database.
---@param status? string User status message.
---@return boolean success Whether the user was successfully added.
function M.stream_user_join(stream, userId, sessionId, hidden, persistence, status)
end

---Kick user(s) from a stream.
---@param stream table REQUIRED - A stream object consisting of a 'mode' (int), 'subject' (string), 'descriptor' (string) and 'label' (string).
---@param presence table REQUIRED - The presence to be kicked.
function M.stream_user_kick(stream, presence)
end

---Remove a user from a stream.
---@param stream table REQUIRED - A stream object consisting of a 'mode' (int), 'subject' (string), 'descriptor' (string) and 'label' (string).
---@param userId string REQUIRED - The user ID to be removed.
---@param sessionId string REQUIRED - The current session ID for the user.
function M.stream_user_leave(stream, userId, sessionId)
end

---List all users currently online and connected to a stream.
---@param stream table REQUIRED - A stream object consisting of a 'mode' (int), 'subject' (string), 'descriptor' (string) and 'label' (string).
---@param includeHidden? boolean	Include stream presences marked as hidden in the results.
---@param includeNotHidden? boolean Include stream presences not marked as hidden in the results.
---@return table presences Table of stream presences and their information.
function M.stream_user_list(stream, includeHidden, includeNotHidden)
end

---Update a stream user by ID.
---@param stream table REQUIRED - A stream object consisting of a 'mode' (int), 'subject' (string), 'descriptor' (string) and 'label' (string).
---@param userId string REQUIRED - The user ID to be updated.
---@param sessionId string REQUIRED - The current session ID for the user.
---@param hidden? boolean Whether the user will be marked as hidden.
---@param persistence? boolean Whether message data should be stored in the database.
---@param status string User status message.
function M.stream_user_update(stream, userId, sessionId, hidden, persistence, status)
end

---Tournaments

---Add additional score attempts to the owner's tournament record. This overrides the max number of score attempts allowed in the tournament for this specific owner.
---@param id string REQUIRED - The unique identifier for the tournament to update.
---@param owner string REQUIRED - The owner of the records to increment the count for.
---@param count number REQUIRED - The number of attempt counts to increment. Can be negative to decrease count.
function M.tournament_add_attempt(id, owner, count)
end

---Setup a new dynamic tournament with the specified ID and various configuration settings. The underlying leaderboard will be created if it doesn't already exist, otherwise its configuration will not be updated.
---@param id string REQUIRED - The unique identifier for the new tournament. This is used by clients to submit scores.
---@param authoritative? boolean Whether the tournament created is server authoritative.
---@param sortOrder? string The sort order for records in the tournament. Possible values are "asc" or "desc".
---@param operator? string The operator that determines how scores behave when submitted. The possible values are "best", "set", or "incr".
---@param resetSchedule? string The cron format used to define the reset schedule for the tournament. This controls when the underlying leaderboard resets and the tournament is considered active again. Optional.
---@param metadata? table The metadata you want associated to the tournament. Some good examples are weather conditions for a racing game. Optional.
---@param title? string The title of the tournament.
---@param description? string The description of the tournament.
---@param category? number A category associated with the tournament. This can be used to filter different types of tournaments. Between 0 and 127.
---@param startTime? number The start time of the tournament. Leave empty for immediately or a future time.
---@param endTime? number The end time of the tournament. When the end time is elapsed, the tournament will not reset and will cease to exist. Must be greater than startTime if set.
---@param duration number REQUIRED - The active duration for a tournament. This is the duration when clients are able to submit new records. The duration starts from either the reset period or tournament start time whichever is sooner. A game client can query the tournament for results between end of duration and next reset period.
---@param maxSize? number Maximum size of participants in a tournament.
---@param maxNumScore? number Maximum submission attempts for a tournament record.
---@param joinRequired? boolean Whether the tournament needs to be joined before a record write is allowed.
function M.tournament_create(id, authoritative, sortOrder, operator, resetSchedule, metadata, title, description,
                             category, startTime, endTime, duration, maxSize, maxNumScore, joinRequired)
end

---Delete a tournament and all records that belong to it.
---@param id string REQUIRED - The unique identifier for the tournament to delete.
function M.tournament_delete(id)
end

---A tournament may need to be joined before the owner can submit scores. This operation is idempotent and will always succeed for the owner even if they have already joined the tournament.
---@param id string REQUIRED - The unique identifier for the tournament to join.
---@param userId string REQUIRED - The owner of the record.
---@param username string REQUIRED - The username of the record owner
function M.tournament_join(id, userId, username)
end

---Find tournaments which have been created on the server. Tournaments can be filtered with categories and via start and end times.
---@param categoryStart number REQUIRED - Filter tournament with categories greater or equal than this value.
---@param categoryEnd number REQUIRED - Filter tournament with categories equal or less than this value.
---@param startTime? number Filter tournament with that start after this time.
---@param endTime? number Filter tournament with that end before this time.
---@param limit? number Return only the required number of tournament denoted by this limit value.
---@param cursor? string Cursor to paginate to the next result set. If this is empty/null there are no further results.
---@return table tournamentList A list of tournament results and possibly a cursor.
function M.tournament_list(categoryStart, categoryEnd, startTime, endTime, limit, cursor)
end

---Fetch the list of tournament records around the owner.
---@param id string REQUIRED - The ID of the tournament to list records for.
---@param ownerId string REQUIRED - The owner ID around which to show records.
---@param limit? number Return only the required number of tournament records denoted by this limit value. Between 1-100.
---@param expiry? number Time since epoch in seconds. Must be greater than 0.
---@return table tournamentRecordsHaystack A list of tournament records.
function M.tournament_records_haystack(id, ownerId, limit, expiry)
end

---List records on the specified tournament, optionally filtering to only a subset of records by their owners. Records will be listed in the preconfigured tournament sort order.
---@param tournamentId string REQUIRED - The ID of the tournament to list records for.
---@param ownerIds? table List of owner IDs to filter results by.
---@param limit number REQUIRED - Return only the required number of tournament records denoted by this limit value. Max is 10000.
---@param cursor? string Cursor to paginate to the next result set. If this is empty/null there are no further results.
---@param overrideExpiry? number Records with expiry in the past are not returned unless within this defined limit. Must be equal or greater than 0.
---@return table records A page of tournament records.
---@return table ownerRecords A list of owner tournament records (empty if the owners input parameter is not set).
---@return string prevCursor An optional previous page cursor that can be used to retrieve the previous page of records (if any).
---@return string nextCursor An optional next page cursor that can be used to retrieve the next page of records (if any).
function M.tournament_records_list(tournamentId, ownerIds, limit, cursor, overrideExpiry)
end

---Submit a score and optional subscore to a tournament leaderboard. If the tournament has been configured with join required this will fail unless the owner has already joined the tournament.
---@param id string REQUIRED - The unique identifier for the tournament leaderboard to submit to.
---@param owner string REQUIRED - The owner of this score submission.
---@param username? string The owner username of this score submission, if it's a user.
---@param score? number The score to submit.
---@param subscore? number A secondary subscore parameter for the submission.
---@return table metadata The metadata you want associated to this submission. Some good examples are weather conditions for a racing game.
---@return table result The newly created leaderboard record.
function M.tournament_record_write(id, owner, username, score, subscore)
end

---Fetch one or more tournaments by ID.
---@param ids table REQUIRED - The table of tournament ids.
---@return table tournamentIDs List of tournament records.
function M.tournaments_get_id(ids)
end

---Users

---Update account, storage, and wallet information simultaneously.
---@param accountUpdates table REQUIRED - List of account information to be updated.
---@param storageWrites table REQUIRED - List of storage objects to be updated.
---@param walletUpdates table REQUIRED - List of wallet updates to be made.
---@param updateLedger? boolean Whether to record this wallet update in the ledger.
---@return table storageWriteAcks A list of acks with the version of the written objects.
---@return table walletUpdateAcks A list of wallet updates results.
function M.multi_update(accountUpdates, storageWrites, walletUpdates, updateLedger)
end

---Ban one or more users by ID.
---@param userIds table REQUIRED - A table of user IDs to ban.
function M.users_ban_id(userIds)
end

---Fetch one or more users by ID.
---@param userIds table REQUIRED - A Lua table of user IDs to fetch.
---@return table users A table of user record objects.
function M.users_get_id(userIds)
end

---Fetch one or more users randomly.
---@param count number REQUIRED - The number of users to fetch.
---@return table users A list of user record objects.
function M.users_get_random(count)
end

---Fetch one or more users by username.
---@param usernames table REQUIRED - A table of usernames to fetch.
---@return table users A table of user record objects.
function M.users_get_username(usernames)
end

---Unban one or more users by ID.
---@param userIds table REQUIRED - A table of user IDs to unban.
function M.users_unban_id(userIds)
end

---Utils

---Decrypt an aes128 encrypted string.
---@param input string REQUIRED - The string to be decrypted.
---@param key string REQUIRED - The 16 Byte decryption key.
---@return string clearText The deciphered input.
function M.aes128_decrypt(input, key)
end

---aes128 encrypt a string input.
---@param input string REQUIRED - The string which will be aes128 encrypted.
---@param key string REQUIRED - The 16 Byte encryption key.
---@return string cipherText The ciphered input.
function M.aes128_encrypt(input, key)
end

---Decrypt an aes256 encrypted string.
---@param input string REQUIRED - The string to be decrypted.
---@param key string REQUIRED - The 32 Byte decryption key.
---@return string clearText The deciphered input.
function M.aes256_decrypt(input, key)
end

---aes256 encrypt a string input.
---@param input string REQUIRED - The string which will be aes256 encrypted.
---@param key string REQUIRED - The 32 Byte encryption key.
---@return string cipherText The ciphered input.
function M.aes256_encrypt(input, key)
end

---Decode a base16 encoded string.
---@param input string REQUIRED - The string to be decoded
---@return string output Decoded string.
function M.base16_decode(input)
end

---base16 encode a string input.
---@param input string REQUIRED - The string to be encoded.
---@return string output Encoded string.
function M.base16_encode(input)
end

---Decode a base64 encoded string.
---@param input string REQUIRED - The string which will be base64 decoded.
---@return string output Decoded string.
function M.base64_decode(input)
end

---Base64 encode a string input.
---@param input string REQUIRED - The string which will be base64 encoded.
---@return string output Encoded string.
function M.base64_encode(input)
end

---Decode a base64 URL encoded string.
---@param input string REQUIRED - The string to be decoded.
---@return string output Decoded string.
function M.base64url_decode(input)
end

---Base64 URL encode a string input.
---@param input string REQUIRED - The string which will be base64 URL encoded.
---@return string output Encoded string.
function M.base64url_encode(input)
end

---Compare hashed input against a plaintext input.
---@param hash string REQUIRED - The bcrypted input string.
---@param plaintext string REQUIRED - Plaintext input to compare against.
---@return boolean result True if they are the same, false otherwise.
function M.bcrypt_compare(hash, plaintext)
end

---Generate one-way hashed string using bcrypt.
---@param input string REQUIRED - The input string to bcrypt.
---@return string hash Hashed string.
function M.bcrypt_hash(input)
end

---Parses a CRON expression and a timestamp in UTC seconds, and returns the next matching timestamp in UTC seconds.
---@param expression string REQUIRED - A valid CRON expression in standard format, for example "0 0 * * *" (meaning at midnight).
---@param timestamp number REQUIRED - A time value expressed as UTC seconds.
---@return number next_ts The next UTC seconds timestamp (number) that matches the given CRON expression, and is immediately after the given timestamp.
function M.cron_next(expression, timestamp)
end

---Read file from user device.
---@param relPath string REQUIRED - Relative path to the file to be read.
---@return string fileContent The read file contents.
function M.file_read(relPath)
end

---Create a HMAC-SHA256 hash from input and key.
---@param input string REQUIRED - The input string to hash.
---@param key string REQUIRED - The hashing key.
---@return string mac Hashed input as a string using the key.
function M.hmac_sha256_hash(input, key)
end

---Send a HTTP request that returns a data type containing the result of the HTTP response.
---@param url string REQUIRED - The URL of the web resource to request.
---@param method string REQUIRED - The HTTP method verb used with the request.
---@param headers? table A table of headers used with the request
---@param content? string The bytes to send with the request.
---@param timeout? number Timeout of the request in milliseconds.
---@return table returnVal Code, Headers, and Body response values for the HTTP response.
function M.http_request(url, method, headers, content, timeout)
end

---Decode the JSON input as a Lua table.
---@param jsonString string REQUIRED - The JSON encoded input.
---@return table jsonData Decoded JSON input as a Lua table.
function M.json_decode(jsonString)
end

---Encode the input as JSON.
---@param value table REQUIRED - The input to encode as JSON .
---@return string jsonBytes The encoded JSON string.
function M.json_encode(value)
end

---Generate a JSON Web Token.
---@param signingMethod string REQUIRED - The signing method to be used, either HS256 or RS256.
---@param signingKey string REQUIRED - The signing key to be used.
---@param claims table REQUIRED - The JWT payload.
---@return string token The newly generated JWT.
function M.jqt_generate(signingMethod, signingKey, claims)
end

---Create an md5 hash from the input.
---@param input string REQUIRED - The input string to hash.
---@return string hash A string with the md5 hash of the input.
function M.md5_hash(input)
end

---Create a RSA encrypted SHA256 hash from the input.
---@param input string REQUIRED - The input string to hash.
---@param key string REQUIRED - The RSA private key.
---@return string signature A string with the RSA encrypted SHA256 hash of the input.
function M.rsaSHA256Hash(input, key)
end

---Create an SHA256 hash from the input.
---@param input string REQUIRED - The input string to hash.
---@return string hash A string with the SHA256 hash of the input.
function M.sha256_hash(input)
end

---Execute an arbitrary SQL query and return the number of rows affected. Typically an "INSERT", "DELETE", or "UPDATE" statement with no return columns.
---@param query string REQUIRED - A SQL query to execute.
---@param parameters table REQUIRED - Arbitrary parameters to pass to placeholders in the query.
---@return number count A list of matches matching the parameters criteria.
function M.sql_exec(query, parameters)
end

---Execute an arbitrary SQL query that is expected to return row data. Typically a "SELECT" statement.
---@param query string REQUIRED - A SQL query to execute.
---@param parameters table REQUIRED - Arbitrary parameters to pass to placeholders in the query.
---@return table result A table of rows and the respective columns and values.
function M.sql_query(query, parameters)
end

---Get the current UTC time in milliseconds using the system wall clock.
---@return number t A number representing the current UTC time in milliseconds.
function M.time()
end

---Convert the 16-byte raw representation of a UUID into the equivalent 36-character standard UUID string representation. Will raise an error if the input is not valid and cannot be converted.
---@param uuid_bytes string REQUIRED - The UUID bytes to convert.
---@return string u A string containing the equivalent 36-character standard representation of the UUID.
function M.uuid_bytes_to_string(uuid_bytes)
end

---Convert the 36-character string representation of a UUID into the equivalent 16-byte raw UUID representation. Will raise an error if the input is not valid and cannot be converted.
---@param uuid_string string REQUIRED - The UUID string to convert.
---@return string u A string containing the equivalent 16-byte representation of the UUID.
function M.uuid_string_to_bytes(uuid_string)
end

---Generate a version 4 UUID in the standard 36-character string representation.
---@return string u The newly generated version 4 UUID identifier string.
function M.uuid_v4()
end

---Wallets

---List all wallet updates for a particular user from oldest to newest.
---@param userId string REQUIRED - The ID of the user to list wallet updates for.
---@param limit? number Limit number of results.
---@param cursor? string Pagination cursor from previous result. If none available set to nil or "" (empty string).
---@return table itemsTable A table containing wallet entries with Id, UserId, CreateTime, UpdateTime, Changeset, Metadata parameters.
---@return string newCursor Pagination cursor.
function M.wallet_ledger_list(userId, limit, cursor)
end

---Update the metadata for a particular wallet update in a user's wallet ledger history. Useful when adding a note to a transaction for example.
---@param itemId string REQUIRED - The ID of the wallet ledger item to update.
---@param metadata table REQUIRED - The new metadata to set on the wallet ledger item.
---@return table itemTable The updated wallet ledger item.
function M.wallet_ledger_update(itemId, metadata)
end

---Update one or more user wallets with individual changesets. This function will also insert a new wallet ledger item into each user's wallet history that tracks their update.
---@param updates table REQUIRED - The set of user wallet update operations to apply.
---@param updateLedger? boolean Whether to record this update in the ledger.
---@return table updateWallets A list of wallet update results.
function M.wallets_update(updates, updateLedger)
end

---Update a user's wallet with the given changeset.
---@param userId string REQUIRED - The ID of the user whose wallet to update.
---@param changeset table REQUIRED - The set of wallet operations to apply.
---@param metadata? table Additional metadata to tag the wallet update with.
---@param updateLedger? boolean Whether to record this update in the ledger.
---@return table result The changeset after the update and before to the update, respectively.
function M.wallet_update(userId, changeset, metadata, updateLedger)
end

return M
