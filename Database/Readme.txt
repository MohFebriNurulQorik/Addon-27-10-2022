Server Requirements :
- MSSQL 2016 (or higher)

Server initialisation :
- Setup MSSQL server 2016 (or higher) with mixed login (activate 'sa' user)
- Create "C:\ULT-Addon\Database\" folder for database file and log location. Or edit sql script to another location if needed. 
- Open MSSQL studio (or any db frontend) and run 00.scriptAddon_clean.sqlBy
- It will create database scheme 'ScaleAddon' with 'admin' user and default password for addon.


Addon Requirements :
- .NET framework runtime 4.8

Addon initialisation :
- extract addon archive to any location.
- open 'ScaleAddon.exe.config' and edit 'userSettings -> ScaleAddon.Properties.Settings' with your database connection setting
- run Scale.exe
- login using 'admin' and 'password' as password (WARNING: please change password via App menu 'Access -> user Profile'
- Set Acumatica connection, scale connection via 'Settings' menu


