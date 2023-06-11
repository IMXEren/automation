## Table of Contents
1. **Overview**
2. **Requirements**
3. **Setups**
4. **Updates**

### 1. OVERVIEW
The task to show all the **Material You Colors** in a [scene](https://i.imgur.com/zwTAs1X.jpg) with their *name* (eg. A1-100, N2-300) & *hexcode* (eg. #000000, \#FFFFFF). It can be called as a child task & return the result `%colorcode` to the parent. Also, stuffed with the **Hex Color Palette** (*Top-Right in Activity*) but *unfortunately, unable to return them, rather copies & write the hexcode on the focused element.*   
Demo [video](https://i.imgur.com/qViwmGH.mp4)

### 2. REQUIREMENTS
- Tasker
- Android 12+ Device

### 3. SETUPS
- Device Resolution: **2412x1080 px** (Creation)
- Device Resolution:  **2340x1080 px** (Tested; *No configuration required*)
- The colors are saved in `Tasker/temp/material_you_colors.json` file for generation of a faster output. You may click **Refresh** (top-right) on the scene to redo again.
- Font isn't necessary but you can set it up. One global variable is made by the task `%TextColor`. I didn't change it to the project or task variable because it won't show the text preview correctly when editing the scene.
- *Extras: Some Loading.. scene templates are also present; only one is used. You may delete them & their related actions or set `%load=0` to never show them.*

### 4. UPDATES
Taskernet [project link](https://taskernet.com/shares/?user=AS35m8k0QSchKA1x02SixFIhiL41a828J1qapOYfcEuyL2zSn%2FfJTN5WVSi01o18x6EAFb4%3D&id=Project%3AMaterial+You)

1. Material You Colors info is now saved in the JSON file which makes the reading superfast.
2. The colors are no longer saved inside the json file & rather inside the task variable `%my_json`.