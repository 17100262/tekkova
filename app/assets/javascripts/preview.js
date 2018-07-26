(function (global, factory) {

	typeof exports === 'object' && typeof module !== 'undefined' ? module.exports = factory() :
	typeof define === 'function' && define.amd ? define(factory) :
	(global.FileUploadWithPreview = factory());
}(this, (function () { 'use strict';
var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var FileUploadWithPreview = function () {
    function FileUploadWithPreview(uploadId) {
        _classCallCheck(this, FileUploadWithPreview);

        if (!uploadId) {
            throw new Error('No uploadId found. You must initialize file-upload-with-preview with a unique uploadId.');
        }

        //Set initial variables
        this.uploadId = uploadId;
        this.cachedFileArray = [];

        //Grab the custom file container elements
        this.el = document.querySelector('.custom-file-container[data-upload-id="' + this.uploadId + '"]');
        if (!this.el) {
            throw new Error('Could not find a `custom-file-container` with the id of: ' + this.uploadId);
        }
        this.input = this.el.querySelector('input[type="file"]');
        this.inputLabel = this.el.querySelector('.custom-file-container__custom-file__custom-file-control');
        this.imagePreview = this.el.querySelector('.custom-file-container__image-preview');
        this.clearButton = this.el.querySelector('.custom-file-container__image-clear');

        //Make sure all elements have been attached
        if (!this.el || !this.input || !this.inputLabel || !this.imagePreview || !this.clearButton) {
            throw new Error('Cannot find all necessary elements. Please make sure you have all the necessary elements in your html for the id: ' + this.uploadId);
        }

        //Set the base64 background images
        this.baseImage = 'background-image.png';
        this.successPdf = 'background-image.png';
        this.successVideo = 'background-image.png';
        this.successFileAlt = 'background-image.png';
        this.successMultiple = 'background-image.png';

        //Set click events
        this.bindClickEvents();
    }

    _createClass(FileUploadWithPreview, [{
        key: 'bindClickEvents',
        value: function bindClickEvents() {
            var _this2 = this;

            //Grab the current instance
            var self = this;

            //Let's set the placeholder image
            this.imagePreview.style.backgroundImage = 'url("' + this.baseImage + '")';

            //Deal with the change event on the input
            this.input.addEventListener('change', function (event) {
                var _this = this;

                var selectedFilesCount = this.files.length;

                //In this case, the user most likely had hit cancel - which does something
                //a little strange if they had already selected a single or multiple images -
                //it acts like they now have *no* files - which isn't true. We'll just check here
                //for any cached images already captured, and proceed normally. If something *does* want
                //to clear their images, they'll use the clear button on the label we provide.
                if (selectedFilesCount === 0) {
                    $('.custom-file-container__image-clear').hide();
                    return;
                }

                //The first thing we want to do is clear whatever
                //we already have saved in self.cachedFileArray, as they are overwriting that now. The logic is that their
                //latest selection should be the one we listen to.
                self.cachedFileArray = [];

                //Let's loop through the selected images

                var _loop = function _loop(x) {
                    //Grab this index's file
                    var file = _this.files[x];

                    //File/files selected.
                    self.cachedFileArray.push(file);
                    var reader = new FileReader();
                    reader.readAsDataURL(file);

                    reader.onload = function (e) {
                        self.imagePreview.classList.add('custom-file-container__image-preview__active');
                        
                        //If more than one file was selected show a special input label and image
                        if (selectedFilesCount > 1) {
                            
                            self.inputLabel.innerHTML = selectedFilesCount + ' files selected';
                            self.imagePreview.style.backgroundImage = 'url(""' + self.successMultiple + '"")';
                            return;
                        }

                        //A single file was selected...
                         self.clearButton.style.display = 'block';
                        self.inputLabel.innerHTML = file.name;

                        //If png or jpg/jpeg, use the actual image
                        if (file.type.match('image/png') || file.type.match('image/jpeg')) {
                            self.imagePreview.style.backgroundImage = 'url("' + reader.result + '")';
                        } 
                    };
                };

                for (var x = 0; x < this.files.length; x++) {
                    _loop(x);
                }

                if (self.imageSelected) {
                    self.imageSelected(event);
                }
            }, true);

            //Listen for the clear button
            this.clearButton.addEventListener('click', function () {
               
                _this2.clearPreviewImage();
            }, true);
        }
    }, {
        key: 'selectImage',
        value: function selectImage() {
            this.input.click();
        }
    }, {
        key: 'clearPreviewImage',
        value: function clearPreviewImage() {
            this.input.value = '';
            this.inputLabel.innerHTML = '';
            this.imagePreview.style.backgroundImage = 'url("' + this.baseImage + '")';
            this.imagePreview.classList.remove('custom-file-container__image-preview__active');
            this.cachedFileArray = [];
        }
    }]);

    return FileUploadWithPreview;
}();

return FileUploadWithPreview;

})));
