Mirror App Server 
========

This is the JSON server that accompanies the [Mirror iOS App][mirrorapp]. It provides the campus, building, room, and device information in JSON format so it can be displayed on the iOS device.

Requirements:

 * Web Server (Apache was only tested, however IIS should also work)
 * PHP 5.3+, PDO Support (enabled by default on most linux systems, separate IIS [extension][extension].)
 * MySQL or SQLite3 (both tested)
 * SSL (JSON calls are all made over SSL) with a valid SSL cert. Self-signed certs will not work.
 * Code must be installed in the json folder at the root directory of your host. 

[mirrorapp]: http://mirror.psu.edu 
[extension]: https://drupal.org/requirements/pdo

Setup:

The URL expected by the App is "https://" . MirrorUrl . "/json/". The MirrorUrl is entered on the screen by the user when loading the App for the first time. If this URL can not be found the app will not load the next screen. For example, if mirrorapp.example.edu is entered the App will try and load JSON from https://mirrorapp.example.edu/json/ .

1. Install index.php in the json folder on your server.
2. Run the appropriate MySQL or SQLite3 sql script included in the sql folder to create the database, or you can also use the included sample SQLite3 database.
3. Edit index.php to select your database type and settings.
4. Enter new AppleTV registrations into the database. 

No GUI is currently supplied for entering new AppleTV registrations. The SQLite3 sample database was created on OSX using [Base][base], but any SQLite3 compatible editor should work. We are currently using phpMyAdmin with MySQL.

[base]: https://itunes.apple.com/us/app/base-sqlite-editor/id402383384?mt=12

Testing:

The JSON server provides the following calls for the App.

  * https://(MirrorUrl)/json/?response=campuses
  * https://(MirrorUrl)/json/?response=buildings&id=(buildingid)
  * https://(MirrorUrl)/json/?response=rooms&id=(roomid)
  * https://(MirrorUrl)/json/?response=devices&id=(deviceid)
  * https://(MirrorUrl)/json/?response=devicetype&id=(devicetypeid) (0=AppleTV3,2 1=AppleTV2,1 2=AirServer 3=Reflector)
  
An easy way to test that your Mirror App Server is working is to check https://(MirrorUrl)/json/?response=campuses for the proper response. An example server is located at [https://mirrordemo.tlt.psu.edu/json/?response=campuses][https://mirrordemo.tlt.psu.edu/json/?response=campuses].

[https://mirrordemo.tlt.psu.edu/json/?response=campuses]: https://mirrordemo.tlt.psu.edu/json/?response=campuses

Security
-------
IP restriction can be used to limit which subnets the JSON is available. An example .htaccess file or Apache config would look something like this. Keep in mind the server would show as not available when trying to load the App outside of these subnets. A valid SSL cert is also required as self-signed certs are not allowed.

```
  # IP restriction
	<Files *>
      Order Deny,Allow
      Deny from All
      Allow from 12.34.56.78/17
      Allow from 1.2.3.4/24
	</Files>
  
  #Protect SQLite3 database
	<Files ~ “\.db$”>
	  Order Allow,Deny
	  Deny from All
	</Files>
```

Credits
-------

Jason Heffner, Sherwyn Saul, and Ben Brautigam at Penn State University for the proof of concept, vision, and coding work. Chuck Enfield, with telecomunications, for his support and help in deploying test bonjour networks. Chris Millet for his persistance and support in getting this project to its full potential. 

License
-------

Copyright 2014 Penn State University
Distributed under GPLv2 license.
