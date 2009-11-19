<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
var mmid=${item.id};
var mmplugins="${item.plugins}";
var mmHost="http://localhost:8080";
//var mmHost="http://myxtools.appspot.com";

function loadcssjs(filename, filetype, where){
    if (filetype=="js"){ 
        var fileref=document.createElement("script")
        fileref.setAttribute("type","text/javascript")
        fileref.setAttribute("src", filename)
    }else if (filetype=="css"){
        var fileref=document.createElement("link")
        fileref.setAttribute("rel", "stylesheet")
        fileref.setAttribute("type", "text/css")
        fileref.setAttribute("href", filename)
    }
    if (typeof fileref!="undefined")
        if (where=="head") 
            document.getElementsByTagName("head")[0].appendChild(fileref);
        else 
            document.getElementsByTagName("body")[0].appendChild(fileref);
}

if (typeof(mmToolbar)!="object") {
    var mmToolbar = new Object();
    if (typeof jQuery != "function")  
        loadcssjs("http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js","js","head"); 
    CheckJQueryLoader(mmToolbar.id);
	loadcssjs(mmHost+"/toolbar/toolbar.css","css","head");
}

var mmTimeoutId;
function CheckJQueryLoader(toolbarId){
    if (typeof jQuery == "function"){
        clearTimeout(mmTimeoutId);
        loadToolbar();
    }else
        mmTimeoutId =  setTimeout("CheckJQueryLoader("+toolbarId+");",200);
}

mmToolbar.id=mmid;
mmToolbar.referrer=document.referrer;

mmToolbar.Notifier = {"notification":{"msgId":24346, "date":"08 Oct", "text":"We%20are%20happy%20to%20see%20you%20around%2C%20this%20is%20the%20mm%20bar%2C%20click%20on%20the%20different%20applications%20to%20experience%20how%20we%20can%20enrich%20your%20own%20site.", "link":""}};
mmToolbar.ImagesDir = "http://toolbar.mm.com/Graphics/";
mmToolbar.ToolbarHTML='${ToolbarHTML}';
mmToolbar.MinimizedHTML='${MinimizedHTML}';
mmToolbar.TempWiwiHTML='${TempWiwiHTML}';
mmToolbar.framework = {};
mmToolbar.framework.currentZIndex = 99999;

function loadToolbar(){
	var _body = document.getElementsByTagName("body")[0];
	var mmToolbarDiv = document.createElement("div");
	mmToolbarDiv.id = "mmToolbar";
	mmToolbarDiv.style.display = "";
	mmToolbarDiv.setAttribute("state", "off");
	mmToolbarDiv.innerHTML = mmToolbar.ToolbarHTML;
	
	var mmToolbarMinimizedDiv = document.createElement("div");
	mmToolbarMinimizedDiv.id = "mmToolbarMinimized";
	mmToolbarMinimizedDiv.style.display = "none";
	mmToolbarMinimizedDiv.innerHTML = mmToolbar.MinimizedHTML;
	
	var mmToolbarTempWiwiDiv = document.createElement("div");
	mmToolbarTempWiwiDiv.id = "mmToolbar_window_template";
	mmToolbarTempWiwiDiv.style.display = "block";
	mmToolbarTempWiwiDiv.setAttribute("class", "mmToolbar_window");
	mmToolbarTempWiwiDiv.innerHTML = mmToolbar.TempWiwiHTML;

    //jQuery("body").append(mmToolbarMinimizedDiv);
    jQuery("body").append(mmToolbarTempWiwiDiv);
    jQuery("body").append(mmToolbarDiv);
	RunStarterJs();
}

