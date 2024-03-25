# check_required_reason_api_for_privacy_manifest_files_on_ios
Check required reason APIs for Privacy manifest files on iOS

## How to use
This Bash script searches for required reason APIs within your app's binary file.
### Step 1: Prepare Your App's Binary File
First, make sure your app's binary file is included within an IPA file.  You can create an IPA file from an archive of your application created through the archiving process in Xcode.

###  Step 2: Execute the Script
Open your terminal and execute the following commands to download and run the script:
```
$ git clone https://github.com/nekomimimi/check_ios_required_reason_api_for_privacy_manifest.git
$ cd check_ios_required_reason_api_for_privacy_manifest
$ ./check_api.sh /path/to/your/ios/executable/in/ipa
```
###  Viewing the Results
Upon executing the script, results will be displayed as follows, for example:

```
* File timestamp APIs

* System boot time APIs

* Disk space APIs
                 U _NSFileSystemFreeSize
                 U _NSFileSystemSize

* Active keyboard APIs

* User defaults APIs
                 U _NSUserDefaultsDidChangeNotification
                 U _OBJC_CLASS_$_NSUserDefaults
```
This output will help you verify the required reason APIs for your app's Privacy Manifest file.

