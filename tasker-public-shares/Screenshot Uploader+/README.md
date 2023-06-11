## Table of Contents
1. **Overview**
2. **Requirements**
3. **Setup**
4. **Credits**
5. **Updates**
6. **Maintenance**

### 1. OVERVIEW
A project to enable users to share, upload\*, delete their recent screenshot instantly through the notification as well as *AutoShare-ing* media to upload\* and store that uploaded data in a database for management. *This project is unofficially forked from the project **Screenshot Uploader** by u/egerardoqd*; [original post](https://www.reddit.com/r/tasker/comments/cjuwcv/project_share_upload_your_screenshots_to_imgur/).

upload\* - Currently **imgur** only

*Note: For imgur, there's a limitation of 50 media in an hour with a maximum of 10 MB image (file/url) & 200 MB video (file & 1 min.) per media. Read **Rate Limits** in the [api docs](https://apidocs.imgur.com/) for more info.*

### 2. REQUIREMENTS
- Tasker
- Imgur Account
- Join\*
- AutoTools\*
- AutoShare\*

****NOTE: This is tested on the Tasker (v6.1.12-rc). I'm currently on Tasker (v6.1.22) & would do changes regarding it.****

\* - Thanks to the original project that this is also native in Tasker. The *replaceable* non-native elements are:

##### 1. Join
- Used for the *Send Push* action
- Don't worry if you don't have Join, the action won't cause problem.

##### 2. AutoTools Dialog
- Used as *cosmetics* in their respective tasks. [Screenshots](https://imgur.com/a/5cbzW2X)
- Used 3 times in 2 tasks
	1. SU+ - Upload To Imgur? (2)
	2. SU+ - Upload Imgur (1)
- Replaceable actions are already setup but *disabled by default*. To enable them, lookout A10, A21 (1) & A29 (2) in tasks respectively.

##### 3. AutoShare
- Used in the profile as a event context linked to **IM - Upload To Imgur?**
- Look for the solution in the original post's [comment](https://www.reddit.com/r/tasker/comments/cjuwcv/comment/evhw2sq).

### 3. SETUP
*NOTE: You'd notice that I wrote multiple times to **Read the instructions/labels**, it's because I can't explain everything here and it'd be better to look at them. Although, feel free to ask for help!*

##### 1. SU+ - New Screenshot
Read the instructions.

##### 2. SU+ - Setup
The main setup task of the project. Register an application on
https://api.imgur.com/oauth2/addclient to get client id & secret: 

1. Enter application name: "Anything"
2. Authorization type: *Oauth2 with a callback url*
3. Callback url: https://tasker.joaoapps.com/auth.html
4. Enter email: "email@com" (won't be used)
5. Enter description: "anything"

##### 3. SU+ - Upload Imgur
Read the instructions & proceed accordingly.

##### 4. SU+ - ImgurUploads SQL DB
Database path & table name is already set. Although, you may change it. If you change anything, do the same in SU+ - Setup: A30 & A31

##### 5. SU+ - Delete Imgur
If you change the database path/table name above, kindly update the same variables here.

##### 6. SU+ - URI To Path
Read the instructions if you use AutoShare v2.1.2 (currently in beta).

### 4. CREDITS
- u/egerardoqd - base project & idea
- u/HunterXProgrammer - helped in accomplishment of *uploading videos*
- u/OwlIsBack - including the *SU+ - Thumbnailer* from [here](https://www.reddit.com/r/tasker/comments/srqipl/help_create_thumbnail_from_video_file/)
- u/GlitchYou - including the *SU+ - MimeType* task in the project
- u/R_Burton - [SQL Example](https://www.reddit.com/r/tasker/comments/cc81vb/comment/etladaq/)
- u/WehZet - *create table action & label templates*  from [Clipboard Manager](https://www.reddit.com/r/tasker/comments/wo5dew/project_share_simple_clipboard_manager/)
- u/MrVulnerable - post presentation template idea
- Icons - Flaticons

### 5. UPDATES
Released - April 18, 2023

Last Updated - April 19, 2023

v19.04.23

Taskernet [link](https://taskernet.com/shares/?user=AS35m8k0QSchKA1x02SixFIhiL41a828J1qapOYfcEuyL2zSn%2FfJTN5WVSi01o18x6EAFb4%3D&id=Project%3AScreenshot+Uploader%2B)

### 6. MAINTENANCE
I'll try my best to make the project bugs free & work without much configuration needed on the user's end. If you face any errors, feel free to contact me. Hope you like this project! 

EDIT: Sorry for some errors, please update!