function RunStarterJs() {
    var searchProviders = [{"searchProviderIcon":"mm_logo.png?1254995542084", "searchProviderName":"Support Search", "searchQueryURL":"http://toolbar.mm.com/search.php?type=blog&q=AAAA&site_name=mm on getsatisfaction&site_url=http://www.getsatisfaction.com/mm"}, {"searchProviderIcon":"google.png", "searchProviderName":"Web Search", "searchQueryURL":"http://toolbar.mm.com/search.php?type=web&q=AAAA&site_name=mm&site_url=http://www.mm.com"}, {"searchProviderIcon":"blog_catalog.png", "searchProviderName":"Blog Search", "searchQueryURL":"http://www.blogcatalog.com/topic/AAAA/"}];
//    mmToolbar.framework.fun_MinMaxCookie("check");
    jQuery("#mmToolbar_search_providers_back_1").mouseover(function () {
        jQuery(this).css("cursor", "pointer");
        jQuery(this).removeClass("mmToolbar_search_providers_normal");
        jQuery(this).addClass("mmToolbar_search_providers_over");
        if (jQuery("#mmToolbar_SearchProviders_1").attr("menu_opened") == "no") {
            jQuery(this).parent().find(".mmToolbar_tooltip").css("visibility", "visible");
        }
    }).mouseout(function () {
        jQuery(this).removeClass("mmToolbar_search_providers_over");
        jQuery(this).addClass("mmToolbar_search_providers_normal");
        jQuery(this).parent().find(".mmToolbar_tooltip").css("visibility", "hidden");
    }).click(function () {
        _fun_mm_openSearchProviders_1(jQuery(this));
    });
    jQuery(".mmToolbar_search_providers_menu .mmToolbar_search_menuItem_normal").click(function () {
        jQuery("#mmToolbar_SearchProviders_1").slideUp(300).attr("menu_opened", "no");
        var _sp = jQuery("#mmToolbar_SearchProviders_1").attr("selected_provider");
        var _item_index = jQuery(this).attr("index");
        if (_sp != _item_index) {
            jQuery("#mmToolbar_SearchProviders_1").attr("selected_provider", _item_index);
            var _bi = jQuery(this).find(".mmToolbar_menuImg").attr("src");
            jQuery("#mmToolbar_search_providers_1").find("#mmToolbar_search_provider_icon_1").attr("src", _bi);
        }
    });
    jQuery("#mmToolbar_search_textbox_input_1").keydown(function (event) {
        if (event.keyCode == 13) {
            var _index = jQuery("#mmToolbar_SearchProviders_1").attr("selected_provider");
            var _searchQuery = jQuery(this).val();
            if (_searchQuery == "Search..") {
            } else {
                fun_mm_Search_1(_index, _searchQuery);
            }
        }
    });
    jQuery("#mmToolbar_search_textbox_button_1").mouseover(function () {
        jQuery(this).css("cursor", "pointer");
    }).click(function () {
        var _index = jQuery("#mmToolbar_SearchProviders_1").attr("selected_provider");
        var _searchQuery = jQuery("#mmToolbar_search_textbox_input_1").val();
        if (_searchQuery == "Search..") {
        } else {
            fun_mm_Search_1(_index, _searchQuery);
        }
    });
    jQuery("#mmToolbar_search_textbox_input_1").focus(function () {
        if (jQuery(this).val() == jQuery(this).attr("defaultValue")) {
            jQuery(this).removeClass().addClass("mmToolbar_searchbox_on").addClass("mmToolbar_search_textbox_input");
            jQuery(this).val("");
        }
    }).blur(function () {
        if (jQuery(this).val() == "") {
            jQuery(this).removeClass().addClass("mmToolbar_searchbox_default").addClass("mmToolbar_search_textbox_input");
            jQuery(this).val(jQuery(this).attr("defaultValue"));
        }
    });
    jQuery(".mmToolbar_SearchmenuItem_normal").mouseover(function () {
        jQuery(this).css("cursor", "pointer");
        jQuery(this).removeClass("mmToolbar_SearchmenuItem_normal");
        jQuery(this).addClass("mmToolbar_SearchmenuItem_over");
    }).mouseout(function () {
        jQuery(this).removeClass("mmToolbar_SearchmenuItem_over");
        jQuery(this).addClass("mmToolbar_SearchmenuItem_normal");
    }).click(function () {
        var menuItem = jQuery(this);
        index = menuItem.attr("index");
        jQuery("#mmToolbar_SearchProviders_1").slideUp(300).attr("menu_opened", "no");
        var _sp = jQuery("#mmToolbar_SearchProviders_1").attr("selected_provider");
        var _item_index = index;
        if (_sp != _item_index) {
            jQuery("#mmToolbar_SearchProviders_1").attr("selected_provider", _item_index);
            var _bi = menuItem.find(".mmToolbar_menuImg").attr("src");
            jQuery("#mmToolbar_search_providers_1").find("#mmToolbar_search_provider_icon_1").attr("src", _bi);
        }
    });

    jQuery(".mmToolbar_right_normal").mouseover(function () {
        jQuery(this).css("cursor", "pointer").removeClass().addClass("mmToolbar_right_over");
    }).mouseout(function () {
        jQuery(this).removeClass().addClass("mmToolbar_right_normal");
    }).click(function () {
        alert('just a test测试一把');
        var _action_options = {actionType:"minimize"};
//        mmToolbar.framework.fun_RegisterAction(21, 0);
//        mmToolbar.framework.fun_mmToolbar_toggle();
    });
    
    jQuery("#mmToolbar_translate_container_2").mouseover(function () {
        if (jQuery(this).find(".mmToolbar_menu").attr("menu_opened") == "no") {
            jQuery(this).css("cursor", "pointer");
            jQuery(this).removeClass("mmToolbar_item_normal");
            jQuery(this).addClass("mmToolbar_item_over");
            jQuery(this).parent().find(".mmToolbar_tooltip").css("visibility", "visible");
        }
    }).mouseout(function () {
        jQuery(this).removeClass("mmToolbar_item_over");
        jQuery(this).addClass("mmToolbar_item_normal");
        jQuery(this).parent().find(".mmToolbar_tooltip").css("visibility", "hidden");
    }).click(function () {
        mmToolbar.framework.fun_RegisterAction(5, 0);
        OpenTranslateMenu_2(jQuery(this));
    });
    jQuery(".mmToolbar_TranslateMenuItem").mouseover(function () {
        jQuery(this).css("cursor", "pointer");
        jQuery(this).removeClass("mmToolbar_menuItem_normal");
        jQuery(this).addClass("mmToolbar_menuItem_over");
    }).mouseout(function () {
        jQuery(this).removeClass("mmToolbar_menuItem_over");
        jQuery(this).addClass("mmToolbar_menuItem_normal");
    }).click(function () {
        var _appId = jQuery(this).parent().attr("appId");
        _itemIndex = jQuery(this).attr("index");
        var _action_options = {itemIndex:_itemIndex, object:jQuery(this)};
        TranslatePage_2(_action_options);
    });

    jQuery(".mmToolbar_item_normal_11").mouseover(function () {
        if (jQuery(this).find(".mmToolbar_menu").attr("menu_opened") == "yes") {
        } else {
            jQuery(this).css("cursor", "pointer");
            jQuery(this).removeClass("mmToolbar_item_normal");
            jQuery(this).addClass("mmToolbar_item_over");
            jQuery(this).find(".mmToolbar_tooltip").css("visibility", "visible");
        }
    }).mouseout(function () {
        jQuery(this).removeClass("mmToolbar_item_over");
        jQuery(this).addClass("mmToolbar_item_normal");
        jQuery(this).find(".mmToolbar_tooltip").css("visibility", "hidden");
    }).click(function () {
        var _appId = jQuery(this).attr("appId");
        var _appType = jQuery(this).attr("appType");
        var _windowMethod = jQuery(this).attr("windowMethod");
        var _action_options = {actionType:"StandartItemClick", appId:_appId, appType:_appType, windowMethod:_windowMethod};
        //mmToolbar.framework.fun_RegisterAction(_appId, 0);
        fun_GeneralApp_11(_action_options);
    });
}

