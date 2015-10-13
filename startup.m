% matlab startup file
% 
% created by Srinivas Gorur-Shandilya at 1:44 , 31 March 2015. Contact me at http://srinivas.gs/contact/
% 
% This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. 
% To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/.

% configure a email agent 
% disp('Configuring email account for Matlab Crash Reporter...')
% setpref('Internet', 'E_mail', 'matlabcrashreporter@gmail.com');
% setpref('Internet', 'SMTP_Username', 'matlabcrashreporter@gmail.com');
% setpref('Internet', 'SMTP_Password', '~~');
% setpref('Internet', 'SMTP_Server', 'smtp.gmail.com');
% props = java.lang.System.getProperties;
% props.setProperty('mail.smtp.auth','true');
% props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
% props.setProperty('mail.smtp.socketFactory.port', '465');

% % options for MATLAB web publisher
% disp('Setting up options for MATLAB publish...')
% options = struct('showCode',false,'format','latex','imageFormat','pdf','figureSnapMethod','print','stylesheet','srinivas_latex.xsl');

% mount a Network share 
% make sure airport is installed and linked to 
% (run sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport)
disp('Checking to see if Newton is online...')
if exist('/Volumes/emonetlab/')
	disp('Newton is online.')
else
	disp('Newton is not online.')
	% check if you're on the Yale network
	[~,wifi] = unix('airport -I');
	[~,a]=unix('ps aux | grep "Cisco" | wc -l');
	if ~isempty(strfind(wifi,'Yale')) || str2double(a) > 2
		disp('On Yale network, will try to mount Newton...')
		unix('open -n /code/MATLAB/MountNewton.app --args -AppCommandLineArg');
		pause(2)
		% check if its online
		if exist('/Volumes/emonetlab/')
			disp('Newton successfully mounted.')
		else
			% maybe took too long?
			warning('Newton not mounted for mysterious reasons...')
		end
	else
		disp('Not connected to Yale internet...')
		if ~isempty(strfind(getComputerName,'yale'))
			disp('On Yale VPN, will try to mount Newton...')
			unix('open -n ~/Documents/MATLAB/MountNewton.app --args -AppCommandLineArg');
			pause(2)
			% check if its online
			if exist('/Volumes/emonetlab/')
				disp('Newton successfully mounted.')
			end
		
		else
			warning('Cant mount newton.')
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
