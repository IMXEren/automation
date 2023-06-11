\[comment\]: # You might think about my obsession with Imgur because of these projects. I apologize for any misunderstanding, but I primarily utilize Imgur for this project, such as for sharing and uploading memes.

## Table of Contents
1. **Overview**
2. **Requirements**
3. **Functions**
4. **Credits**
5. **Updates**
6. **Maintenance**

### 1. OVERVIEW
The manager can view, share, copy, download, upload, and delete media content on the user's imgur account. This feature is designed for the account's point of view and not for the public's point of view.

### 2. REQUIREMENTS
- Tasker
- Imgur Account
- Join\*
- AutoTools
- AutoNotification
- AutoApps\*
- Obsidian


***NOTE: This is tested on the Tasker (v6.1.12-rc)***

\* - There's no need to worry about these elements.

##### 1. Join
- Used for *sending media content links* to other devices
- Don't worry if you don't have Join, the action won't cause problem.

##### 2. AutoApps
- Used as *commands hub* for the entire project.
- **FREE** to download

##### 3. Obsidian
- For people unaware, it's a note taking app with Markdown Formatting Support (HTML as well)
- Optional
- Used only in the task **IM - Uploader (Obsidian)**

### 3. FUNCTIONS

#### A. PROFILE
*In this section, I'll document what the profile is actually meant for. This would be helpful if anyone wants to edit the project. The major profile is:*

##### 1. IM - Commander
The hub for *AutoApps Commands* from the required tasks inside the project.

- **IM - Command Center**
	Runs when commands are generated when the user act on the actions such as AutoNotification's notification action, switching modes, uploading, uploading error notifications, switching pages. [Screenshot](https://i.imgur.com/wRXCnrp.jpg)

NOTE: For the first time, after the user clicks the title/bottom etc. buttons, kindly click the *CANCEL* button for the task to run. For the following times, you won't have to. Demo [video](https://i.imgur.com/hc9CFIJ.mp4). Also, the task is set to *Abort Existing Task*, so the last clicked button would be the one on which the task operates.

#### B. TASKS
*In this section, I'll document what the tasks are actually meant for. This would be helpful if anyone wants to edit the project. The major tasks are these ones:*

##### 1. IM - Setup
The task to setup **IM Project** variables.

