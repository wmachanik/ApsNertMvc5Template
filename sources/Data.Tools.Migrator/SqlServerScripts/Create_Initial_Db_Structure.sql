/****** Object:  Table [dbo].[Blobs]    Script Date: 12/18/2017 12:48:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blobs](
	[Id] [uniqueidentifier] NOT NULL,
	[Folder] [nvarchar](10) NOT NULL,
	[Extension] [nvarchar](10) NOT NULL,
	[ContentType] [nvarchar](100) NOT NULL,
	[ContentLength] [bigint] NOT NULL,
	[SourceFileName] [nvarchar](1000) NOT NULL,
	[UTCCreated] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsPurged] [bit] NOT NULL,
 CONSTRAINT [PK_Blobs_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[MessageTemplate] [nvarchar](max) NULL,
	[Level] [nvarchar](128) NULL,
	[TimeStamp] [datetime] NOT NULL,
	[Exception] [nvarchar](max) NULL,
	[Properties] [nvarchar](max) NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBlobs]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBlobs](
	[UserId] [int] NOT NULL,
	[BlobId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_UserBlobs] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[BlobId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserClaims]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRealms]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRealms](
	[UserId] [int] NOT NULL,
	[Realm] [int] NOT NULL,
 CONSTRAINT [PK_UserRealms] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[Realm] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserId] [int] NOT NULL,
	[Role] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[Role] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsBlocked] [bit] NOT NULL,
	[UTCCreation] [datetime2](7) NOT NULL,
	[MobilePhone] [nvarchar](30) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[MobilePhoneConfirmed] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetimeoffset](7) NULL,
	[AccessFailedCount] [tinyint] NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FullName] [nvarchar](256) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[CultureId] [nvarchar](10) NOT NULL,
	[UICultureId] [nvarchar](10) NOT NULL,
	[TimeZoneId] [nvarchar](100) NOT NULL,
	[PictureBlobId] [uniqueidentifier] NULL,
	[ScreenAutoLockMinutes] [int] NOT NULL,
 CONSTRAINT [PK__UserEnti__3214EC070425A276] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_Users] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blobs] ADD  CONSTRAINT [DF_Blobs_UTCCreated]  DEFAULT (getutcdate()) FOR [UTCCreated]
GO
ALTER TABLE [dbo].[Blobs] ADD  CONSTRAINT [DF_Blobs_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Blobs] ADD  CONSTRAINT [DF_Blobs_IsPurged]  DEFAULT ((0)) FOR [IsPurged]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)) FOR [IsBlocked]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UTCCreation]  DEFAULT (getutcdate()) FOR [UTCCreation]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_LockoutEnabled_1]  DEFAULT ((0)) FOR [LockoutEnabled]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_TwoFactorEnabled_1]  DEFAULT ((0)) FOR [TwoFactorEnabled]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_MobilePhoneConfirmed_1]  DEFAULT ((0)) FOR [MobilePhoneConfirmed]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_AccessFailedCount_1]  DEFAULT ((0)) FOR [AccessFailedCount]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_EmailConfirmed]  DEFAULT ((0)) FOR [EmailConfirmed]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CultureId]  DEFAULT (N'en-US') FOR [CultureId]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_UICultureId]  DEFAULT (N'en-US') FOR [UICultureId]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_TimeZoneId]  DEFAULT (N'UTC') FOR [TimeZoneId]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ScreenAutoLockMinutes]  DEFAULT ((0)) FOR [ScreenAutoLockMinutes]
GO
ALTER TABLE [dbo].[UserBlobs]  WITH CHECK ADD  CONSTRAINT [FK_UserBlobs_Blobs] FOREIGN KEY([BlobId])
REFERENCES [dbo].[Blobs] ([Id])
GO
ALTER TABLE [dbo].[UserBlobs] CHECK CONSTRAINT [FK_UserBlobs_Blobs]
GO
ALTER TABLE [dbo].[UserBlobs]  WITH CHECK ADD  CONSTRAINT [FK_UserFiles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserBlobs] CHECK CONSTRAINT [FK_UserFiles_Users]
GO
ALTER TABLE [dbo].[UserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo_UserClaims_dbo_Users_User_Id] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserClaims] CHECK CONSTRAINT [FK_dbo_UserClaims_dbo_Users_User_Id]
GO
ALTER TABLE [dbo].[UserRealms]  WITH CHECK ADD  CONSTRAINT [FK_UserRealms_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserRealms] CHECK CONSTRAINT [FK_UserRealms_Users]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo_UserRoles_dbo_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_dbo_UserRoles_dbo_Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Blobs] FOREIGN KEY([PictureBlobId])
REFERENCES [dbo].[Blobs] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Blobs]
GO
/****** Object:  StoredProcedure [dbo].[BlobsInsert]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BlobsInsert]

	@Id uniqueidentifier,
	@Folder nvarchar(10),
	@Extension nvarchar(10),
	@ContentType nvarchar(max),
	@ContentLength bigint,
	@SourceFileName nvarchar(max),
	@UTCCreated datetime2,
	@UserId int
	
AS
BEGIN

	INSERT INTO [Blobs]
	(
		[Id],
		[Folder],
		[Extension],
		[ContentType],
		[ContentLength],
		[SourceFileName],
		[UTCCreated]
	)
	VALUES
	(
		@Id,
		@Folder,
		@Extension,
		@ContentType,
		@ContentLength,
		@SourceFileName,
		@UTCCreated
	)
	
	-- INSERT BLOB x USER RELATION
		
	INSERT INTO [UserBlobs]
	(
		[UserId],
		[BlobId]
	)
	VALUES
	(
		@UserId,
		@Id
	)
	
END

GO
/****** Object:  StoredProcedure [dbo].[LogsSelect]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LogsSelect]

	@Id int = null,
	@Top int = 1000

AS
BEGIN

	SELECT TOP(@Top)
		*
	FROM 
		[Logs] L
	WHERE
		L.Id = CASE WHEN(@Id IS NULL) THEN L.Id ELSE @Id END
	ORDER BY
		[TimeStamp] DESC
					
END


GO
/****** Object:  StoredProcedure [dbo].[UsersManagementInsert]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersManagementInsert]

	@LockoutEnabled bit,
	@EmailConfirmed bit,
	@PasswordHash nvarchar(max),
	@SecurityStamp nvarchar(max),
	@UserName nvarchar(256),
	@FullName nvarchar(256),
	@Email nvarchar(256)

AS
BEGIN

	-- USER
	INSERT INTO [Users]
	(
		[LockoutEnabled],
		[EmailConfirmed],
		[PasswordHash],
		[SecurityStamp],
		[UserName],
		[FullName],
		[Email]
	)
	VALUES
	(
		@LockoutEnabled,
		@EmailConfirmed,
		@PasswordHash,
		@SecurityStamp,
		@UserName,
		@FullName,
		@Email
	)

	SELECT SCOPE_IDENTITY() AS Id

END

GO
/****** Object:  StoredProcedure [dbo].[UsersManagementSelect]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersManagementSelect]

	@Id int = null,
	@Email nvarchar(256) = null,
	@UserName nvarchar(256) = null

AS
BEGIN

	DECLARE @UserIds TABLE (UserId int)

	INSERT INTO @UserIds
		SELECT
			Id
		FROM 
			[Users] U
		WHERE 
			U.Id = CASE WHEN(@Id IS NULL) THEN U.Id ELSE @Id END
			AND U.Email = CASE WHEN(@Email IS NULL) THEN U.Email ELSE @Email END
			AND U.UserName = CASE WHEN(@UserName IS NULL) THEN U.UserName ELSE @UserName END

	-- Users
	SELECT
		U.*,
		B.*
	FROM
		[Users] U
		LEFT JOIN Blobs B ON (B.Id = U.PictureBlobId)
	WHERE
		U.Id IN (SELECT UserId FROM @UserIds)
	ORDER BY
		U.Id

	-- Claims
	SELECT [UC].* FROM [UserClaims] [UC] WHERE [UC].UserId IN (SELECT UserId FROM @UserIds)

	-- Realms
	SELECT [URM].* FROM [UserRealms] [URM] WHERE [URM].UserId IN (SELECT UserId FROM @UserIds)

	-- Roles
	SELECT [URL].* FROM [UserRoles] [URL] WHERE [URL].UserId IN (SELECT UserId FROM @UserIds)
					
END

GO
/****** Object:  StoredProcedure [dbo].[UsersManagementUpdate]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersManagementUpdate]

	@Id int,
	@IsBlocked bit,
	@SecurityStamp nvarchar(max)
	
AS
BEGIN

	UPDATE
		[Users]
	SET
		[IsBlocked] = @IsBlocked,
		[SecurityStamp] = @SecurityStamp
	WHERE
		Id = @Id
	
END

GO
/****** Object:  StoredProcedure [dbo].[UsersWithAdminProfileInsert]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersWithAdminProfileInsert]

	@MobilePhone nvarchar(30),
	@LockoutEnabled bit,
	@TwoFactorEnabled bit,
	@MobilePhoneConfirmed bit,
	@LockoutEndDateUtc datetimeoffset,
	@AccessFailedCount tinyint,
	@EmailConfirmed bit,
	@PasswordHash nvarchar(max),
	@SecurityStamp nvarchar(max),
	@UserName nvarchar(256),
	@FullName nvarchar(256),
	@Email nvarchar(256),
	@CultureId nvarchar(10) = null,
	@UICultureId nvarchar(10) = null,
	@TimeZoneId nvarchar(100) = null

AS
BEGIN

	-- USER
	INSERT INTO [Users]
	(
		[MobilePhone],
		[LockoutEnabled],
		[TwoFactorEnabled],
		[MobilePhoneConfirmed],
		[LockoutEndDateUtc],
		[AccessFailedCount],
		[EmailConfirmed],
		[PasswordHash],
		[SecurityStamp],
		[UserName],
		[FullName],
		[Email],
		[CultureId],
		[UICultureId],
		[TimeZoneId]
	)
	VALUES
	(
		@MobilePhone,
		@LockoutEnabled,
		@TwoFactorEnabled,
		@MobilePhoneConfirmed,
		@LockoutEndDateUtc,
		@AccessFailedCount,
		@EmailConfirmed,
		@PasswordHash,
		@SecurityStamp,
		@UserName,
		@FullName,
		@Email,
		@CultureId,
		@UICultureId,
		@TimeZoneId
	)
	
	SELECT SCOPE_IDENTITY() AS Id

END

GO
/****** Object:  StoredProcedure [dbo].[UsersWithAdminProfileSelect]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersWithAdminProfileSelect]

	@Id int = null,
	@Email nvarchar(256) = null,
	@UserName nvarchar(256) = null

AS
BEGIN

	DECLARE @UserIds TABLE (UserId int)

	INSERT INTO @UserIds
		SELECT
			Id
		FROM 
			[Users] U
		WHERE 
			U.Id = CASE WHEN(@Id IS NULL) THEN U.Id ELSE @Id END
			AND U.Email = CASE WHEN(@Email IS NULL) THEN U.Email ELSE @Email END
			AND U.UserName = CASE WHEN(@UserName IS NULL) THEN U.UserName ELSE @UserName END

	-- Users
	SELECT
		U.*,
		B.*
	FROM
		[Users] U
		LEFT JOIN Blobs B ON (B.Id = U.PictureBlobId)
	WHERE
		U.Id IN (SELECT UserId FROM @UserIds)
	ORDER BY
		U.Id

	-- Claims
	SELECT [UC].* FROM [UserClaims] [UC] WHERE [UC].UserId IN (SELECT UserId FROM @UserIds)

	-- Realms
	SELECT [URM].* FROM [UserRealms] [URM] WHERE [URM].UserId IN (SELECT UserId FROM @UserIds)

	-- Roles
	SELECT [URL].* FROM [UserRoles] [URL] WHERE [URL].UserId IN (SELECT UserId FROM @UserIds)
					
END

GO
/****** Object:  StoredProcedure [dbo].[UsersWithAdminProfileUpdate]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersWithAdminProfileUpdate]

	@Id int,
	@UserName nvarchar(256),
	@FullName nvarchar(256),
	@Email nvarchar(256),
	@CultureId nvarchar(10),
	@UICultureId nvarchar(10),
	@TimeZoneId nvarchar(100),
	@ScreenAutoLockMinutes int,
	@PictureBlobId uniqueidentifier = null
	
AS
BEGIN

	UPDATE
		[Users]
	SET
		[UserName] = @UserName,
		[FullName] = @FullName,
		[Email] = @Email,
		[CultureId] = @CultureId,
		[UICultureId] = @UICultureId,
		[TimeZoneId] = @TimeZoneId,
		[PictureBlobId] = @PictureBlobId,
		[ScreenAutoLockMinutes] = @ScreenAutoLockMinutes
	WHERE
		Id = @Id
	
END

GO
/****** Object:  StoredProcedure [dbo].[UsersWithIdentityUpdate]    Script Date: 12/18/2017 12:48:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsersWithIdentityUpdate]

	@Id int,
	@IsBlocked bit,
	@MobilePhone nvarchar(30),
	@LockoutEnabled bit,
	@TwoFactorEnabled bit,
	@MobilePhoneConfirmed bit,
	@LockoutEndDateUtc datetimeoffset,
	@AccessFailedCount tinyint,
	@EmailConfirmed bit,
	@PasswordHash nvarchar(max),
	@SecurityStamp nvarchar(max),
	@UserName nvarchar(256),
	@FullName nvarchar(256),
	@Email nvarchar(256)
	
AS
BEGIN

	UPDATE
		[Users]
	SET
		[IsBlocked] = @IsBlocked,
		[MobilePhone] = @MobilePhone,
		[LockoutEnabled] = @LockoutEnabled,
		[TwoFactorEnabled] = @TwoFactorEnabled,
		[MobilePhoneConfirmed] = @MobilePhoneConfirmed,
		[LockoutEndDateUtc] = @LockoutEndDateUtc,
		[AccessFailedCount] = @AccessFailedCount,
		[EmailConfirmed] = @EmailConfirmed,
		[PasswordHash] = @PasswordHash,
		[SecurityStamp] = @SecurityStamp,
		[UserName] = @UserName,
		[FullName] = @FullName,
		[Email] = @Email
	WHERE
		Id = @Id
	
END

GO
