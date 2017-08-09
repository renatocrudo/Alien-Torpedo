/*
Project: Alien-Torpedo
Description: create database
Author: Renato Crudo
Date: 08/08/2017
*/

If Not exists(Select 1 From sys.databases Where name = 'dbAlien')
	begin
		create database dbAlien;
	end
