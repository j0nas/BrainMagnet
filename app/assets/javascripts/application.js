// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require bootstrap-slider
//= require app
//= require_tree .
//= #require bootstrap-sprockets


// Slider items

//Control Sidebar Options

var AdminLTEOptions = {
    enableControlSidebar: true,
    controlSidebarOptions: {
        //Which button should trigger the open/close event
        toggleBtnSelector: "[data-toggle='control-sidebar']",
        //The sidebar selector
        selector: ".control-sidebar",
        //Enable slide over content
        slide: true
    }
};

var moodSlider = $("#mood-slider").slider({
    tooltip: 'always',
    // todo: make tooltips display words, not numbers
    formatter: function () {
        var tooltip;
        switch ( moodSlider.getValue() ) {
            case 0:
            case 1:
            case 2:
                tooltip = "Extremely depressed";
                break;
            case 7: tooltip =  "Normal";
                break;
            default:
                tooltip=  "Some mood";
        }
        return tooltip;
    }
});