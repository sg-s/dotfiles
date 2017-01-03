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

% paths for Multicore TSNE
[~,home_path] = system('cd ~; pwd');
a_path = strrep('~/anaconda3/bin','~',strtrim(home_path));
path1 = getenv('PATH');
if isempty(strfind(path1,[pathsep a_path]))
    path1 = [a_path pathsep path1];
end
setenv('PATH', path1);


% Configuring POI library for Excel export...
poi_library_path = '/code/poi-3.13/';
allfiles = dir([poi_library_path '*.jar']);
for i = 1:length(allfiles)
	javaaddpath([poi_library_path allfiles(i).name]);
end

disp('Configured POI library.')


% fix stupid figure sizes
set(0, 'DefaultFigurePosition', [-1790 200 1300 700]);

% check if all code is committed
isCodeCommitted

% check if the USB drive is connected
if exist('/Volumes/sgs_data','dir') == 7
	disp('USB drive connected')
else
	cprintf('red','Connect USB drive!')
	disp('Starting Dropbox if needed...')
	pause(5)
	[~,r] = system('pgrep Dropbox | wc -l');
	if ~r 
		disp('Dropbox not running. Will start Dropbox...')
		system('open /Applications/Dropbox.app');
	end
end

disp('All DONE!')
