<p align="center"><img src="logo.png" height="128" alt="PowerShell Plugin"/></p>
<h1 align="center">Join Notification Plugin</h1>

Join notification  plugin for the [xyOps Workflow Automation System](https://xyops.io). Used to send a notification to your device using [Join](https://joinjoaomgcd.appspot.com/).

---

## Requirements
- **[PowerShell 7+](https://github.com/PowerShell/PowerShell)** (Cross-Platform)

For detailed instructions on installing PowerShell, please review the [Microsoft Learn Documentation](https://learn.microsoft.com/en-us/powershell/scripting/install/install-powershell).

### Platform Support:
- **Windows/Linux/macOS**: PowerShell 7+

---

## Parameters

- **Device ID Secret Variable Name** - The name of the variable that stores the device ID in the secret vault.
- **API Key Secret Variable Name** - The name of the variable that stores the API key in the secret vault.
- **Notification Title** [optional] - Override the default notification title of 'xyOps Alert'.
- **Notification Text** [optional] - Override the default notification text that contains the alert text provided by the xyOps job results.
- **Notification Uri** [optional] - Override the default Uri that points to the job details.

## Usage

You can use this action pluging with events and workflows. By default, the notification title will be 'xyOps Alert' with the included job result text provided by the xyOps job and the Uri will be set to the one provided by xyOps that links to the job details. Optionally, you can override those details using the parameters listed above.

## Setup

Below are steps to configure a secret vault and assign it to the plugin.

---

## Setting Up the Secret Vault

In order to use the Join Notification plugin, you need to create a secret vaul that contains the device ID and API key for your device.

#### Create Secret Vault

1. In the menu pane under the **Admin** section, navigate to **Secrets**.
2. Click **`New Vault...`**
3. Provide a *Secret Vault Title* as something recognizable, such as **Join Notifications**.
4. For *Plugin Access*, select **Join Notification** from the list.
5. Under **Secret Variables**, click **`New Variable...`**
6. Enter **XYOPS_JOIN_DEVICE_ID** for the *Variable Name* for the device ID.
7. Paste the device ID into the *Variable Value*.
8. Click **`Add Variable`**
9. Under **Secret Variables**, click **`New Variable...`**
10. Enter **XYOPS_JOIN_API_KEY** for the *Variable Name* for the API key.
11. Paste the API key value into the *Variable Value*.
12. Click **`Add Variable`**
13. Click **`Create Vault`**

#### Update Plugin Default Parameter Values
##### * Note that this is only necessary if in the **Create Secret Vault** section, you used different variable names than steps 6 and 10.

1. In the menu pane under **Admin** section, navigate to **Plugins**.
2. Click the **`Edit`** button to the right of the **Join Notification** plugin.
3. Scroll to the bottom to find the **Parameters** section.
4. Click **`Edit`** to the right of **Device ID Secret Variable Name**.
5. Set the **Default Value** to what was used in step 6 in the previous section.
6. Click **`Accept`**
7. Click **`Edit`** to the right of **API Key Secret Variable Name**.
8. Set the **Default Value** to what was used in step 10 in the previous section.
9. Click **`Accept`**
10. Click **`Save Changes`**

---

## Data Collection

This plugin **DOES NOT** collect any data or user information.

---
Author: Nick Dollimount
