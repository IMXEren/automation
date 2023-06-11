## Table of Contents
1. **Overview**
2. **Requirements**
3. **Setups**
4. **Error Solutions**
5. **Credits**
6. **Updates**
7. **Maintenance**

### 1. OVERVIEW
Did you ever felt like having a *download option while listening music* in Spotify? Or tired of *sharing tracks/albums* to download them, say no more; [demo - SpotiFlyer](https://i.imgur.com/fDgtveh.mp4) app error, so testing in Spowlo [demo - Spowlo](https://i.imgur.com/gVkUI4M.mp4)

Here, I used an FOSS app [**SpotiFlyer**](https://github.com/Shabinder/SpotiFlyer)

- **SpotiFlyer:** - **Kotlin Multiplatform** Music Downloader, supports **Spotify, Youtube, Gaana, Jio-Saavn and SoundCloud**.
- **Features:**
	-   **Downloads**: Albums, Tracks and Playlists,etc
	-   **No ADS!**

You may make use of *intents/Browse URL* to share them to another app of choice (Eg: [Spowlo](https://github.com/BobbyESP/Spowlo))

### 2. REQUIREMENTS
- Tasker
- Spotify API
- AutoWeb
- AutoTools
- AutoApps
- AutoInput
- AutoNotification

***NOTE: This is tested on the Tasker (v6.1.12-rc)***

##### 1. Spotify API
- Visit the [Spotify Developer Dashboard](https://developer.spotify.com/dashboard) and create an app.
- Set the app's name, description and website to anything you like
- Save the app and then check its details. 
- Take note of its Client ID and Client Secret.
- Redirect URIs
	- **For AutoWeb:** https://joaoapps.com/autoweb
	- **For Tasker (HTTP Auth/Request):** https://tasker.joaoapps.com/auth.html

##### 2. AutoWeb
- Optional; One of two options (choices) for API calls
- Alternative: Tasker HTTP Auth/Request

##### 3. AutoTools
- Optional; only if you know how to create/manage **Scenes**
- Used to overlay the *download icon*

\### *Unfortunately, I am not currently a proficient Tasker user for scenes, otherwise I would have implemented it.*

##### 4. AutoApps
- Used to trigger task when you *click download*
- Used as *commands hub* for the project.
- **FREE** to download

##### 5. AutoInput
- Optional; if you don't need click actions
- Used to perform *clicks & back* actions

##### 6. AutoNotification
- In my case, the app doesn't inform whether the download was successful or failed
- And if it was failed, you can't determine which one was it (logically you can but a tiresome task)
- So, it is used to intercept the app's notifications & inform with flashes about the downloads
- Optional; if you don't want the features stated above

### 3. SETUPS
Please do read the Anchors/labels in the project.

##### 1. SFlyer - Setup & Info
**Note: For users with AutoWeb option, you don't need to run the task. Just read the instructions.**   

The task to setup **Project** variables used in HTTP Auth/Request.

##### 2. SpotiFlyer - Icon
**Note: For users who don't have AutoInput or AutoTools, Read the instructions.** 

- **Tap on Icon:** Download currently playing track
- **Long Tap on Icon:** Download currently playing track's album

##### 3. SpotiFlyer - Download On Click
**Note: For users who don't have AutoInput, disable all actions related to the app.**   

Read the instructions & proceed accordingly.

##### 4. SpotiFlyer - Downloads
**Note: For users who don't have AutoNotification, disable the profile.**   

Read the instructions & proceed accordingly.

### 4. ERROR SOLUTIONS
Here, I'll list possible solutions to the errors to my knowledge.

1. **AutoWeb Scopes**:    
*If you face timeout error after clicking Download & no flash pops, then do this:*    
   - Open AutoWeb > Your Web Services > Spotify API (Hold) > Re-authenticate    
*It might show an error* ***Illegal Scope.*** If so:    
   - Spotify API (Hold) > Edit API config > remove **user-read-birthdate** from **[scopes](https://i.imgur.com/oRKVDcs.jpg)** > check if Client-ID or Client-Secret is correct > Apply & again re-authenticate.    
 If it works, you'll be redirected to the AutoWeb app after 1s.    
 *Now, play a song (must) then click download.*
2. **Required Permissions By Tasker & Plugins**    
 *You might require to give permission for Apps - Tasker, AutoInput, AutoTools. There are two ways based on convenience (you decide):*    
    - **HOW TO:**
        - **ADB Shell over USB:** You'll have to connect your device to a PC and enter & run necessary commands in terminal. Thanks to DEV, it's made easier by simply installing Tasker Permissions program which manages everything you need. Tutorial [here](https://www.reddit.com/r/tasker/comments/psfumw/dev_tasker_permissions_helper_easy_advanced/). Also, you may grant the access to ADB Wifi (ADB Shell over Wifi) which is limited until you reboot the device.
        - **ADB Shell over Wifi:** You don't need a PC and can enter & run necessary commands in Tasker action *ADB Wifi* itself once you have granted the access.    
            - **METHODS OF GRANTING ACCESS**    
		        1.[LADB](https://www.reddit.com/r/tasker/comments/re8k68/howto_enable_adb_wifi_after_reboot_using_ladb_app/) (BASIC; PAID APP)    
		        2.[Termux](https://www.reddit.com/r/tasker/comments/rceljk/enable_adb_wifi_on_device_boot_android_11/) (ADVANCED; FREE APP)    
            - *Remember to turn on USB Debugging always while wireless debugging is off/on because once you get access to adb wifi in wireless debugging you can/should turn it off and you'll still have access to adb wifi using USB debugging. And as stated above, the granted access will be valid until device reboot.*    
            - Here's the taskernet [project](https://taskernet.com/shares/?user=AS35m8nMlqf8LZK%2BSxkCZop9Fu9q5wpeQT3onCjW9rY%2BFt9Qyh2PCE8xq29XYcDW6ZCsAI7FftE%3D&id=Project%3AADB+Additional+Permissions) which lists all the permission; Run the task to grant the neccessary permissions.
    - **NECESSARY PERMISSIONS FOR:**
        - **Tasker:** Write Secure Settings (android.permission.WRITE_SECURE_SETTINGS)
        - **AutoInput:** Write Secure Settings (android.permission.WRITE_SECURE_SETTINGS)
        - **AutoTools:** Write Secure Settings (android.permission.WRITE_SECURE_SETTINGS)

### 5. CREDITS
- Download Icon - Flaticon

### 6. UPDATES
Released - April 20, 2023

Last Updated - April 20, 2023

v20.04.23

Taskernet [project link](https://taskernet.com/shares/?user=AS35m8k0QSchKA1x02SixFIhiL41a828J1qapOYfcEuyL2zSn%2FfJTN5WVSi01o18x6EAFb4%3D&id=Project%3ASpotiFlyer)

### 7. MAINTENANCE
I'll try my best to make the project bugs free & work without much configuration needed on the user's end. If you face any errors, feel free to contact me. Hope you like this project!