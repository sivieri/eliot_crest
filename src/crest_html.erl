%% Copyright (c) 2012,2013 Stefano Ciampiconi, Gioele Brenz Verca
%% 
%% This file is part of CREST-Erlang.
%% 
%% CREST-Erlang is free software: you can redistribute it and/or modify
%% it under the terms of the GNU Lesser General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%% 
%% CREST-Erlang is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU Lesser General Public License for more details.
%% 
%% You should have received a copy of the GNU Lesser General Public License
%% along with CREST-Erlang. If not, see <http://www.gnu.org/licenses/>.
%% 
%% @author Stefano Ciampiconi, Gioele Brenz Verca <>
%% @doc Web API for crest.
%% Autogenerated by MochiWeb.
%% @copyright 2012,2013 Ciampiconi, Gioele Brenz Verca

-module(crest_html).
-export([create_html_form/1, fill_form/1]).

create_html_form(Form) ->
	[Key,Title,Operation,Body] = Form,
	Html = "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"><html><head><title >CREST - Manager</title></head><body><h1>"++ Title ++"</h1></br><form id=\"launchform\" method=\""++ Operation ++"\" action=\"/crest/url/"++ Key ++"/\" enctype=\"multipart/form-data\">"++ fill_form(Body) ++"<input type=\"submit\" name=\"launchsubmit\" value=\"Launch Computation\" /></form></body></html>".

fill_form(Body) ->
	case Body of
		[] ->
			"";
		_ ->
			[H|T] = Body,
			case H of
				{Name, "integer()"} ->
					"<label for=\""++ Name ++"\">"++ Name ++": </label><input type=\"text\" name=\""++ Name ++"\" value=\"\"/></br>" ++ fill_form(T);
				{Name, "string()"} ->
					"<label for=\""++ Name ++"\">"++ Name ++": </label><textarea name=\""++ Name ++"\" value=\"\" cols=\"60\" rows=\"5\"></textarea></br>" ++ fill_form(T);
				{Name, "text()"} ->
					"</br>" ++ fill_form(T);
				{Name, "bolean()"} ->
					"</br>" ++ fill_form(T);
				_ ->
					"<h2>FILL ERROR</h2></br>" ++ fill_form(T)
			end
	end.
