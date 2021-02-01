# IFSonI
https://www.ibm.com/support/knowledgecenter/en/ssw_ibm_i_74/ifs/rzaaxbasics.htm

https://www.scottklement.com/rpg/ifs_ebook/

https://www.mcpressonline.com/programming/rpg/reading-ifs-files-in-rpg

https://www.rpgpgm.com/2016/01/read-ifs-file-using-rpg.html

https://www.rpgpgm.com/2016/06/write-to-file-in-ifs-using-rpg.html


Traditionally, we've worked with a file system on OS/400 that was made up of libraries. Within each library are objects that are assigned a specific "object type" such as a file, a program or a command. Each object type has a strictly defined layout. Files, for example, contain members, which then contain records, which contain fields. Each of these pieces is given a strict definition of what it is, how it works, and how it can be used.

In order to make OS/400 capable of working with files and folders that adhere to all of these different rules, the Integrated File System (IFS) was born. In the IFS, many different file systems can be accessed using a common interface. Special directory names are used to denote which file system you're referring to. 

File |system	|Description	|Works Like |
/QSYS.LIB	| The traditional "Library file system"	|OS/400 |
/QDLS	| The "Document Library Services" (OfficeVision) file system	| MS-DOS |
/QOpenSys	| The "Open Systems" file system	| UNIX |
/ ("root")	| The "root" file system	| Windows |
