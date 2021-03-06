function varargout = test_image(varargin)
% TEST_IMAGE M-file for test_image.fig
%      TEST_IMAGE, by itself, creates a new TEST_IMAGE or raises the existing
%      singleton*.
%
%      H = TEST_IMAGE returns the handle to a new TEST_IMAGE or the handle to
%      the existing singleton*.
%
%      TEST_IMAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST_IMAGE.M with the given input arguments.
%
%      TEST_IMAGE('Property','Value',...) creates a new TEST_IMAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_image_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_image_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test_image

% Last Modified by GUIDE v2.5 16-Mar-2014 22:20:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @test_image_OpeningFcn, ...
    'gui_OutputFcn',  @test_image_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before test_image is made visible.
function test_image_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test_image (see VARARGIN)

% Choose default command line output for test_image
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test_image wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_image_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in selectImageButton.
function selectImageButton_Callback(hObject, eventdata, handles)
% hObject    handle to selectImageButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%[filename pathname] = uigetfile({'*.jpg'}, 'File Selector');
%fullpathname = strcat(pathname,filename);
%image = fileread(fullpathname);

global originalImage imageInfo;

[pathname, userCanceled] = imgetfile;
if userCanceled
    return;
end

hideSliders(handles);
hideCannySliders(handles);
hideDropDown(handles);
hideCompareButtons(handles);

originalImage = imread(pathname);
imageInfo = imfinfo(pathname);
modifiedImage = originalImage;

axes(handles.originalAxes);
imshow(originalImage);
axes(handles.modifiedAxes);
imshow(originalImage);

% --- Executes on button press in resetButton.
function resetButton_Callback(hObject, eventdata, handles)
% hObject    handle to resetButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global originalImage modifiedImage;


hideSliders(handles);
hideCannySliders(handles);
hideDropDown(handles);
hideCompareButtons(handles);

modifiedImage = originalImage;
axes(handles.modifiedAxes);
imshow(modifiedImage);

