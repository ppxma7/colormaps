function cmap = digits(varargin)


if ~nargin
    ncols = 256;
    phases = 5;
else
    ncols = varargin{1};
    phases = varargin{2};
end

% cmaptemp = [1 1 0; 0 1 0; 0 1 1; 0 0 1; 1 0 1];
tmp = hsv(256);

chopped = round(256 ./ phases);

for ii = 1:phases
    %cmaptemp(ii,:) = mean(tmp(51*(ii-1)+(1:51),:));
    cmaptemp(ii,:) = mean(tmp( chopped*(ii-1)+(1:chopped), :));
end
% cmaptemp = tmp([2:3:14],:);


len = length(cmaptemp);
oldsteps = linspace(0, 1, len);
newsteps = linspace(0, 1, ncols);
cmap = zeros(ncols, 3);

for i=1:3
    % Interpolate over RGB spaces of colormap
    cmap(:,i) = min(max(interp1(oldsteps, cmaptemp(:,i), newsteps)', 0), 1);
end