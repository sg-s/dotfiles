% matlab startup file
% 
% created by Srinivas Gorur-Shandilya at 1:44 , 31 March 2015. Contact me at http://srinivas.gs/contact/
% 


% add path to /use/local/bin so we can use homebrew, and a lot of other stuff
path1 = getenv('PATH');
if isempty(strfind(path1,':/usr/local/bin'))
    path1 = [path1 ':/usr/local/bin'];
end
setenv('PATH', path1);

% % paths for Multicore TSNE
% [~,home_path] = system('cd ~; pwd');
% a_path = strrep('~/anaconda3/bin','~',strtrim(home_path));
% path1 = getenv('PATH');
% if isempty(strfind(path1,[pathsep a_path]))
%     path1 = [a_path pathsep path1];
% end
% setenv('PATH', path1);

% [~,home_path] = system('cd ~; pwd');
% a_path = strrep('~/anaconda/bin','~',strtrim(home_path));
% path1 = getenv('PATH');
% if isempty(strfind(path1,[pathsep a_path]))
%     path1 = [a_path pathsep path1];
% end
% setenv('PATH', path1);


if usejava('jvm')
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
	try
		isCodeCommitted
	catch
	end

end

% check if the USB drive is connected
% if exist('/Volumes/sgs_data','dir') == 7
% 	disp('USB drive connected')
% else
% 	cprintf('red','Connect USB drive!\n')
% end

% cprintf('green','Starting Dropbox if needed...\n')
% pause(5)
% [~,r] = system('pgrep Dropbox | wc -l');
% r = str2double(r);
% if r
% 	cprintf('green','Dropbox running\n') 
% else
% 	cprintf('red','Dropbox not running. Will start Dropbox...')
% 	system('open /Applications/Dropbox.app');
% % end

disp('All DONE!')
