package com.mmstart.toolbar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/toolbar")
public class ToolbarController {
	@Autowired
	ToolbarDAO tbDAO;

	@RequestMapping("/list")
	String list(Model model) {
		 tbDAO.save(new Toolbar("guestbook"));
		model.addAttribute("list", tbDAO.findAll(Toolbar.class));
		return "/toolbar/list";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String toolbar(@PathVariable
	Long id, Model model) {
		model.addAttribute("item", tbDAO.findById(Toolbar.class, id));
		model.addAttribute("ToolbarHTML",
				"<table id=\"mmToolbar_tbl\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">" +
				"<tbody><tr>" +
				"<td id=\"mmToolbar_left_wrapper\" align=\"right\" class=\"mmToolbar_td\"><div id=\"mmToolbar_left\" class=\"mmToolbar_td\"></div></td>" +
				"<td id=\"mmToolbar_center\" class=\"mmToolbar_td\" valign=\"bottom\" style=\"padding-top: 4px\">" +
				"<div class=\"itemLeft\">" +
				"	<div id=\"mmToolbar_search_container_1\" class=\"mmToolbar_search_container\" appId=\"4\">" +
				"		<div id=\"mmToolbar_search_providers_back_1\" class=\"mmToolbar_search_providers_normal mmToolbar_search_providers_back\">" +
				"			<div id=\"mmToolbar_search_providers_1\" class=\"mmToolbar_search_providers\" style=\"overflow: hidden\">" +
				"				<div id=\"mmToolbar_search_providers_icon_1\" class=\"mmToolbar_search_providers_icon\">" +
				"					<img width=\"16\" height=\"16\" id=\"mmToolbar_search_provider_icon_1\" class=\"mmToolbar_search_provider_icon\" src=\"http://www.wibiya.com/images/icons/wibiya_logo.png\" />" +
				"				</div>" +
				"				<div id=\"mmToolbar_search_providers_arrow_1\" class=\"mmToolbar_search_providers_arrow\">&nbsp;</div>" +
				"			</div>" +
				"		</div>" +
				"		<div id=\"mmToolbar_search_textbox_back_1\" class=\"mmToolbar_search_textbox_on mmToolbar_search_textbox_back\">" +
				"			<input type=\"text\" name=\"mmSearchQuery\" id=\"mmToolbar_search_textbox_input_1\" defaultValue=\"Search...\" class=\"mmToolbar_searchbox_default mmToolbar_search_textbox_input\" value=\"搜索...\" />" +
				"			<div class=\"mmToolbar_search_textbox_button\" id=\"mmToolbar_search_textbox_button_1\"></div>" +
				"		</div>" +
				"		<div class=\"mmToolbar_tooltip mmToolbar_tooltip_left\" style=\"visibility: hidden\"><span class=\"mmToolbar_tooltip_text\">切换</span></div>" +
				"		<div selected_provider=\"0\" menu_opened=\"no\" id=\"mmToolbar_SearchProviders_1\" class=\"mmToolbar_search_menu\" style=\"display: none\">" +
				"			<ul id=\"mmToolbar_search_providers_menu_1\" class=\"mmToolbar_Menu_UL\" appId=\"4\">" +
				"			<li class=\"mmToolbar_SearchmenuItem_normal\" index=\"0\"><img src=\"http://www.wibiya.com/images/icons/mm_logo.png?1254995542084\" class=\"mmToolbar_menuImg\"/><span class=\"mmToolbar_menuText\">Support Search</span></li>" +
				"			<li class=\"mmToolbar_SearchmenuItem_normal\" index=\"1\"><img src=\"http://toolbar.wibiya.com/Graphics/icons/google.png\" class=\"mmToolbar_menuImg\"/><span class=\"mmToolbar_menuText\">Web Search</span></li>" +
				"			<li class=\"mmToolbar_SearchmenuItem_normal\" index=\"2\"><img src=\"http://toolbar.wibiya.com/Graphics/icons/blog_catalog.png\" class=\"mmToolbar_menuImg\"/><span class=\"mmToolbar_menuText\">Blog Search</span></li>" +
				"			</ul>" +
				"		</div>" +
				"	</div>" +
				"</div>" +
				"<div class=\"itemLeft\"><div class=\"mmToolbar_divider\"></div></div>" +
				"<div class=\"itemLeft\">" +
				"	<div id=\"mmToolbar_translate_container_2\" class=\"mmToolbar_item_normal\" appId=\"5\" appType=\"5\" windowMethod=\"\">" +
				"		<div class=\"mmToolbar_item5\" ></div>" +
				"		<span class=\"mmToolbar_itemText\">Translate</span>" +
				"		<div class=\"mmToolbar_tooltip mmToolbar_tooltip_left\" style=\"visibility: hidden\"><span class=\"mmToolbar_tooltip_text\">Translate this Page</span></div>" +
				"		<div menu_opened=\"no\" class=\"mmToolbar_menu\" style=\"display:none;\">" +
				"			<ul class=\"mmToolbar_Menu_UL\" appId=\"5\">" +
				"			<li class=\"mmToolbar_menuItem_normal mmToolbar_TranslateMenuItem\" index=\"0\"><div class=\"mmToolbar_translate_flag English\"></div><span class=\"mmToolbar_menuText\">English</span></li>" +
				"			<li class=\"mmToolbar_menuItem_normal mmToolbar_TranslateMenuItem\" index=\"1\"><div class=\"mmToolbar_translate_flag Spanish\"></div><span class=\"mmToolbar_menuText\">Spanish</span></li>" +
				"			<li class=\"mmToolbar_menuItem_normal mmToolbar_TranslateMenuItem\" index=\"2\"><div class=\"mmToolbar_translate_flag Chinese\"></div><span class=\"mmToolbar_menuText\">Chinese</span></li>" +
				"			<li class=\"mmToolbar_menuItem_normal mmToolbar_TranslateMenuItem\" index=\"3\"><div class=\"mmToolbar_translate_flag Japanese\"></div><span class=\"mmToolbar_menuText\">Japanese</span></li>" +
				"			<li class=\"mmToolbar_menuItem_normal mmToolbar_TranslateMenuItem\" index=\"4\"><div class=\"mmToolbar_translate_flag German\"></div><span class=\"mmToolbar_menuText\">German</span></li>" +
				"			</ul>" +
				"		</div>" +
				"	</div>" +
				"</div>" +
				"<div class=\"itemLeft\"><div class=\"mmToolbar_divider\"></div></div>" +
				"<div class=\"itemRight\">" +
				"	<div class=\"mmToolbar_item_normal_6\" appId=\"15\" appType=\"1\" windowMethod=\"1\">" +
				"		<div class=\"mmToolbar_item15\" ></div>" +
				"		<div class=\"mmToolbar_tooltip mmToolbar_tooltip_right\" style=\"visibility: hidden\"><span class=\"mmToolbar_tooltip_text\">Last Notifications</span></div>" +
				"	</div>" +
				"</div>" +
				"<div class=\"itemRight\"><div class=\"mmToolbar_divider\"></div></div>" +
				"<div class=\"itemRight\">" +
				"	<div class=\"mmToolbar_item_normal_8\" appId=\"27\" appType=\"2\" windowMethod=\"1\">" +
				"		<div class=\"mmToolbar_button mmToolbar_GeneralBtn\" appId=\"27\" appType=\"2\" windowMethod=\"1\">" +
				"			<div class=\"mmToolbar_icon fp\"></div>" +
				"			<span class=\"mmToolbar_itemText\">好玩儿</span>" +
				"			<div class=\"mmToolbar_tooltip mmToolbar_tooltip_right\" style=\"visibility: hidden\"><span class=\"mmToolbar_tooltip_text\">Visit \"The Next Web\" Fan Page</span></div>" +
				"		</div>" +
				"	</div>" +
				"</div>" +
				"<div class=\"itemRight\"><div class=\"mmToolbar_divider\"></div></div>" +
				"<div class=\"itemLeft\">" +
				"	<div class=\"mmToolbar_item_normal_11\" appId=\"26\" appType=\"2\" windowMethod=\"1\">" +
				"		<div class=\"mmToolbar_item26\" ></div>" +
				"		<span class=\"mmToolbar_itemText\">游戏</span>" +
				"		<div class=\"mmToolbar_tooltip mmToolbar_tooltip_left\" style=\"visibility: hidden\"><span class=\"mmToolbar_tooltip_text\">玩游戏 (powered by HeyZap)</span></div>" +
				"	</div>" +
				"</div>" +
				"<div class=\"itemLeft\"><div class=\"mmToolbar_divider\"></div></div>" +
				"</td>" +
				"<td id=\"mmToolbar_right\" class=\"mmToolbar_td mmToolbar_right_normal\" style=\"width:35px\"></td>" +
				"</tr></tbody>" +
				"</table>");
		model.addAttribute("MinimizedHTML", 
			"<table id=\"mmToolbar_min_tbl\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">" +
			"<tbody><tr>" +
			"<td width=\"30\" align=\"right\" class=\"mmToolbar_td\">" +
			"<div id=\"mmToolbar_left\"></div>" +
			"</td>" +
			"<td id=\"mmToolbar_minimized_center\" class=\"mmToolbar_td\" width=\"75\" style=\"width:75px\">" +
			"<div id=\"mmToolbar_minimized_content\">" +
			"<img src=\"http://www.mm.com/images/icons/mm_logo.png?1254995542084\" id=\"mmToolbar_minimized_favicon\" />" +
			"<span class=\"mmToolbar_itemText\">Tools</span>" +
			"</div>" +
			"</td>" +
			"<td id=\"mmToolbar_minimized_right\" class=\"mmToolbar_minimized_right_normal\" />" +
			"</tr></tbody></table>");
		model.addAttribute("TempWiwiHTML",
				"<div class=\"mmToolbar_wiwi_back\"></div>" +
				"<div class=\"mmToolbar_wiwi_main\" style=\"height:526px; width: 626px;\">" +
				"<div class=\"mmToolbar_wiwi_header\">" +
				"	<img class=\"mmToolbar_wiwi_icon\" src=\"http://www.mm.com/images/icons/mm_favicon.png\" />" +
				"	<div class=\"mmToolbar_wiwi_caption\">Header 模板</div>" +
				"	<div class=\"mmToolbar_wiwi_close\">" +
				"		<a href=\"javascript: void(0)\" class=\"mmToolbar_wiwi_close_a\">X</a>" +
				"	</div>" +
				"</div>" +
				"<div class=\"mmToolbar_wiwi_body\" style=\"height:478px\">" +
				"	<img class=\"mmToolbar_wiwi_loader\" src=\"http://www.mm.com/Graphics/loading.gif\" />" +
				"</div>" +
				"<div class=\"mmToolbar_wiwi_footer\">" +
				"	<a target=\"blank\" class=\"mmToolbar_wiwi_footerlink\" href=\"http://www.mm.com\" >Powered by</a>" +
				"<div>" +
				"<a href=\"javascript: void(0)\" class=\"mmToolbar_wiwi_close_window\" style=\"\">Close window</a>");

		return "/toolbar/toolbar";
	}

}
