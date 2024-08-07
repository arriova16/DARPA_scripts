%loading cathodic and anodic files
%formatting and saving within folder

tld = 'Z:\UserFolders\ToriArriola\DARPA_updated\RawData';
% tld = 'Z:\UserFolders\ToriArriola\DARPA_updated\RawData\Whistlepig\Electrode_3and15';
% process_loc = 'Z:\UserFolders\ToriArriola\DARPA_updated\PreProcessedData\Whistlepig\DarpaBlock_Hybrid';
monkey_list = dir(tld);
monkey_list = monkey_list(3:end);

%% Formatting files in folder




%%

% data = struct(); ii = 1;
for m = 1:length(monkey_list) %monkey names
    %get list of electrodes
    electrode_list = dir(fullfile(tld, monkey_list(m).name, 'Electrode*'));
    for e = 1:size(electrode_list,1) %for each electrode
        electrode_split = strsplit(electrode_list(e).name, '_');
        electrode_number = electrode_split{2};
        if contains(electrode_number, 'and')
            and_idx = strfind(electrode_number, 'and');
            ee = [str2double(electrode_number(1:and_idx-1)), str2double(electrode_number(and_idx+3:end))];
        end

        subf_block= fullfile(tld, monkey_list(m).name, electrode_list(e).name, 'BlockTask');
        subf_amp = dir(fullfile(subf_block, 'Amp*'));
        block_files = dir(fullfile(subf_block, '*\*.rsp'));
        
        %  block_file_list = dir(fullfile(subf_block, '.rsp'));
        
        % 
        % % % block_subf = fullfile(tld, monkey_list(m).name, electrode_list(e).name, 'BlockTask');
        % block_subf_subf = dir(fullfile(block_subf)); 
        
         % fullfile(block_subf_subf(3).name)

        % threshold_file_list = dir(fullfile(subf, '*.rsp'));
 % 
        % block_tld = fullfile(tld, monkey_list(m).name, electrode_list(e).name, 'BlockTask');

        %keep saying the check path or file permissions
        % threshold_tld = fullfile(tld, monkey_list(m).name, electrode_list(e).name, 'ThresholdTask');
        % block = dir(fullfile(block_tld, "Amp*"));
        
        
        % block_file = dir(fullfile(block, '*rsp)'));
    
    end %electrode_list loop
    
    % ii =ii+1;

end %monkey_list loop