% --------------------------------------------------------------------
function menu_noise_filters_Callback(hObject, eventdata, handles)
% hObject    handle to menu_noise_filters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function menu_basic_ops_Callback(hObject, eventdata, handles)
% hObject    handle to menu_basic_ops (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function bo_grayscale_Callback(hObject, eventdata, handles)
% hObject    handle to bo_grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global originalImage modifiedImage;

hideSliders(handles);
hideCannySliders(handles);
hideDropDown(handles);
hideCompareButtons(handles);

modifiedImage = rgb2gray(originalImage);
axes(handles.modifiedAxes);
imshow(modifiedImage);


% --------------------------------------------------------------------
function bo_negative_Callback(hObject, eventdata, handles)
% hObject    handle to bo_negative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global originalImage modifiedImage;

hideSliders(handles);
hideCannySliders(handles);
hideDropDown(handles);
hideCompareButtons(handles);

modifiedImage = 255-originalImage;
axes(handles.modifiedAxes);
imshow(modifiedImage);


% --- Executes on button press in rotateRightBtn.
function rotateRightBtn_Callback(hObject, eventdata, handles)
% hObject    handle to rotateRightBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global modifiedImage;

hideSliders(handles);
hideCannySliders(handles);
hideDropDown(handles);
hideCompareButtons(handles);

modifiedImage = imrotate(modifiedImage,-90);
axes(handles.modifiedAxes);
imshow(modifiedImage);


% --- Executes on button press in rotateLeftBtn.
function rotateLeftBtn_Callback(hObject, eventdata, handles)
% hObject    handle to rotateLeftBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global modifiedImage;

hideSliders(handles);
hideCannySliders(handles);
hideDropDown(handles);
hideCompareButtons(handles);

modifiedImage = imrotate(modifiedImage,90);
axes(handles.modifiedAxes);
imshow(modifiedImage);


% --------------------------------------------------------------------
function bo_mirror_Callback(hObject, eventdata, handles)
% hObject    handle to bo_mirror (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global modifiedImage;

hideSliders(handles);
hideCannySliders(handles);
hideDropDown(handles);
hideCompareButtons(handles);

modifiedImage = flipdim(modifiedImage,2);      %# Flips the columns, making a mirror image
axes(handles.modifiedAxes);
imshow(modifiedImage);


% --------------------------------------------------------------------
function menu_edge_detection_Callback(hObject, eventdata, handles)
% hObject    handle to menu_edge_detection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function slider_thresh_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_thresh_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function slider_min_thresh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_min_thresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes during object creation, after setting all properties.
function slider_max_thresh_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_max_thresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider_thresh_1_Callback(hObject, eventdata, handles)
% hObject    handle to slider_thresh_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global modifiedImage;
sliderValue = get(handles.slider_thresh_1,'Value');
sliderValue = round(sliderValue);
set(handles.text_thresh_1,'String', num2str(sliderValue));

edge_threshold(modifiedImage,sliderValue,handles)


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes on slider movement.
function slider_min_thresh_Callback(hObject, eventdata, handles)
% hObject    handle to slider_min_thresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global modifiedImage threshMin threshMax;

sliderValue = get(handles.slider_min_thresh,'Value');
sliderValue = round(sliderValue);

if(sliderValue > threshMax)
    threshMax = min(sliderValue+10,255);
    set(handles.slider_max_thresh,'Value',threshMax);
    set(handles.text_max_thresh, 'String',threshMax);
end

threshMin = sliderValue;

set(handles.text_min_thresh,'String', num2str(sliderValue));

canny_edge_threshold(modifiedImage,handles)


% --- Executes on slider movement.
function slider_max_thresh_Callback(hObject, eventdata, handles)
% hObject    handle to slider_max_thresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global modifiedImage threshMax threshMin;

sliderValue = get(handles.slider_max_thresh,'Value');
sliderValue = round(sliderValue);

if(sliderValue < threshMin)
    threshMin = max(sliderValue-10,0);
    set(handles.slider_min_thresh,'Value',threshMin);
    set(handles.text_min_thresh, 'String',threshMin);
end

threshMax = sliderValue;

set(handles.text_max_thresh,'String', num2str(sliderValue));

canny_edge_threshold(modifiedImage,handles)

% --------------------------------------------------------------------
% function edge_sobel_threshold(modifiedImage,thresh,handles)
% %Define a threshold value
% edgeImage = max(modifiedImage,thresh);
% edgeImage(edgeImage==round(thresh))= 0;
% 
% edgeImage = uint8(edgeImage);
% axes(handles.modifiedAxes);
% imshow(edgeImage);


% --------------------------------------------------------------------
function edge_threshold(modifiedImage,thresh,handles)
%Define a threshold value
modifiedImage = uint8(modifiedImage);
edgeImage = modifiedImage;


iSize = size(modifiedImage);
for X = 1:iSize(1),
    for Y = 1:iSize(2),
        if modifiedImage(X,Y) < thresh;
            edgeImage(X,Y) = 0;
        end
    end
end

axes(handles.modifiedAxes);
imshow(edgeImage);

% --------------------------------------------------------------------
function canny_edge_threshold(modifiedImage,handles)
global threshMax threshMin;

edgeImage = modifiedImage;

[r c]=size(edgeImage);
resimg(r,c)= 0;

for u = 2 : r-1
    for v = 2 : c-1
        if(edgeImage(u,v) > threshMax)
            resimg(u,v) = 255;
        else
            if(edgeImage(u,v) >= threshMin && edgeImage(u,v) <= threshMax )
                resimg(u,v) = 255;
            else
                if (edgeImage(u,v) < threshMin)
                    resimg(u,v) = 0;
                end
            end
        end
        
        if (edgeImage(u-1,v-1) > threshMax || edgeImage(u,v-1) > threshMax || edgeImage(u+1,v-1) > threshMax || edgeImage(u+1,v) > threshMax || edgeImage(u+1,v+1) > threshMax || edgeImage(u,v+1) > threshMax || edgeImage(u-1,v+1) > threshMax || edgeImage(u-1,v) > threshMax)
            resimg(u,v) = 255;
        else
            resimg(u,v) = 0;
        end
    end
end

edgeImage = resimg;
axes(handles.modifiedAxes);
imshow(edgeImage);

% --------------------------------------------------------------------
function hideSliders(handles)
global isThreshSliderVisible;
isThreshSliderVisible = false;
set(handles.slider_thresh_1, 'visible','off');
set(handles.text_thresh_1, 'visible','off');
set(handles.text_thresh_label, 'visible','off');

% --------------------------------------------------------------------
function hideCannySliders(handles)
global isCannySlidersVisible;
isCannySlidersVisible = false;
set(handles.canny_panel, 'visible','off');

% --------------------------------------------------------------------
function hideCompareButtons(handles)
global isCompareButtonsVisible;
isCompareButtonsVisible = false;
set(handles.compare_panel, 'visible','off');

% --------------------------------------------------------------------
function edge_sobel_Callback(hObject, eventdata, handles)
% hObject    handle to edge_sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global originalImage modifiedImage isThreshSliderVisible;
thresh = 100;

hideCannySliders(handles);
hideDropDown(handles);
hideCompareButtons(handles);

if (isThreshSliderVisible == false)
    set(handles.slider_thresh_1, 'visible','on');
    set(handles.text_thresh_1, 'visible','on');
    set(handles.text_thresh_label, 'visible','on');
    
    isThreshSliderVisible = true;
end

set(handles.slider_thresh_1,'Value',thresh);
set(handles.text_thresh_1, 'String',thresh);

modifiedImage = rgb2gray(originalImage);
modifiedImage = edge_sobel(modifiedImage);
%edge_sobel_threshold(modifiedImage,thresh,handles)
edge_threshold(modifiedImage,thresh,handles)

% --------------------------------------------------------------------
function edge_prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to edge_prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global originalImage modifiedImage isThreshSliderVisible;
thresh = 100;

hideCannySliders(handles);
hideDropDown(handles);
hideCompareButtons(handles);

if (isThreshSliderVisible == false)
    set(handles.slider_thresh_1, 'visible','on');
    set(handles.text_thresh_1, 'visible','on');
    set(handles.text_thresh_label, 'visible','on');
    
    isThreshSliderVisible = true;
end

set(handles.slider_thresh_1,'Value',thresh);
set(handles.text_thresh_1, 'String',thresh);

modifiedImage = rgb2gray(originalImage);
modifiedImage = edge_prewitt(modifiedImage);
edge_threshold(modifiedImage,thresh,handles);


% --------------------------------------------------------------------
function edge_roberts_Callback(hObject, eventdata, handles)
% hObject    handle to edge_roberts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global originalImage modifiedImage isThreshSliderVisible;
thresh = 100;

hideCannySliders(handles);
hideDropDown(handles);
hideCompareButtons(handles);

if (isThreshSliderVisible == false)
    set(handles.slider_thresh_1, 'visible','on');
    set(handles.text_thresh_1, 'visible','on');
    set(handles.text_thresh_label, 'visible','on');
    
    isThreshSliderVisible = true;
end
set(handles.slider_thresh_1,'Value',thresh);
set(handles.text_thresh_1, 'String',thresh);

modifiedImage = rgb2gray(originalImage);
modifiedImage = edge_roberts(modifiedImage);
edge_threshold(modifiedImage,thresh,handles);


% --------------------------------------------------------------------
function edge_canny_Callback(hObject, eventdata, handles)
% hObject    handle to edge_canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global originalImage modifiedImage isCannySlidersVisible threshMax threshMin;

threshMax = 100;
threshMin = 95;

hideSliders(handles);
hideDropDown(handles);
hideCompareButtons(handles);

if (isCannySlidersVisible == false)
    set(handles.canny_panel, 'visible','on');
    isCannySlidersVisible = true;
end
set(handles.slider_max_thresh,'Value',threshMax);
set(handles.slider_min_thresh,'Value',threshMin);
set(handles.text_max_thresh, 'String',threshMax);
set(handles.text_min_thresh, 'String',threshMin);

modifiedImage = rgb2gray(originalImage);
modifiedImage = edge_canny(modifiedImage);
canny_edge_threshold(modifiedImage,handles);


% --- Executes on selection change in filter_size.
function filter_size_Callback(hObject, eventdata, handles)
% hObject    handle to filter_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filter_size contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filter_size
%val = get(hObject,'Value');
%value = val+2;
contents = cellstr(get(hObject,'String'));
val = contents{get(hObject,'Value')};
value = str2num(val);
image_filter(value,handles);

% --- Executes during object creation, after setting all properties.
function filter_size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filter_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --------------------------------------------------------------------
function image_filter(size,handles)

global filterType isDropDownVisible originalImage modifiedImage imageInfo;

hideSliders(handles);
hideCannySliders(handles);
hideCompareButtons(handles);

if (isDropDownVisible == false)
    set(handles.filter_size, 'visible','on');
    isDropDownVisible = true;
end

switch filterType
case 'median' % User selects median.
    modifiedImage = filter_median(originalImage,size,imageInfo.ColorType);
case 'mean' % User selects mean.
    modifiedImage = filter_mean(originalImage,size,imageInfo.ColorType);
case 'min' % User selects min.
    modifiedImage = filter_min(originalImage,size,imageInfo.ColorType);
case 'max' % User selects max.
    modifiedImage = filter_max(originalImage,size,imageInfo.ColorType);
case 'alpha' % User selects max.
    modifiedImage = filter_alpha_trimmed_mean(originalImage,size,imageInfo.ColorType);
end
axes(handles.modifiedAxes);
imshow(modifiedImage);


% --------------------------------------------------------------------
function hideDropDown(handles)
global isDropDownVisible;
isDropDownVisible = false;
set(handles.filter_size, 'visible','off');

% --------------------------------------------------------------------
function filter_median_Callback(hObject, eventdata, handles)
% hObject    handle to filter_median (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filterType;
filterType  = 'median';
set(handles.filter_size,'Value',1);
image_filter(3,handles);

% --------------------------------------------------------------------
function filter_mean_Callback(hObject, eventdata, handles)
% hObject    handle to filter_mean (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filterType;
filterType  = 'mean';
set(handles.filter_size,'Value',1);
image_filter(3,handles);


% --------------------------------------------------------------------
function filter_min_Callback(hObject, eventdata, handles)
% hObject    handle to filter_min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filterType;
filterType  = 'min';
set(handles.filter_size,'Value',1);
image_filter(3,handles);


% --------------------------------------------------------------------
function filter_max_Callback(hObject, eventdata, handles)
% hObject    handle to filter_max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filterType;
filterType  = 'max';
set(handles.filter_size,'Value',1);
image_filter(3,handles);


% --------------------------------------------------------------------
function filter_alpha_Callback(hObject, eventdata, handles)
% hObject    handle to filter_alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filterType;
filterType  = 'alpha';
set(handles.filter_size,'Value',1);
image_filter(3,handles);


% --------------------------------------------------------------------
function bo_histogram_Callback(hObject, eventdata, handles)
% hObject    handle to bo_histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global originalImage;

hideSliders(handles);
hideCannySliders(handles);
hideDropDown(handles);
hideCompareButtons(handles);

get_histogram(originalImage);


% --- Executes on button press in select_2_image.
function select_2_image_Callback(hObject, eventdata, handles)
% hObject    handle to select_2_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global secondImage imageInfo;

[pathname, userCanceled] = imgetfile;
if userCanceled
    return;
end

hideSliders(handles);
hideCannySliders(handles);
hideDropDown(handles);

secondImage = imread(pathname);
imageInfo = imfinfo(pathname);

axes(handles.modifiedAxes);
imshow(secondImage);


% --- Executes on button press in calculateButton.
function calculateButton_Callback(hObject, eventdata, handles)
% hObject    handle to calculateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global originalImage secondImage;
compare_images(originalImage,secondImage);

% --------------------------------------------------------------------
function bo_compare_Callback(hObject, eventdata, handles)
% hObject    handle to bo_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global isCompareButtonsVisible

if (isCompareButtonsVisible == false)
    set(handles.compare_panel, 'visible','on');
    isCompareButtonsVisible = true;
end

hideSliders(handles);
hideDropDown(handles);
hideCannySliders(handles);


% --- Executes on button press in save_button.
function save_button_Callback(hObject, eventdata, handles)
% hObject    handle to save_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global modifiedImage;
axes(handles.modifiedAxes);
[filename, user_canceled] = imsave;
if user_canceled
    return;
end