function aa(){
    jQuery(".mmToolbar_minimized_right_normal").mouseover(function () {
        jQuery(this).css("cursor", "pointer").removeClass().addClass("mmToolbar_minimized_right_over");
    }).mouseout(function () {
        jQuery(this).removeClass().addClass("mmToolbar_minimized_right_normal");
    }).click(function () {
        var _action_options = {actionType:"maximize"};
        mmToolbar.framework.fun_RegisterAction(22, 0);
        mmToolbar.framework.fun_mmToolbar_toggle();
    });
    jQuery("#mmToolbar_minimized_center").mouseover(function () {
        jQuery(this).css("cursor", "pointer");
        jQuery(".mmToolbar_minimized_right_normal").removeClass().addClass("mmToolbar_minimized_right_over");
    }).mouseout(function () {
        jQuery(".mmToolbar_minimized_right_over").removeClass().addClass("mmToolbar_minimized_right_normal");
    }).click(function () {
        jQuery(".mmToolbar_minimized_right_over").removeClass().addClass("mmToolbar_minimized_right_normal");
        var _action_options = {actionType:"maximize"};
        mmToolbar.framework.fun_RegisterAction(22, 0);
        mmToolbar.framework.fun_mmToolbar_toggle();
    });
    jQuery("#mmToolbar_navigator_recent_3").mouseover(function () {
        jQuery(this).css("cursor", "pointer");
        jQuery(this).find(".mmToolbar_tooltip").css("visibility", "visible");
    }).mouseout(function () {
        jQuery(this).find(".mmToolbar_tooltip").css("visibility", "hidden");
    }).click(function () {
        mmToolbar.framework.fun_RegisterAction(7, 0);
        mmToolbar.framework.fun_RegisterAction(24, 0);
        _fun_OpenResentPostMenu_3();
    });
    jQuery("#mmToolbar_navigator_rand_3").mouseover(function () {
        jQuery(this).css("cursor", "pointer");
        jQuery(this).find(".mmToolbar_tooltip").css("visibility", "visible");
    }).mouseout(function () {
        jQuery(this).find(".mmToolbar_tooltip").css("visibility", "hidden");
    }).click(function () {
        _fun_GoToRandomPost_3();
        mmToolbar.framework.fun_RegisterAction(7, 0);
        mmToolbar.framework.fun_RegisterAction(25, 0);
    });
    jQuery(".mmToolbar_item_normal_5").mouseover(function () {
        if (jQuery(this).find(".mmToolbar_menu").attr("menu_opened") == "yes") {
        } else {
            jQuery(this).css("cursor", "pointer");
            jQuery(this).removeClass("mmToolbar_item_normal");
            jQuery(this).addClass("mmToolbar_item_over");
            jQuery(this).find(".mmToolbar_tooltip").css("visibility", "visible");
        }
    }).mouseout(function () {
        jQuery(this).removeClass("mmToolbar_item_over");
        jQuery(this).addClass("mmToolbar_item_normal");
        jQuery(this).find(".mmToolbar_tooltip").css("visibility", "hidden");
    }).click(function () {
        var _appId = jQuery(this).attr("appId");
        var _appType = jQuery(this).attr("appType");
        var _windowMethod = jQuery(this).attr("windowMethod");
        var _action_options = {actionType:"StandartItemClick", appId:_appId, appType:_appType, windowMethod:_windowMethod};
        mmToolbar.framework.fun_RegisterAction(_appId, 0);
        fun_GeneralApp_5(_action_options);
    });
    jQuery(".mmToolbar_item_normal_6").mouseover(function () {
        if (jQuery(this).find(".mmToolbar_menu").attr("menu_opened") == "yes") {
        } else {
            jQuery(this).css("cursor", "pointer");
            jQuery(this).removeClass("mmToolbar_item_normal");
            jQuery(this).addClass("mmToolbar_item_over");
            jQuery(this).find(".mmToolbar_tooltip").css("visibility", "visible");
        }
    }).mouseout(function () {
        jQuery(this).removeClass("mmToolbar_item_over");
        jQuery(this).addClass("mmToolbar_item_normal");
        jQuery(this).find(".mmToolbar_tooltip").css("visibility", "hidden");
    }).click(function () {
        var _appId = jQuery(this).attr("appId");
        var _appType = jQuery(this).attr("appType");
        var _windowMethod = jQuery(this).attr("windowMethod");
        var _action_options = {actionType:"StandartItemClick", appId:_appId, appType:_appType, windowMethod:_windowMethod};
        mmToolbar.framework.fun_RegisterAction(_appId, 0);
        fun_GeneralApp_6(_action_options);
    });
    if (typeof (mmToolbar.Notifier.notification.text) != "undefined") {
        var _COOKIE_NAME = "mmNoughty";
        var _OPTIONS = {path:"/", expires:60};
        var type = 0;
        var cookie = jQuery.cookie(_COOKIE_NAME);
        if (cookie == null) {
            if (typeof (mmToolbar.Notifier.notification.text) != "undefined" && cookie == null || cookie != mmToolbar.Notifier.notification.msgId) {
                jQuery.cookie(_COOKIE_NAME, mmToolbar.Notifier.notification.msgId, _OPTIONS);
                type = 1;
            }
            fun_ShowNotificationPop(type);
        } else {
            if (typeof (mmToolbar.Notifier.notification.text) != "undefined") {
                if (cookie != mmToolbar.Notifier.notification.msgId) {
                    jQuery.cookie(_COOKIE_NAME, mmToolbar.Notifier.notification.msgId, _OPTIONS);
                    type = 1;
                    fun_ShowNotificationPop(type);
                }
            }
        }
    }
    jQuery(".mmToolbar_item_normal_8").mouseover(function () {
        if (jQuery(this).find(".mmToolbar_menu").attr("menu_opened") == "yes") {
        } else {
            jQuery(this).css("cursor", "pointer");
            jQuery(this).removeClass("mmToolbar_item_normal");
            jQuery(this).addClass("mmToolbar_item_over");
            jQuery(this).find(".mmToolbar_tooltip").css("visibility", "visible");
        }
    }).mouseout(function () {
        jQuery(this).removeClass("mmToolbar_item_over");
        jQuery(this).addClass("mmToolbar_item_normal");
        jQuery(this).find(".mmToolbar_tooltip").css("visibility", "hidden");
    }).click(function () {
        var _appId = jQuery(this).attr("appId");
        var _appType = jQuery(this).attr("appType");
        var _windowMethod = jQuery(this).attr("windowMethod");
        var _action_options = {actionType:"StandartItemClick", appId:_appId, appType:_appType, windowMethod:_windowMethod};
        mmToolbar.framework.fun_RegisterAction(_appId, 0);
        fun_GeneralApp_8(_action_options);
    });
}
function OpenTranslateMenu_2(TranslateObject) {
    var _translateMenu = TranslateObject.find(".mmToolbar_menu");
    if (_translateMenu.attr("menu_opened") == "yes") {
        mmToolbar.framework.CloseMenu(_translateMenu);
    } else {
        mmToolbar.framework.OpenMenu(_translateMenu);
    }
}
mmToolbar.framework.CloseMenu = function (menuObject) {
    menuObject.attr("menu_opened", "no");
    menuObject.find(".mmToolbar_panel_body").hide(1);
    menuObject.find(".mmToolbar_panel_header").hide(1);
    menuObject.slideUp(200);
};
mmToolbar.framework.OpenMenu = function (menuObject) {
    menuObject.parent().find(".mmToolbar_tooltip").css("visibility", "hidden");
    menuObject.attr("menu_opened", "yes").slideDown(300, function () {
        menuObject.find(".mmToolbar_panel_body").show(1);
        menuObject.find(".mmToolbar_panel_header").show(1);
        //fun_AddClickHandlerForBodyForMenu(jQuery(this));
    });
};
mmToolbar.framework.getViewportWidth = function () {
    var width = 0;
    if (typeof window.innerWidth != "undefined") {
        width = window.innerWidth;
    } else {
        if (typeof document.documentElement != "undefined" && typeof document.documentElement.clientWidth != "undefined" && document.documentElement.clientWidth !== 0) {
            width = document.documentElement.clientWidth;
        } else {
            width = document.getElementsByTagName("body")[0].clientWidth;
        }
    }
    return width;
};
mmToolbar.framework.getViewportHeight = function () {
    var height = 0;
    if (typeof window.innerWidth != "undefined") {
        height = window.innerHeight;
    } else {
        if (typeof document.documentElement != "undefined" && typeof document.documentElement.clientWidth != "undefined" && document.documentElement.clientWidth !== 0) {
            height = document.documentElement.clientHeight;
        } else {
            height = document.getElementsByTagName("body")[0].clientHeight;
        }
    }
    return height;
};
mmToolbar.framework.appendLightbox = function (name) {
    jQuery("body").append("<div id=\"TB_overlay\" class=\"TB_overlayBG\"></div>");
    if (typeof document.body.style.maxHeight === "undefined") {
        jQuery("body", "html").css({height:"100%", width:"100%"});
        jQuery("html").css("overflow", "hidden");
    }
    jQuery("#TB_overlay").addClass("TB_overlayBG");
    jQuery("#TB_overlay").click(function () {
        jQuery(name).remove();
        mmToolbar.framework.remove_lightbox();
    });
};
mmToolbar.framework.remove_lightbox = function () {
    jQuery("#TB_overlay").fadeOut(100, function () {
        jQuery(this).remove();
    });
};

