% matlab startup file
% 
% created by Srinivas Gorur-Shandilya at 1:44 , 31 March 2015. Contact me at http://srinivas.gs/contact/
% 
% This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. 
% To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/.


% mount a Network share 
% make sure airport is installed and linked to 
% (run sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport)

% add path to /use/local/bin so we can use homebrew, and a lot of other stuff
path1 = getenv('PATH');
if isempty(strfind(path1,':/usr/local/bin'))
    path1 = [path1 ':/usr/local/bin'];
end
setenv('PATH', path1);

disp('Checking to see if Emonetlab backup is online...')
if exist('/Volumes/home/')
	disp('Emonetlab backup is online.')
else
	disp('Emonetlab backup is not online.')
	% check if you're on the Yale network
	[~,wifi] = unix('airport -I');
	[~,a]=unix('ps aux | grep "Cisco" | wc -l');
	if ~isempty(strfind(wifi,'Yale')) || str2double(a) > 2
		disp('On Yale network, will try to mount Emonetlab backup...')
		unix('open -n /code/MATLAB/mount_emonetlab_backup.app --args -AppCommandLineArg');
		pause(2)
		% check if its online
		if exist('/Volumes/home/')
			disp('Emonetlab backup successfully mounted.')
		else
			% maybe took too long?
			
		end
	else
		disp('Not connected to Yale internet...')
		if ~isempty(strfind(getComputerName,'yale'))
			disp('On Yale VPN, will try to mount Emonetlab backup...')
			unix('open -n /code/MATLAB/mount_emonetlab_backup.app --args -AppCommandLineArg');
			pause(2)
			% check if its online
			if exist('/Volumes/home/')
				disp('Emonetlab backup successfully mounted.')
			end
		
		else
			warning('Cant mount Emonetlab backup.')
		end
	end
end


% Configuring POI library for Excel export...
javaaddpath('/code/core/poi_library/poi-3.8-20120326.jar');
javaaddpath('/code/core/poi_library/poi-ooxml-3.8-20120326.jar');
javaaddpath('/code/core/poi_library/poi-ooxml-schemas-3.8-20120326.jar');
javaaddpath('/code/core/poi_library/xmlbeans-2.3.0.jar');
javaaddpath('/code/core/poi_library/dom4j-1.6.1.jar');
disp('DONE')


% fix stupid figure sizes
set(0, 'DefaultFigurePosition', [-1790 200 1300 700]);

% % start the parallel pool
% parpool('local',4);

disp('All DONE!')
