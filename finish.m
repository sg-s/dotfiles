% checks and things to do before matlab shuts down

% eject the external USB drive

% check if there are uncommitted changes to any of the project repositories 
isCodeCommitted;

% unmount USB drive
if ismac
	disp('Attempting to unmount USB drive...')
	system('diskutil unmount /Volumes/sgs_data')
end