
GO
CREATE TABLE [dbo].[SYS_Account](
	[Username] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[DisplayName] [nvarchar](50) NULL,
	[UserCreate] [bigint] NULL,
	[DateCreate] [datetime] NULL,
	[Expired] [datetime] NULL,
	[Status] [bit] NULL,
	[Role] [varchar](10) NOT NULL CONSTRAINT [DF_SYS_Account_Role]  DEFAULT ('khach'),
 CONSTRAINT [PK_SYS_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_Capability]    Script Date: 2/25/2019 10:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_Capability](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_SYS_Capability] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_Capability_Account]    Script Date: 2/25/2019 10:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_Capability_Account](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Account] [varchar](255) NOT NULL,
	[Capability] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SYS_Capability_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_Capability_Role]    Script Date: 2/25/2019 10:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_Capability_Role](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Role] [varchar](10) NOT NULL,
	[Capability] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SYS_Capability_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_GroupLayer]    Script Date: 2/25/2019 10:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_GroupLayer](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_SYS_GroupLayer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_GroupRole]    Script Date: 2/25/2019 10:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_GroupRole](
	[ID] [varchar](10) NOT NULL,
	[Name] [nvarchar](155) NULL,
 CONSTRAINT [PK_SYS_GroupRole] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_Layer]    Script Date: 2/25/2019 10:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_Layer](
	[ID] [varchar](255) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Url] [varchar](500) NOT NULL,
	[GroupID] [varchar](20) NULL,
	[NumericalOder] [int] NULL CONSTRAINT [DF_SYS_Layer_NumericalOder]  DEFAULT ((0)),
 CONSTRAINT [PK_SYS_Layer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_Layer_Account]    Script Date: 2/25/2019 10:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_Layer_Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Account] [varchar](255) NOT NULL,
	[Layer] [varchar](255) NOT NULL,
	[IsCreate] [bit] NULL,
	[IsDelete] [bit] NULL,
	[IsEdit] [bit] NULL,
	[IsView] [bit] NULL,
	[OutFields] [varchar](1000) NULL,
	[Definition] [varchar](1000) NULL,
	[QueryFields] [varchar](1000) NULL,
	[UpdateFields] [varchar](1000) NULL,
 CONSTRAINT [PK_SYS_Layer_Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_Layer_Role]    Script Date: 2/25/2019 10:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_Layer_Role](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Layer] [varchar](255) NOT NULL,
	[Role] [varchar](10) NOT NULL,
	[IsEdit] [bit] NULL,
	[IsDelete] [bit] NULL,
	[IsView] [bit] NULL,
	[IsCreate] [bit] NULL,
	[OutFields] [varchar](1000) NULL,
	[Definition] [varchar](1000) NULL,
	[QueryFields] [varchar](1000) NULL,
	[UpdateFields] [varchar](1000) NULL,
 CONSTRAINT [PK_SYS_Layer_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_Logger_Capability]    Script Date: 2/25/2019 10:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_Logger_Capability](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](255) NOT NULL,
	[TacVu] [nvarchar](1000) NOT NULL,
	[ThoiGian] [datetime2](7) NULL,
 CONSTRAINT [PK_SYS_Logger_Capability] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_Logger_Layer]    Script Date: 2/25/2019 10:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_Logger_Layer](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TacVu] [nvarchar](1000) NULL,
	[LopDuLieu] [varchar](255) NULL,
	[ThuocTinh] [varchar](500) NULL,
	[ThoiGian] [datetime2](7) NULL,
	[Username] [varchar](255) NULL,
 CONSTRAINT [PK_SYS_Logger_Layer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_Role]    Script Date: 2/25/2019 10:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_Role](
	[ID] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[GroupRole] [varchar](10) NULL,
 CONSTRAINT [PK_SYS_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SYS_Version]    Script Date: 2/25/2019 10:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_Version](
	[VersionCode] [varchar](20) NOT NULL,
	[ApplicationId] [varchar](100) NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[Link] [varchar](100) NOT NULL,
	[Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VersionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[SYS_Account]  WITH CHECK ADD  CONSTRAINT [FK_SYS_Account_SYS_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[SYS_Role] ([ID])
GO
ALTER TABLE [dbo].[SYS_Account] CHECK CONSTRAINT [FK_SYS_Account_SYS_Role]
GO
ALTER TABLE [dbo].[SYS_Capability_Account]  WITH CHECK ADD  CONSTRAINT [FK_SYS_Capability_Account_SYS_Capability] FOREIGN KEY([Capability])
REFERENCES [dbo].[SYS_Capability] ([ID])
GO
ALTER TABLE [dbo].[SYS_Capability_Account] CHECK CONSTRAINT [FK_SYS_Capability_Account_SYS_Capability]
GO
ALTER TABLE [dbo].[SYS_Capability_Account]  WITH CHECK ADD  CONSTRAINT [FK_SYS_Capability_Account_SYS_Capability_Account] FOREIGN KEY([Account])
REFERENCES [dbo].[SYS_Account] ([Username])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SYS_Capability_Account] CHECK CONSTRAINT [FK_SYS_Capability_Account_SYS_Capability_Account]
GO
ALTER TABLE [dbo].[SYS_Capability_Role]  WITH CHECK ADD  CONSTRAINT [FK_SYS_Capability_Role_SYS_Capability] FOREIGN KEY([Capability])
REFERENCES [dbo].[SYS_Capability] ([ID])
GO
ALTER TABLE [dbo].[SYS_Capability_Role] CHECK CONSTRAINT [FK_SYS_Capability_Role_SYS_Capability]
GO
ALTER TABLE [dbo].[SYS_Capability_Role]  WITH CHECK ADD  CONSTRAINT [FK_SYS_Capability_Role_SYS_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[SYS_Role] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SYS_Capability_Role] CHECK CONSTRAINT [FK_SYS_Capability_Role_SYS_Role]
GO
ALTER TABLE [dbo].[SYS_Layer]  WITH CHECK ADD  CONSTRAINT [FK_SYS_Layer_SYS_GroupLayer] FOREIGN KEY([GroupID])
REFERENCES [dbo].[SYS_GroupLayer] ([ID])
GO
ALTER TABLE [dbo].[SYS_Layer] CHECK CONSTRAINT [FK_SYS_Layer_SYS_GroupLayer]
GO
ALTER TABLE [dbo].[SYS_Layer_Account]  WITH CHECK ADD  CONSTRAINT [FK_SYS_Layer_Account_SYS_Account] FOREIGN KEY([Account])
REFERENCES [dbo].[SYS_Account] ([Username])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SYS_Layer_Account] CHECK CONSTRAINT [FK_SYS_Layer_Account_SYS_Account]
GO
ALTER TABLE [dbo].[SYS_Layer_Account]  WITH CHECK ADD  CONSTRAINT [FK_SYS_Layer_Account_SYS_Layer] FOREIGN KEY([Layer])
REFERENCES [dbo].[SYS_Layer] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SYS_Layer_Account] CHECK CONSTRAINT [FK_SYS_Layer_Account_SYS_Layer]
GO
ALTER TABLE [dbo].[SYS_Layer_Role]  WITH CHECK ADD  CONSTRAINT [FK_SYS_Layer_Role_SYS_Layer] FOREIGN KEY([Layer])
REFERENCES [dbo].[SYS_Layer] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SYS_Layer_Role] CHECK CONSTRAINT [FK_SYS_Layer_Role_SYS_Layer]
GO
ALTER TABLE [dbo].[SYS_Layer_Role]  WITH CHECK ADD  CONSTRAINT [FK_SYS_Layer_Role_SYS_Role] FOREIGN KEY([Role])
REFERENCES [dbo].[SYS_Role] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SYS_Layer_Role] CHECK CONSTRAINT [FK_SYS_Layer_Role_SYS_Role]
GO
ALTER TABLE [dbo].[SYS_Logger_Capability]  WITH CHECK ADD  CONSTRAINT [FK_SYS_Logger_Capability_SYS_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[SYS_Account] ([Username])
GO
ALTER TABLE [dbo].[SYS_Logger_Capability] CHECK CONSTRAINT [FK_SYS_Logger_Capability_SYS_Account]
GO
ALTER TABLE [dbo].[SYS_Logger_Layer]  WITH CHECK ADD  CONSTRAINT [FK_SYS_Logger_Layer_SYS_Layer] FOREIGN KEY([Username])
REFERENCES [dbo].[SYS_Layer] ([ID])
GO
ALTER TABLE [dbo].[SYS_Logger_Layer] CHECK CONSTRAINT [FK_SYS_Logger_Layer_SYS_Layer]
GO
ALTER TABLE [dbo].[SYS_Role]  WITH CHECK ADD  CONSTRAINT [FK_SYS_Role_SYS_GroupRole] FOREIGN KEY([GroupRole])
REFERENCES [dbo].[SYS_GroupRole] ([ID])
GO
ALTER TABLE [dbo].[SYS_Role] CHECK CONSTRAINT [FK_SYS_Role_SYS_GroupRole]
GO
/****** Object:  Trigger [dbo].[encryptPwd]    Script Date: 2/25/2019 10:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[encryptPwd] on [dbo].[SYS_Account]
after insert,update
as
  declare @upwd varchar(50)
  declare @upwd1 varchar(50)
  declare @uID varchar(50)

  begin
    select @upwd = i.Password, @uID= i.Username from inserted i;
	select @upwd1  = password from deleted where username = @uID;
	-- mật khẩu chưa mã hóa có nghĩa là đang cập nhật mật khẩu
	-- nếu mật khẩu cũ khác mật khẩu mới -> đổi mật khẩu
	if @upwd1 is null or @upwd <> @upwd1
		update SYS_Account set password=SUBSTRING(master.dbo.fn_varbintohexstr(HashBytes('MD5',@upwd+'_DITAGIS' )), 3, 32) where Username=@uID
  end



GO
/****** Object:  Trigger [dbo].[INSERT_SYS_ACCOUNT]    Script Date: 2/25/2019 10:05:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[INSERT_SYS_ACCOUNT] ON [dbo].[SYS_Account] FOR INSERT
AS
BEGIN
	DECLARE @ID VARCHAR(255) = (SELECT Username FROM INSERTED)
	DECLARE @ROLE VARCHAR(10)= (SELECT ROLE FROM INSERTED)
	INSERT INTO SYS_CAPABILITY_ACCOUNT(ACCOUNT,CAPABILITY) SELECT @ID AS ACCOUNT,CAPABILITY FROM SYS_Capability_ROLE WHERE ROLE = @ROLE
	INSERT INTO SYS_LAYER_ACCOUNT(LAYER,ACCOUNT,IsView,IsDelete,IsCreate,IsEdit,OutFields,Definition,QueryFields,UpdateFields) 
	SELECT LAYER,@ID AS ACCOUNT,IsView,IsDelete,IsCreate,IsEdit,OutFields,Definition,QueryFields,UpdateFields FROM SYS_LAYER_ROLE WHERE ROLE = @ROLE
END



GO
ALTER DATABASE [VWA_System] SET  READ_WRITE 
GO
