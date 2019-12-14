
DECLARE @UserId INT = 0

INSERT INTO [Users]
(
	[EmailConfirmed],
	[LockoutEnabled],
	[PasswordHash],
	[SecurityStamp],
	[UserName],
	[Email],
	[FullName],
	[CultureId],
	[UICultureId]
)
	VALUES
(
	1, /* email is confirmed */
	0, /* user will not get locked out */
	'AINCgbCLUSYjSnDrVGtCJCNphNWOAtcGScdSIOXYpGoezJoyFBEuZ7cTq3jpdVCEwg==', /* hash for 'password' */
	'79df49ad-983c-4680-8cd7-15c2058fd8e3', /* random GUID for security purposes (changed each time the user identity is updated) */
	'admin', /* initial user name */
	'admin@yourdomain.com', /* initial user email */
	'Administrator [Super User]', /* initial name */
	'en-US', /* Default date, time and number culture */
	'en-US' /* Default language translation culture */
)

SET @UserId = SCOPE_IDENTITY()

INSERT INTO UserRealms ([UserId], [Realm]) Values (@UserId, 1)

INSERT INTO UserRoles ([UserId], [Role]) Values (@UserId, 'SuperUser')
