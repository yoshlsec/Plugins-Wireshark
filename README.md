### Wireshark Plugins for Efficient Network Analysis

In this tutorial, I will describe the installation process of two Wireshark plugins developed using Lua scripting language for analysing network traffic. With the use of these plugins, potential attackers, zombie host, and victim IP addresses can be identified with ease. In the following paragraphs, you will see a description of how to download and set up these scripts on Windows and Unix-based operating systems.

![image](https://github.com/user-attachments/assets/da68d1b0-9a72-493f-85dc-e510dc7fb4c9)

---

### **1. Installation**

#### **Step 1: Clone the Repository**

Begin by cloning the plugin repository using Git:

```bash
git clone https://github.com/yoshlsec/Plugins-Wireshark/
```

#### **Step 2: Move the Lua Scripts**

Depending on your operating system, transfer the `.lua` files to the appropriate Wireshark plugins directory.

##### **For Windows:**
Use one of the following commands, replacing `<version>` with your Wireshark version folder.

- **Command Prompt (CMD):**

```cmd
move .\Plugins-Wireshark\src\*.lua "C:\Program Files\Wireshark\plugins\<version>\"
```

- **PowerShell:**

```powershell
Move-Item -Path .\Plugins-Wireshark\src\*.lua -Destination "C:\Program Files\Wireshark\plugins\<version>\"
```


##### **For Unix-Based Systems:**
You can use the `whereis wireshark` command to find its location.

```bash
mv ./Plugins-Wireshark/src/*.lua /usr/lib/wireshark/plugins/<version>
```

---

### **2. Verify Plugin Installation**

After moving the Lua files, restart Wireshark. Navigate to the **Tools** menu, where you should now see the new plugin options: **Sender** and **Receiver**.

![Plugin Menu Options](https://github.com/user-attachments/assets/02f3a400-7442-48de-8996-3e8a0fe9026d)

---

### **3. Customization**

If you prefer to organize the plugins under a subfolder in the **Tools** menu, modify the following line in the Lua code.

Default code:
```lua
register_menu("IP Sender Sorter", main, MENU_TOOLS_UNSORTED)
```

Subfolder code: (Add folders separated by a slash)
```lua
register_menu("Subfolder/IP Sender Sorter", main, MENU_TOOLS_UNSORTED)
```

This will group the plugin under **Tools > Subfolder > IP Sender Sorter**, creating a cleaner and more structured interface.

![Subfolder Example](https://github.com/user-attachments/assets/31f4179b-6096-483d-87da-5e252a9b4f6f)

---

Enjoy the plugins, in a future there will be more :) A star is appreciate 
