function createfigure1(time1, y1,analitic1)
%CREATEFIGURE1(TIME1,Y1,S1,CDATASOURCE1,ANALITIC1,CDATASOURCE2)
%  TIME1:  scatter x
%  Y1:  scatter y
%  S1:  scatter s
%  CDATASOURCE1:  scatter c
%  ANALITIC1:  scatter y
%  CDATASOURCE2:  scatter c

%  Auto-generated by MATLAB on 07-Sep-2010 21:28:55

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold('all');

% Create scatter
scatter1 = scatter(time1,y1,'Marker','.',...
    'DisplayName','data 1',...
    'Parent',axes1);

% Create scatter
scatter2 = scatter(time1,analitic1,'Marker','*',...
    'DisplayName','analitic, time',...
    'Parent',axes1);

% Get xdata from plot
xdata1 = get(scatter1, 'xdata');
xdata2 = get(scatter2, 'xdata');
% Get ydata from plot
ydata1 = get(scatter1, 'ydata');
ydata2 = get(scatter2, 'ydata');
% Make sure data are column vectors
xdata1 = xdata1(:);
ydata1 = ydata1(:);
xdata2 = xdata2(:);
ydata2 = ydata2(:);

% Remove NaN values and warn
nanMask1 = isnan(xdata1(:)) | isnan(ydata1(:));
if any(nanMask1)
    warning('GenerateMFile:IgnoringNaNs', ...
        'Data points with NaN coordinates will be ignored.');
    xdata1(nanMask1) = [];
    ydata1(nanMask1) = [];
end

% Find x values for plotting the fit based on xlim
axesLimits1 = xlim(axes1);
xplot1 = linspace(axesLimits1(1), axesLimits1(2));

% Find coefficients for spline interpolant
fitResults1 = spline(xdata1, ydata1);
fitResults2 = spline(xdata2, ydata2);
% Evaluate piecewise polynomial
yplot1 = ppval(fitResults1, xplot1);
yplot2 = ppval(fitResults2, xplot1);
% Plot the fit
fitLine1 = plot(xplot1,yplot1,'DisplayName','   spline','Parent',axes1,...
    'Tag','spline',...
    'Color',[0 0 1]);
fitLine2 = plot(xplot1,yplot2,'DisplayName','   spline','Parent',axes1,...
    'Tag','spline',...
    'Color',[0 0 1]);

% Set new line in proper position
setLineOrder(axes1, fitLine1, scatter1);
setLineOrder(axes1, fitLine2, scatter2);

% Create legend
legend(axes1,'show');

%-------------------------------------------------------------------------%
function setLineOrder(axesh1, newLine1, associatedLine1)
%SETLINEORDER(AXESH1,NEWLINE1,ASSOCIATEDLINE1)
%  Set line order
%  AXESH1:  axes
%  NEWLINE1:  new line
%  ASSOCIATEDLINE1:  associated line

% Get the axes children
hChildren = get(axesh1,'Children');
% Remove the new line
hChildren(hChildren==newLine1) = [];
% Get the index to the associatedLine
lineIndex = find(hChildren==associatedLine1);
% Reorder lines so the new line appears with associated data
hNewChildren = [hChildren(1:lineIndex-1);newLine1;hChildren(lineIndex:end)];
% Set the children:
set(axesh1,'Children',hNewChildren);

