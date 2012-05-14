# Obexftp client
This gem is a modest Obexftp client/interface written in Ruby. The goal is to browse easier the contents of your bluetooth devices by using the command line.

## Requirements
The gem works with the command line util obexftp. Consequently, obexftp needs to be installed on your system to use this gem.

On Ubuntu :
```
sudo apt-get install obexftp
```

## How to

### How to install ?
1) Clone the git repository;
2) Run bundle install into the project source folder
3) Run rake install to install the gem as CLI program for your system.

### How to connect to my device ?
```
obexftp_client 6C:9B:02:87:AA:AA
```
Replace 6C:9B:02:87:AA:AA by the MAC address of your bluetooth device.

### How to list the files ?
Use the command ls.

```
/ >
ls
Browsing 6C:9B:02:87:AA:AA ...
Connecting..\done
Tried to connect for 67ms
Receiving "/"... Sending ""...|done
-done
Disconnecting..\done
R-   Memory card
R-   Graphics
R-   Music files
R-   Themes
R-   Tones
R-   Video clips
R-   Images
R-   Recordings
R-   Received files
/ >
```

### How to change of directory ?
Use the command cd followed by the name of the folder surrounded by ". (cd "Memory card", cd "Tones")

```
Browsing 6C:9B:02:87:AA:AA ...
Connecting..\done
Tried to connect for 67ms
Receiving "/"... Sending ""...|done
-done
Disconnecting..\done
R-   Memory card
R-   Graphics
R-   Music files
R-   Themes
R-   Tones
R-   Video clips
R-   Images
R-   Recordings
R-   Received files
/ >
cd "Memory card"
/Memory card >
``

### How to download a file ?
Use the command download followed by the name of file surrounded by ".

```
...

F-   Photo0355.jpg
F-   Photo0356.jpg
F-   Photo0357.jpg
F-   Photo0358.jpg
F-   Photo0417.jpg
F-   Photo0418.jpg
/Memory card/Images >
download "Photo0418.jpg"
Browsing 6C:9B:02:87:AA:AA ...
Connecting..\done
Tried to connect for 70ms
Sending ""...|Sending "Memory card".../Sending "Images"...-done
Receiving "Photo0418.jpg"...-done
Disconnecting..\done

/Memory card/Images >
```

### How to download all the files of one directory ?
Yes you can! Use the command download_all. By example, to download all the files into the "Memory card/Images" folder, you can do :

```
...

/Memory card/Images >
download_all
Browsing 6C:9B:02:87:AA:AA ...
Connecting..\done
Tried to connect for 68ms
Receiving "/Memory card/Images"... Sending ""...|Sending "Memory card".../done
|done
Disconnecting../done
Browsing 6C:9B:02:87:AA:AA ...
Connecting..\done
Tried to connect for 62ms
Sending ""...|Sending "Memory card".../Sending "Images"...-done
Receiving "Photo0360.jpg"...|done
Disconnecting../done

Browsing 6C:9B:02:87:AA:AA ...

...
```

### How to quit ?
Write stop in the prompt.

## Story
I decided to code obexftp_client one January evening this year just because I had difficulties with Gnome 3.2 on my Ubuntu machine to connect and browse my pictures stored on my bluetooth devices (Nokia cellphone and Samsung Galaxy Tab tablet). Quick gem and pragmatic way to solve a problem ;).
