# check_require_api_for_privacy_manifest_files_on_ios
Check required reason API for Privacy manifest files on iOS

## How to use
On your terminal.
```
$ git clone https://github.com/nekomimimi/check_ios_required_reason_api_for_privacy_manifest.git
$ check_api.sh your_ios_exec_file_path_in_your_ipa_file
```

and then it will display the result.
for exmple

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