##### 2. IM - Mode
The task to set or provide the info on the mode the user is currently on. **Mode** is the way of accessing imgur i.e. *Authorised* (**Account**) & *Un-Authorised* (**Anon/Anonymous**). Both require an account but the *HTTP Request - Headers* is different. For to obtain the info on the *Anon* uploads, this [task](https://taskernet.com/shares/?user=AS35m8k0QSchKA1x02SixFIhiL41a828J1qapOYfcEuyL2zSn%2FfJTN5WVSi01o18x6EAFb4%3D&id=Task%3ASU%2B+-+ImgurUploads+SQL+DB) is made to save the necessary data inside a predefined **database** in *Tasker/database/imgur_uploads.db* consisting of the table *ImgurUploads* of 7 columns i.e. *id, date, time, path, link, deleteHash, type*. This task is part of the *previously-uploaded* project **[Screenshot Uploader+](https://www.reddit.com/r/tasker/comments/12qhlr5/project_share_share_upload_delete_your_recent/).**

*NOTE: The setup does ask for permission, if you ever want to access Imgur Anonymously. Denying it will make no such tasks related to Anon, operate.*

##### 3. IM - Gallery
The main task to display your Account Gallery. Choose the media content & click OK. Now, click on the suitable options from the list. [Screenshots](https://imgur.com/a/vjOfJnq)

##### 4. IM - AnonMode
The main task to display your Anon Gallery & further operate on it.

##### SUBTASKS
1. **IM - Checks**
    - Linked to **IM - Gallery** to check if *Client-ID & Client-Secret* is set and *Download path `%down_path`* is set.
1. **IM - Errors**
    - Linked to most of the tasks to *stop the parent task* (`%par2=<parent_task_name>`), *stop IM - Gallery* & flash an *error message* along with the name of the parent task.
2. **IM - Resources**
    - Linked to IM - Setup task to download & setup project related resources such as icons, fonts etc.
3. **IM - QS Tile**
    - The task to setup the Tasker Quick Settings Tile at 1st position with an *image* of choice (from my choice, haha). Long click the tile to run **IM - File Picker** *aka (Upload-er)*. Also, the tile is allowed to operate when the device is locked *(not necessary, so set accordingly \[used 2 times\])*.
4. **IM - File Picker**
    - The task let's the user choose from images or videos (multiple; one at a time with a limit of 50 media). Selection of a mix of image(s) or video(s) would definitely cause an error in uploading. For now, the output are URIs so they are used to copy the selected media content from the URI source to a specified temp path inside `%down_path/temp/uploads-%DATE_%TIME`, upload them using **IM - Uploader/ IM - Uploader (Obsidian)** & delete temp files & parent directory afterwards.
    - **SUBTASKS** *(Enable either of them; Look out for **Uploader** label at about A19)*
	    - **IM - Uploader:** Uploads the file even if error occurs. The error files are again copied to the folder inside errors with specific date & time. To know which files weren't uploaded, a persistent *AutoNotification* is provided with some actions:
	        - Touch: Open the folder in *File Explorer* (MiXplorer & Solid Explorer tested!). Also, deletes the folder if no files existed in it, in the first place
	        - Close: Cancels the notification
	        - Delete: Deletes the error files along with its folder
	    - **IM - Uploader (Obsidian)** *(Optional)*: For Obsidian Users. As a user of Obsidian, thought of making a table to display error files along with their *error info `%errmsg`* & their path in error folder. Kindly read the instructions inside the task. All AutoNotification's notification actions are same except for the *Touch* which opens the `Errors.md` document, if the url is specified to the variable `%errfile_url` in the task.
	    - **NOTE (For both tasks):** For uploading videos, disabling/not audio must be specified, which is already done. Disabled audio `%audio=1` in *Anon* mode & enabled audio `%audio=0` in *Account* mode. If you want to change this default, lookout for **Set Audio** label near A11 in respective tasks. Also, by **error files**, I'm referring to the images/videos which weren't uploaded.
1. **IM - Open As Link**
    - Open the selected media content in the browser of choice.
2. **IM - Share**
    - Shares only one selected media content.
3. **IM - Send with Join**
    - Send the selected media content to device(s).
4. **IM - Copy Image**
    - Copies the selected media content (image/\*)
    - **SUBTASKS**
        - **IM - Copy MediaHandler:** Retains only image/\* as video can't be copied. Furthermore, asks if the user wants to copy the media content in gif or image format for if gif is present.
        - **IM - Copy Image:** Copies images using the links. Copies each gif by *downloading > copying > deleting* the download if user accepted to copy in gif format.
5. **IM - Copy As Link**
    - Simply copies the links of the selected media content either in *SINGLE* mode (each link is copied individually) or *MULTIPLE* mode (links are combined & copied in a ordered list).
6. **IM - Download**
    - Download the selected media content & lastly notify with a persistent AutoNotification providing some actions.
        - Touch: Open the folder in *File Explorer* (MiXplorer & Solid Explorer tested!). Also, deletes the folder if no files existed in it, in the first place
        - Close: Cancels the notification
        - Copy: Copies the file path; only if one file is downloaded
        - Delete: Delete recently downloaded files & its folder
8. **IM - Delete**
    - Confirms with a dialog & permanently delete selected media content from Imgur.
9. **IM - AnonDelete**
    - Used only when deleting media over Anon mode to delete the data row from the database. 
10. **IM - Delete Downloads**
    - Linked to the AutoNotification's notification action *DELETE*.
11. **IM - Cancel Downloads**
    - Stops *IM - Gallery* & *IM - Download*. Deletes the remnant of the recently downloaded after confirmation.

#### C. SCENE
*In this section, I'll document what the scene is actually meant for. This would be helpful if anyone wants to edit the project. The major scene is:*

##### 1. IM - Gallery PN
The scene to display page number which starts from 0.

### 4. CREDITS
- Icons - Flaticons

### 5. UPDATES
Released - April 18, 2023

Last Updated - April 18, 2023

v18.04.23

Taskernet [project link](https://taskernet.com/shares/?user=AS35m8k0QSchKA1x02SixFIhiL41a828J1qapOYfcEuyL2zSn%2FfJTN5WVSi01o18x6EAFb4%3D&id=Project%3AImgur+Manager) & [database task for AnonMode (Optional)](https://taskernet.com/shares/?user=AS35m8k0QSchKA1x02SixFIhiL41a828J1qapOYfcEuyL2zSn%2FfJTN5WVSi01o18x6EAFb4%3D&id=Task%3ASU%2B+-+ImgurUploads+SQL+DB)

### 6. MAINTENANCE
I'll try my best to make the project bugs free & work without much configuration needed on the user's end. If you face any errors, feel free to contact me. Hope you like this project!