mmToolbar.framework.openWiwi = function (options) {
    var _height = options.dimentions.height.toString();
    var _Pres_position = _height.indexOf("%");
    if (_Pres_position != -1) {
        _height = _height.substring(0, _Pres_position);
        _height = mmToolbar.framework.getViewportHeight() * (_height / 100);
    } else {
        _height = Number(_height);
    }
    mmToolbar.framework.remove_lightbox();
    var _wiwi;
    switch (options.actionType) {
      case "Link":
        switch (options.windowType) {
          case 0:
            var _link_content;
            if (jQuery("#" + options.name).size() === 0) {
                _wiwi = mmToolbar.framework.createWiwi("body", options, false);
                _link_content = "<iframe frameborder=\"0\" SCROLLING=\"" + options.scroll + "\" allowtransparency=\"true\" src=\"" + options.link + "\" width=\"" + options.dimentions.width + "\" height=\"" + _height + "\" style=\"";
                if (options.scroll == "YES") {
                    _link_content += "overflow-y: scroll;overflow-x: hidden;\"></iframe>";
                } else {
                    _link_content += "overflow: hidden;\"></iframe>";
                }
                _wiwi.fadeIn(500, function () {
                    jQuery(this).find(".mmToolbar_wiwi_body").html(_link_content);
                });
            }
            break;
          case 1:
            _numberOfOpenWindows = jQuery("#" + options.name).size();
            if (_numberOfOpenWindows > 0) {
                mmToolbar.framework.close_wiwi(jQuery("#" + options.name), "slide_down");
                mmToolbar.framework.remove_lightbox();
            } else {
                _wiwi = mmToolbar.framework.createWiwi("body", options, false);
                _link_content = "<iframe frameborder=\"0\" SCROLLING=\"" + options.scroll + "\" allowtransparency=\"true\" src=\"" + options.link + "\" width=\"100%\" height=\"100%\" style=\"";
                if (options.scroll == "YES") {
                    _link_content += "overflow-y: scroll;overflow-x: hidden;\"></iframe>";
                } else {
                    _link_content += "overflow: hidden;\"></iframe>";
                }
                mmToolbar.framework.appendLightbox("#" + options.name);
                _wiwi.fadeIn(500, function () {
                    jQuery(this).find(".mmToolbar_wiwi_body").html(_link_content);
                });
            }
            break;
          case 2:
            window.open(options.link, "mmToolbarNewWindow", "scrollbars=1,location=1,resizable=1,height=" + _height + ",width=" + options.dimentions.width + "");
            break;
          case 3:
            window.location = options.link;
            break;
        }
        break;
      case "Code":
        _numberOfOpenWindows = jQuery("#" + options.name).size();
        if (_numberOfOpenWindows > 0) {
            mmToolbar.framework.close_wiwi(jQuery("#" + options.name), "slide_down");
            mmToolbar.framework.remove_lightbox();
        } else {
            _wiwi = mmToolbar.framework.createWiwi("body", options, false);
            var _code_content = options.code;
            _wiwi.fadeIn(500, function () {
                jQuery(this).find(".mmToolbar_wiwi_body").html(_code_content);
            });
        }
        break;
    }
};
mmToolbar.framework.remove_lightbox = function () {
    jQuery("#TB_overlay").fadeOut(100, function () {
        jQuery(this).remove();
    });
};
mmToolbar.framework.close_all_wiwis = function () {
    jQuery(".mmToolbar_window[id!=mmToolbar_window_template]").each(function () {
        mmToolbar.framework.close_wiwi(jQuery(this), "slide_down");
    });
};
mmToolbar.framework.close_wiwi = function (wiwi, type) {
    if (type == "slide_down") {
        wiwi.find("#mmToolbar_window_content").html("&nbsp;");
        wiwi.animate({"bottom":"-1000px"}, 500, "linear", function () {
            wiwi.remove();
        });
    }
    if (type == "fade_out") {
        wiwi.find("#mmToolbar_window_content").html("&nbsp;");
        wiwi.fadeOut(400, function () {
            wiwi.remove();
        });
    } else {
        wiwi.remove();
    }
};
mmToolbar.framework.createWiwi = function (container, options, withPopout) {
    var _height = options.dimentions.height.toString();
    var _Pres_position = _height.indexOf("%");
    if (_Pres_position != -1) {
        _height = _height.substring(0, _Pres_position);
        _height = mmToolbar.framework.getViewportHeight() * (_height / 100);
    } else {
        _height = Number(_height);
    }
    mmToolbar.framework.close_all_wiwis();
    var _newWiwi = jQuery("#mmToolbar_window_template").clone();
    _newWiwi.attr("id", options.name);
    _newWiwi.css("width", (options.dimentions.width + 14) + "px");
    _newWiwi.css("height", (_height + 61) + "px");
    _newWiwi.css("z-index", mmToolbar.framework.currentZIndex++);
    _newWiwi.find(".mmToolbar_wiwi_main").css("width", options.dimentions.width);
    _newWiwi.find(".mmToolbar_wiwi_main").css("height", _height + 47);
    _newWiwi.find(".mmToolbar_wiwi_body").css("height", _height);
    _newWiwi.find(".mmToolbar_wiwi_caption").text(options.title);
    _newWiwi.find(".mmToolbar_wiwi_icon").attr("src", options.icon);
    _newWiwi = mmToolbar.framework.positionWiwi(_newWiwi, options);
    _newWiwi.find(".mmToolbar_wiwi_close_a").click(function () {
        mmToolbar.framework.close_wiwi(jQuery("#" + options.name), "fade_out");
        mmToolbar.framework.remove_lightbox();
    });
    _newWiwi.find(".mmToolbar_wiwi_close_window").click(function () {
        mmToolbar.framework.close_wiwi(jQuery("#" + options.name), "fade_out");
        mmToolbar.framework.remove_lightbox();
    });
    jQuery(container).append(_newWiwi);
    return _newWiwi;
};
mmToolbar.framework.positionWiwi = function (_wiwi, options) {
    var _l = null;
    var _b = null;
    var _r = null;
    if (typeof (options.position) != "undefined") {
        if (typeof (options.position.left) != "undefined") {
            _l = options.position.left;
        } else {
            if (typeof (options.position.right) != "undefined") {
                _r = options.position.right;
            }
        }
        if (typeof (options.position.bottom) != "undefined") {
            _b = options.position.bottom;
        }
    }
    if (_l === null && _r === null) {
        _l = ((mmToolbar.framework.getViewportWidth() - options.dimentions.width) / 2) + "px";
    }
    if (_b === null) {
        _b = ((mmToolbar.framework.getViewportHeight() - options.dimentions.height) / 2) + "px";
    }
    if (_r === null) {
        _wiwi.css({"bottom":_b, "left":_l, "display":"none"});
    } else {
        _wiwi.css({"bottom":_b, "right":_r, "display":"none"});
    }
    return _wiwi;
};

