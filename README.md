# IFSonI
https://www.ibm.com/support/knowledgecenter/en/ssw_ibm_i_74/ifs/rzaaxbasics.htm

https://www.scottklement.com/rpg/ifs_ebook/

https://www.mcpressonline.com/programming/rpg/reading-ifs-files-in-rpg

https://www.rpgpgm.com/2016/01/read-ifs-file-using-rpg.html

https://www.rpgpgm.com/2016/06/write-to-file-in-ifs-using-rpg.html


Traditionally, we've worked with a file system on OS/400 that was made up of libraries. 
Within each library are objects that are assigned a specific "object type" such as a file, a program or a command.
Each object type has a strictly defined layout.
Files, for example, contain members, which then contain records, which contain fields.
Each of these pieces is given a strict definition of what it is, how it works, and how it can be used.

In order to make OS/400 capable of working with files and folders that adhere to all of these different rules, the Integrated File System (IFS) was born. In the IFS, many different file systems can be accessed using a common interface. Special directory names are used to denote which file system you're referring to. 

File system	|Description	|Works Like |
------------|---------------|-----------|
/QSYS.LIB	| The traditional "Library file system"	|OS/400 |
/QDLS	| The "Document Library Services" (OfficeVision) file system	| MS-DOS |
/QOpenSys	| The "Open Systems" file system	| UNIX |
/ ("root")	| The "root" file system	| Windows |


 ### There are seven file systems in the integrated file system:

    1.root (/)
    2.Open Systems (QOpenSys)
    3.Library (QSYS.LIB)
    4.Document Library Services (QDLS)
    5.LAN Server/400 (QLANSrv)
    6.Optical Support (QOPT)
    7.File Server (QFileSvr.400)

 ## root(/)

 The root (/) file system is designed to take full advantage of the stream file support and hierarchical directory structure of the integrated file system.
 It has the characteristics of the DOS and OS/2 file systems.

 Each component of the path name can be up to 255 characters long. The path can be up to 16 megabytes.
 There is no limit on the depth of the directory hierarchy other than program and space limits.

 ## QOpenSys

 The Open Systems (QOpenSys) file system is designed to be compatible with UNIX-based open system standards, 
 such as POSIX and XPG. Like the root (/) file system, it takes advantage of the stream file and directory support 
 provided by the integrated file system. In addition, it supports case-sensitive object names.

 The QOpenSys file system distinguishes between uppercase and lowercase characters when searching object names.

 ## QSYS.LIB

 The library (QSYS.LIB) file system supports the IBM® i library structure. It provides access to database files and all of the other IBM i object types that are managed by the library support.
 In general, the QSYS.LIB file system does not distinguish between uppercase and lowercase names of objects. 


 ## QDLS
 The Doument Library Services (QDLS) file system supports the folder objects. It provides access to documents and folders.
 QDLS does not distinguish between uppercase and lowercase in the names containing only the alphabetic characters a to z. 

 ## QLANSrv

 The LAN Server/400 (QLANSrv) file system provides access to the same directories and files that are accessed through the LAN Server/400 licensed program. It allows users of the IBM® i file server and IBM i applications to use the same data as LAN Server/400 clients.

 ## QOPT

 The Optical Support (QOPT) file system can be accessed through the integrated file system interface. 
 QOPT converts the lowercase English alphabetic characters a to z to uppercase when used in object names. Therefore, a search for object names that uses only those characters is not case-sensitive.

 ## QFileSvr.400

 The characteristics of the QFileSvr.400 file system are determined by the characteristics of the file system that are being accessed on the target system.
 
 ## CHGCURDIR
 
 You can specify a directory other than the home directory as your current directory at any time after you sign on by using the Change Current Directory (CHGCURDIR) CL command,  the chdir( ) API, or the fchdir() API.
 
 [More Info](https://www.ibm.com/support/knowledgecenter/en/ssw_ibm_i_73/ifs/rzaaxhomedir.htm)
 
 ## Accessing the IFS 
 
 [Using CL Commands](https://www.ibm.com/support/knowledgecenter/en/ssw_ibm_i_73/ifs/rzaaxaccessifs.htm)
 
 [Using API](https://www.ibm.com/support/knowledgecenter/en/ssw_ibm_i_73/ifs/rzaaxprogapi.htm)
 
 [Authorities](https://www.scottklement.com/rpg/ifs_ebook/basics.html)
 
