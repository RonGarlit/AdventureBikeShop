﻿

// Helper for BikeShop JavaScript using Namespace pattern
// Just like JQuery does with the Dollar Sign.

var BikeShopJS = {
    // ** namespace pattern
    namespace: function (name) {

        // ** single var pattern
        var parts = name.split(".");
        var ns = this;

        // ** iterator pattern
        for (var i = 0, len = parts.length; i < len; i++) {
            // ** || idiom
            ns[parts[i]] = ns[parts[i]] || {};
            ns = ns[parts[i]];
        }

        return ns;
    }
};

// Browser history functions Using JQuery History.JS stuff for HTML5.

BikeShopJS.namespace("BikeShop").History = (function () {

    var pushingState = false;
    var History = window.History;
    var pop;

    // initialize history 
    var init = function (popCallback) {

        pop = popCallback;

        if (!History.enabled) return;

        // bind to statechange event (triggers at pushState call and when browser next/prev button is clicked)
        History.Adapter.bind(window, 'statechange', function (event) { // Note: We are using statechange instead of popstate

            // statechange fires 'too often'. here we prevent loading following a pushState call.
            if (pushingState == true) {
                pushingState = false;
                return;
            }

            // load page without layout and activate pager and filters
            var state = History.getState();

            pop(state);
        });
    }

    // push state onto history stack
    var push = function (state, name) {
        pushingState = true;
        History.pushState(null, name || "BikeShop", state);
    }

    // replace current state on history stack
    var replace = function (state, name) {
        pushingState = true;
        History.replaceState(null, name || "BikeShop", state);
    }

    // 'reveal' functions
    return {
        init: init,
        push: push,
        replace: replace
    };

})();

// general purpose utilities

BikeShopJS.namespace("BikeShop").Utils = (function () {

    // stops default events 
    var stopEvent = function (event) {
        event.preventDefault();
        event.stopPropagation();
        return false;
    }

    // general money formatting function
    function toMoney(number, places, symbol, thousand, decimal) {
        number = number || 0;
        places = !isNaN(places = Math.abs(places)) ? places : 2;

        symbol = symbol !== undefined ? symbol : "$";
        thousand = thousand || ",";
        decimal = decimal || ".";

        var negative = number < 0 ? "-" : "";
        var i = parseInt(number = Math.abs(+number || 0).toFixed(places), 10) + "";
        var j = (j = i.length) > 3 ? j % 3 : 0;

        return symbol + negative + (j ? i.substr(0, j) + thousand : "") +
            i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thousand) +
            (places ? decimal + Math.abs(number - i).toFixed(places).slice(2) : "");
    }

    return {
        stopEvent: stopEvent,
        toMoney: toMoney
    }

})();


// application specific shared code

BikeShopJS.namespace("BikeShop").App = (function () {

    // first method called in newly rendered page    

    var openPage = function () {

        // fades alert messages after 4 seconds
        $("#alert-success, #alert-failure").fadeIn(500).delay(3500).fadeOut(1000, function () {
            $(this).remove();
        });
    }

    //var updateCartOnPage = function (delta) {

    //    //update cart display
    //    var count = parseInt($("#cartcount").val(), 10) + delta;
    //    if (count < 0) count = 0;

    //    $("#cartcount").val(count);

    //    if (count == 0) {
    //        $("#countshow").html("");
    //        $("#thecart").css("background-color", "");
    //    }
    //    else {
    //        $("#countshow").html("(" + count + ")");
    //        $("#thecart").css("background-color", "orange").css("color", "white");
    //    }
    //};

    return {
        //updateCartOnPage: updateCartOnPage,
        openPage: openPage
    };

})();

// activate potential alerts when opening page

$(function () {

    var app = BikeShopJS.BikeShop.App;
    app.openPage();
});