function fun_GeneralApp_11(_action_options) {
    if (jQuery("#appWin_11").length > 0) {
        jQuery("#appWin_11").find(".mmToolbar_wiwi_close_a").trigger("click");
    } else {
        var _action_options = {actionType:"Link", name:"appWin_11", title:"Games", windowType:0, link:mmToolbar.framework.LinkDataReplacorNoData("http://www.163.com/?special_height=490&embed_key=03310f225a"), scroll:"NO", code:"", dimentions:{width:650, height:490}, icon:"http://toolbar.mm.com/Graphics/icons/Joystick1.png", position:{left:(mmToolbar.framework.getViewportWidth() - 650) / 2, bottom:30}};
        mmToolbar.framework.openWiwi(_action_options);
    }
//    if (26 == 20) {
//        var _url_clean = escape(location.href.replace(/http:\/\//g, ""));
//        _url_clean = _url_clean.replace(/\//g, "%25252f");
//        var _backtype_connect = "http://www.backtype.com/connect/" + _url_clean;
//        var _backtype_link = "<a href=\"" + _backtype_connect + "\" target=\"_blank\" style=\"background: none; width:400px;display:inline\" class=\"mmToolbar_wiwi_footerlink\">Twitter Buzz <img src=\"http://cdn.cloudfiles.mosso.com/c118731/backtype-badge-white.gif\" border=\"0\" style=\"display:inline; vertical-align:bottom; margin-top:1px\"/></a>";
//        jQuery("#appWin_11").find(".mmToolbar_wiwi_footer").append(_backtype_link);
//    }
}
mmToolbar.framework.LinkDataReplacorNoData = function (link) {
    var tbid = mmToolbar.id;
    var pagetitle = document.title;
    var url = window.location.href;
    link = link.replace(/mm_TBID/g, tbid);
    link = link.replace(/mm_PAGETITLE/g, pagetitle);
    link = link.replace(/mm_URL/g, url);
    return link;
};
function _fun_mm_openSearchProviders_1(object) {
    if (jQuery("#mmToolbar_SearchProviders_1").attr("menu_opened") == "yes") {
        jQuery(".mmToolbar_SearchProviders_1").slideUp(300).attr("menu_opened", "no");
    } else {
        object.parent().find(".mmToolbar_tooltip").css("visibility", "hidden");
        jQuery("#mmToolbar_SearchProviders_1").slideDown(300, function () {
            fun_AddClickHandlerForBody(jQuery(this));
        }).attr("menu_opened", "yes");
    }
}
fun_AddClickHandlerForBody = function (Wiwi) {
    jQuery("body").click(function () {
        Wiwi.slideUp(300, function () {
            Wiwi.attr("menu_opened", "no");
            if (Wiwi.attr("id") == "mmToolbar_share_menu") {
                Wiwi.remove();
            }
        });
        jQuery("body").unbind("click");
    });
};
function fun_mm_Search_1(_index, _searchQuery) {
    if (jQuery(".mmToolbar_window").length > 0) {
        jQuery(".mmToolbar_wiwi_close_a").trigger("click");
    }
    mmToolbar.framework.fun_RegisterAction(4, 0);
    var _action_options = {actionType:"Link", name:"Search_" + _index, title:searchProviders[_index].searchProviderName, windowType:1, link:searchProviders[_index].searchQueryURL.replace(/aaaa/gi, _searchQuery), scroll:"YES", dimentions:{width:800, height:mmToolbar.framework.getViewportHeight() * 0.8}};
    mmToolbar.framework.openWiwi(_action_options);
}
mmToolbar.framework.fun_RegisterAction = function (_aplicationId, _type) {
    jQuery.get("http://toolbar.wibiya.com/Handlers/StatActionHandler.php", {AppId:_aplicationId, toolbarId:mmToolbar.id, type:0}, function () {
    }, "jsonp");
};
function TranslatePage_2(_options) {
    var translateNodes_2 = [{"name":"English", "url":"http://translate.google.com/translate?hl=en&u=urladdres"}, {"name":"Spanish", "url":"http://translate.google.com/translate?hl=es&u=urladdres"}, {"name":"Chinese", "url":"http://translate.google.com/translate?hl=zh-CN&u=urladdres"}, {"name":"Japanese", "url":"http://translate.google.com/translate?hl=ja&u=urladdres"}, {"name":"German", "url":"http://translate.google.com/translate?hl=de&u=urladdres"}, {"name":"French", "url":"http://translate.google.com/translate?hl=fr&u=urladdres"}, {"name":"Italian", "url":"http://translate.google.com/translate?hl=it&u=urladdres"}, {"name":"Korean", "url":"http://translate.google.com/translate?hl=ko&u=urladdres"}, {"name":"Russian", "url":"http://translate.google.com/translate?hl=ru&u=urladdres"}, {"name":"Portuguese", "url":"http://translate.google.com/translate?hl=pt&u=urladdres"}, {"name":"Dutch", "url":"http://translate.google.com/translate?hl=nl&u=urladdres"}];
    var _link = translateNodes_2[_options.itemIndex].url.replace(/urladdres/gi, document.URL);
    setTimeout("window.location = \"" + _link + "\";", 1000);
}
